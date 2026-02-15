#
# 滲透測試代理的多階段 Dockerfile
# 使用 Chainguard Wolfi 以獲得最小的攻擊面和供應鏈安全性

# 建置階段 - 安裝工具和相依性
FROM cgr.dev/chainguard/wolfi-base:latest AS builder

# 安裝 Wolfi 中可用的系統相依性
RUN apk update && apk add --no-cache \
    # 核心建置工具
    build-base \
    git \
    curl \
    wget \
    ca-certificates \
    # Go 工具的網路程式庫
    libpcap-dev \
    linux-headers \
    # 語言執行環境
    go \
    nodejs-22 \
    npm \
    python3 \
    py3-pip \
    ruby \
    ruby-dev \
    # Wolfi 中可用的安全工具
    nmap \
    # 其他實用工具
    bash

# 設定 Go 的環境變數
ENV GOPATH=/go
ENV PATH=$GOPATH/bin:/usr/local/go/bin:$PATH
ENV CGO_ENABLED=1

# 建立目錄
RUN mkdir -p $GOPATH/bin

# 安裝基於 Go 的安全工具
RUN go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
# 從 GitHub 安裝 WhatWeb（基於 Ruby 的工具）
RUN git clone --depth 1 https://github.com/urbanadventurer/WhatWeb.git /opt/whatweb && \
    chmod +x /opt/whatweb/whatweb && \
    gem install addressable && \
    echo '#!/bin/bash' > /usr/local/bin/whatweb && \
    echo 'cd /opt/whatweb && exec ./whatweb "$@"' >> /usr/local/bin/whatweb && \
    chmod +x /usr/local/bin/whatweb

# 安裝基於 Python 的工具
RUN pip3 install --no-cache-dir schemathesis

# 執行階段 - 最小化生產映像
FROM cgr.dev/chainguard/wolfi-base:latest AS runtime

# 僅安裝執行時相依性
USER root
RUN apk update && apk add --no-cache \
    # 核心實用工具
    git \
    bash \
    curl \
    ca-certificates \
    # 網路程式庫（執行時）
    libpcap \
    # 安全工具
    nmap \
    # 語言執行環境（最小化）
    nodejs-22 \
    npm \
    python3 \
    ruby \
    # Playwright 的 Chromium 瀏覽器和相依性
    chromium \
    # Chromium 需要的其他程式庫
    nss \
    freetype \
    harfbuzz \
    # 無頭瀏覽器的 X11 程式庫
    libx11 \
    libxcomposite \
    libxdamage \
    libxext \
    libxfixes \
    libxrandr \
    mesa-gbm \
    # 字型渲染
    fontconfig

# 從建置階段複製 Go 二進位檔案
COPY --from=builder /go/bin/subfinder /usr/local/bin/

# 從建置階段複製 WhatWeb
COPY --from=builder /opt/whatweb /opt/whatweb
COPY --from=builder /usr/local/bin/whatweb /usr/local/bin/whatweb

# 在執行階段安裝 WhatWeb Ruby 相依性
RUN gem install addressable

# 從建置階段複製 Python 套件
COPY --from=builder /usr/lib/python3.*/site-packages /usr/lib/python3.12/site-packages
COPY --from=builder /usr/bin/schemathesis /usr/bin/

# 為安全性建立非 root 使用者
RUN addgroup -g 1001 pentest && \
    adduser -u 1001 -G pentest -s /bin/bash -D pentest

# 設定工作目錄
WORKDIR /app

# 首先複製套件檔案以獲得更好的快取
COPY package*.json ./
COPY mcp-server/package*.json ./mcp-server/

# 安裝 Node.js 相依性（包括用於 TypeScript 建置的 devDependencies）
RUN npm ci && \
    cd mcp-server && npm ci && cd .. && \
    npm cache clean --force

# 複製應用程式原始碼
COPY . .

# 建置 TypeScript（首先是 mcp-server，然後是主專案）
RUN cd mcp-server && npm run build && cd .. && npm run build

# 建置後移除 devDependencies 以減少映像大小
RUN npm prune --production && \
    cd mcp-server && npm prune --production

# 為工作階段資料建立目錄並確保適當的權限
RUN mkdir -p /app/sessions /app/deliverables /app/repos /app/configs && \
    mkdir -p /tmp/.cache /tmp/.config /tmp/.npm && \
    chmod 777 /app && \
    chmod 777 /tmp/.cache && \
    chmod 777 /tmp/.config && \
    chmod 777 /tmp/.npm && \
    chown -R pentest:pentest /app

# 切換到非 root 使用者
USER pentest

# 設定環境變數
ENV NODE_ENV=production
ENV PATH="/usr/local/bin:$PATH"
ENV SHANNON_DOCKER=true
ENV PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1
ENV PLAYWRIGHT_CHROMIUM_EXECUTABLE_PATH=/usr/bin/chromium-browser
ENV npm_config_cache=/tmp/.npm
ENV HOME=/tmp
ENV XDG_CACHE_HOME=/tmp/.cache
ENV XDG_CONFIG_HOME=/tmp/.config

# 設定 Git 身份並信任所有目錄
RUN git config --global user.email "agent@localhost" && \
    git config --global user.name "Pentest Agent" && \
    git config --global --add safe.directory '*'

# 設定入口點
ENTRYPOINT ["node", "dist/shannon.js"]
