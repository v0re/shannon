# CLAUDE.md

用於防禦性安全分析的 AI 驅動滲透測試代理。透過結合偵察工具與 AI 驅動的程式碼分析來自動化漏洞評估。

## 命令

**前置需求：** Docker、`.env` 中的 Anthropic API 金鑰

```bash
# 設定
cp .env.example .env && edit .env  # 設定 ANTHROPIC_API_KEY

# 準備儲存庫（REPO 是 ./repos/ 內的資料夾名稱，不是絕對路徑）
git clone https://github.com/org/repo.git ./repos/my-repo
# 或符號連結：ln -s /path/to/existing/repo ./repos/my-repo

# 執行
./shannon start URL=<url> REPO=my-repo
./shannon start URL=<url> REPO=my-repo CONFIG=./configs/my-config.yaml

# 監控
./shannon logs                      # 即時工作者日誌
./shannon query ID=<workflow-id>    # 查詢工作流程進度
# Temporal Web UI：http://localhost:8233

# 停止
./shannon stop                      # 保留工作流程資料
./shannon stop CLEAN=true           # 完全清理包括卷

# 建置
npm run build
```

**選項：** `CONFIG=<file>`（YAML 設定）、`OUTPUT=<path>`（預設：`./audit-logs/`）、`PIPELINE_TESTING=true`（最小提示、10 秒重試）、`REBUILD=true`（強制 Docker 重新建置）、`ROUTER=true`（透過 [claude-code-router](https://github.com/musistudio/claude-code-router) 進行多模型路由）

## 架構

### 核心模組
- `src/session-manager.ts` — 代理定義、執行順序、並行群組
- `src/ai/claude-executor.ts` — Claude Agent SDK 整合，具有重試邏輯和 git 檢查點
- `src/config-parser.ts` — 使用 JSON Schema 驗證的 YAML 設定解析
- `src/error-handling.ts` — 分類的錯誤類型（PentestError、ConfigError、NetworkError）與重試邏輯
- `src/tool-checker.ts` — 在執行前驗證外部安全工具可用性
- `src/queue-validation.ts` — 交付成果驗證和代理前置條件

### Temporal 編排
具有崩潰恢復、可查詢進度、智能重試和並行執行（漏洞/利用階段中 5 個並發代理）的持久工作流程編排。

- `src/temporal/workflows.ts` — 主工作流程（`pentestPipelineWorkflow`）
- `src/temporal/activities.ts` — 具有心跳的活動實作
- `src/temporal/worker.ts` — 工作者入口點
- `src/temporal/client.ts` — 用於啟動工作流程的 CLI 客戶端
- `src/temporal/shared.ts` — 類型、介面、查詢定義
- `src/temporal/query.ts` — 用於進度檢查的查詢工具

### 五階段管線

1. **預偵察**（`pre-recon`）— 外部掃描（nmap、subfinder、whatweb）+ 原始碼分析
2. **偵察**（`recon`）— 從初始發現映射攻擊面
3. **漏洞分析**（5 個並行代理）— injection、xss、auth、authz、ssrf
4. **利用**（5 個並行代理，條件式）— 利用已確認的漏洞
5. **報告**（`report`）— 執行級別安全報告

### 支援系統
- **配置** — `configs/` 中的 YAML 設定，使用 JSON Schema 驗證（`config-schema.json`）。支援身份驗證設定、MFA/TOTP 和每個應用程式的測試參數
- **提示** — `prompts/` 中的每階段範本，具有變數替換（`{{TARGET_URL}}`、`{{CONFIG_CONTEXT}}`）。透過 `prompt-manager.ts` 在 `prompts/shared/` 中共享部分
- **SDK 整合** — 使用 `@anthropic-ai/claude-agent-sdk`，具有 `maxTurns: 10_000` 和 `bypassPermissions` 模式。用於瀏覽器自動化的 Playwright MCP、透過 MCP 工具產生 TOTP。`prompts/shared/login-instructions.txt` 中的登入流程範本支援表單、SSO、API 和基本身份驗證
- **審計系統** — `audit-logs/{hostname}_{sessionId}/` 中的崩潰安全僅附加日誌記錄。追蹤工作階段指標、每個代理日誌、提示和交付成果
- **交付成果** — 透過 `save_deliverable` MCP 工具儲存到目標儲存庫中的 `deliverables/`

## 開發注意事項

### 新增新代理
1. 在 `src/session-manager.ts` 中定義代理（新增到 `AGENT_QUEUE` 和並行群組）
2. 在 `prompts/` 中建立提示範本（例如，`vuln-newtype.txt`）
3. 在 `src/temporal/activities.ts` 中新增活動函式
4. 在適當階段的 `src/temporal/workflows.ts` 中註冊活動

### 修改提示
- 變數替換：`{{TARGET_URL}}`、`{{CONFIG_CONTEXT}}`、`{{LOGIN_INSTRUCTIONS}}`
- 透過 `prompt-manager.ts` 包含 `prompts/shared/` 中的共享部分
- 使用 `PIPELINE_TESTING=true` 進行快速迭代測試

### 關鍵設計模式
- **配置驅動** — 使用 JSON Schema 驗證的 YAML 設定
- **漸進式分析** — 每個階段建立在先前結果之上
- **SDK 優先** — Claude Agent SDK 處理自主分析
- **模組化錯誤處理** — 分類的錯誤與自動重試（每個代理 3 次嘗試）

### 安全性
僅限防禦性安全工具。僅在您擁有或已獲得明確許可測試的系統上使用。

## 程式碼風格指南

### 清晰度優於簡潔性
- 針對可讀性進行最佳化，而非行數 — 三行清晰的程式碼勝過一個密集的表達式
- 使用傳達意圖的描述性名稱
- 偏好明確的邏輯而非聰明的單行程式碼

### 結構
- 保持函式專注於單一職責
- 使用提前返回和守衛子句而非深層巢狀
- 永遠不要使用巢狀三元運算子 — 使用 if/else 或 switch
- 將複雜條件提取到命名良好的布林變數中

### TypeScript 慣例
- 對頂層函式使用 `function` 關鍵字（不是箭頭函式）
- 在匯出/頂層函式上使用明確的返回類型註解
- 對不應變更的資料偏好使用 `readonly`

### 避免
- 將多個關注點組合到單一函式中以「節省行數」
- 當順序邏輯更清晰時使用密集的回呼鏈
- 為了 DRY 而犧牲可讀性 — 如果更清晰，一些重複是可以的
- 為一次性操作進行抽象化

## 關鍵檔案

**入口點：** `src/temporal/workflows.ts`、`src/temporal/activities.ts`、`src/temporal/worker.ts`、`src/temporal/client.ts`

**核心邏輯：** `src/session-manager.ts`、`src/ai/claude-executor.ts`、`src/config-parser.ts`、`src/audit/`

**配置：** `shannon`（CLI）、`docker-compose.yml`、`configs/`、`prompts/`

## 疑難排解

- **「找不到儲存庫」** — `REPO` 必須是 `./repos/` 內的資料夾名稱，不是絕對路徑。首先在那裡複製或符號連結您的儲存庫：`ln -s /path/to/repo ./repos/my-repo`
- **「Temporal 未就緒」** — 等待健康檢查或 `docker compose logs temporal`
- **工作者未處理** — 檢查 `docker compose ps`
- **重設狀態** — `./shannon stop CLEAN=true`
- **本地應用程式無法存取** — 使用 `host.docker.internal` 而非 `localhost`
- **缺少工具** — 使用 `PIPELINE_TESTING=true` 跳過 nmap/subfinder/whatweb（優雅降級）
- **容器權限** — 在 Linux 上，docker 命令可能需要 `sudo`
