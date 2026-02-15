# Shannon - 您的全自動 AI 滲透測試工具

> [!NOTE]
> **[Shannon Lite 在無提示、源碼感知的 XBOW 基準測試中達到 96.15% 的成功率。&rarr;](https://github.com/KeygraphHQ/shannon/tree/main/xben-benchmark-results/README.md)**

<div align="center">

<a href="https://trendshift.io/repositories/15604" target="_blank"><img src="https://trendshift.io/api/badge/repositories/15604" alt="KeygraphHQ%2Fshannon | Trendshift" style="width: 250px; height: 55px;" width="250" height="55"/></a>

<img src="./assets/shannon-screen.png?v=2" alt="Shannon Screen" width="100%">

# Shannon 是您的全自動 AI 滲透測試工具

Shannon 的工作很簡單：在其他人之前破解您的網路應用程式。<br />
您的 vibe-coding 藍隊的紅隊。<br />
每個 Claude（程式設計師）都值得擁有他們的 Shannon。

---

[官方網站](https://keygraph.io) • [Discord 社群](https://discord.gg/KAqzSHHpRt)

---
</div>

## 🎯 什麼是 Shannon？

Shannon 是一個 AI 滲透測試工具，提供實際的攻擊利用，而不僅僅是警報。

Shannon 的目標是在其他人之前破解您的網路應用程式。它自主搜尋您程式碼中的攻擊向量，然後使用內建瀏覽器執行真實的攻擊利用，例如注入攻擊和身份驗證繞過，以證明漏洞確實可以被利用。

**Shannon 解決了什麼問題？**

得益於 Claude Code 和 Cursor 等工具，您的團隊不斷交付程式碼。但您的滲透測試呢？那一年只發生一次。這造成了*巨大*的安全缺口。在其他 364 天裡，您可能在不知不覺中將漏洞交付到生產環境。

Shannon 通過充當您的按需白盒滲透測試工具來彌補這一缺口。它不僅發現潛在問題，還執行真實的攻擊利用，提供漏洞的具體證明。這讓您可以自信地交付，知道每個版本都可以得到保護。

> [!NOTE]
> **從自主滲透測試到自動化合規**
>
> Shannon 是 **Keygraph 安全與合規平台**的核心組件。
>
> 雖然 Shannon 為您的應用程式自動化了滲透測試這一關鍵任務，但我們更廣泛的平台自動化了您的整個合規流程——從證據收集到審計準備。我們正在構建「網路安全領域的 Rippling」，一個管理您的安全態勢並簡化 SOC 2 和 HIPAA 等合規框架的單一平台。
>
> ➡️ **[了解更多關於 Keygraph 平台](https://keygraph.io)**

## 🎬 觀看 Shannon 實戰

**真實結果**：Shannon 在 OWASP Juice Shop 中發現了 20 多個關鍵漏洞，包括完整的身份驗證繞過和資料庫外洩。[查看完整報告 →](sample-reports/shannon-report-juice-shop.md)

![Demo](assets/shannon-action.gif)

## ✨ 特色功能

- **全自動操作**：使用單一命令啟動滲透測試。AI 處理從進階 2FA/TOTP 登入（包括使用 Google 登入）和瀏覽器導航到最終報告的所有內容，無需任何干預。
- **滲透測試級別的報告與可重現的攻擊利用**：提供專注於經過驗證的可利用發現的最終報告，配備複製貼上的概念驗證，以消除誤報並提供可操作的結果。
- **關鍵 OWASP 漏洞覆蓋**：目前識別並驗證以下關鍵漏洞：注入、XSS、SSRF 和身份驗證/授權破壞，更多類型正在開發中。
- **程式碼感知動態測試**：分析您的原始碼以智能引導其攻擊策略，然後對運行中的應用程式執行基於瀏覽器和命令列的實時攻擊利用，以確認現實世界的風險。
- **由整合安全工具提供支援**：通過利用領先的偵察和測試工具——包括 **Nmap、Subfinder、WhatWeb 和 Schemathesis**——增強其發現階段，對目標環境進行深入分析。
- **平行處理以獲得更快的結果**：更快地獲得您的報告。系統並行化最耗時的階段，同時運行所有漏洞類型的分析和利用。

## 📦 產品線

Shannon 提供兩個版本：

| 版本 | 授權 | 最適合 |
|---------|---------|----------|
| **Shannon Lite** | AGPL-3.0 | 安全團隊、獨立研究人員、測試您自己的應用程式 |
| **Shannon Pro** | 商業授權 | 需要進階功能、CI/CD 整合和專屬支援的企業 |

> **此儲存庫包含 Shannon Lite**，它使用我們的核心自主 AI 滲透測試框架。**Shannon Pro** 在此基礎上增強了進階的、由 LLM 驅動的資料流分析引擎（靈感來自 [LLMDFA 論文](https://arxiv.org/abs/2402.10754)），用於企業級程式碼分析和更深入的漏洞檢測。

> [!IMPORTANT]
> **僅限白盒測試。** Shannon Lite 專為**白盒（源碼可用）**應用程式安全測試而設計。  
> 它需要存取您的應用程式原始碼和儲存庫佈局。

[查看功能比較](./SHANNON-PRO.md)

## 📑 目錄

- [什麼是 Shannon？](#-什麼是-shannon)
- [觀看 Shannon 實戰](#-觀看-shannon-實戰)
- [特色功能](#-特色功能)
- [產品線](#-產品線)
- [設定與使用說明](#-設定與使用說明)
  - [前置需求](#前置需求)
  - [快速開始](#快速開始)
  - [監控進度](#監控進度)
  - [停止 Shannon](#停止-shannon)
  - [使用範例](#使用範例)
  - [設定（選用）](#設定選用)
  - [[實驗性 - 不支援] 路由器模式（替代提供者）](#實驗性---不支援-路由器模式替代提供者)
  - [輸出與結果](#輸出與結果)
- [範例報告](#-範例報告)
- [架構](#️-架構)
- [覆蓋範圍與路線圖](#-覆蓋範圍與路線圖)
- [免責聲明](#️-免責聲明)
- [授權](#-授權)
- [社群與支援](#-社群與支援)
- [聯絡我們](#-聯絡我們)

---

## 🚀 設定與使用說明

### 前置需求

- **Docker** - 容器執行環境 ([安裝 Docker](https://docs.docker.com/get-docker/))
- **AI 提供者憑證**（選擇其中一個）：
  - **Anthropic API 金鑰**（推薦）- 從 [Anthropic Console](https://console.anthropic.com) 取得
  - **Claude Code OAuth 權杖**
  - **[實驗性 - 不支援] 透過路由器模式的替代提供者** - 透過 OpenRouter 使用 OpenAI 或 Google Gemini（參見[路由器模式](#實驗性---不支援-路由器模式替代提供者)）

### 快速開始

```bash
# 1. 複製 Shannon
git clone https://github.com/KeygraphHQ/shannon.git
cd shannon

# 2. 設定憑證（選擇一種方法）

# 選項 A：匯出環境變數
export ANTHROPIC_API_KEY="your-api-key"              # 或 CLAUDE_CODE_OAUTH_TOKEN
export CLAUDE_CODE_MAX_OUTPUT_TOKENS=64000           # 推薦

# 選項 B：建立 .env 檔案
cat > .env << 'EOF'
ANTHROPIC_API_KEY=your-api-key
CLAUDE_CODE_MAX_OUTPUT_TOKENS=64000
EOF

# 3. 執行滲透測試
./shannon start URL=https://your-app.com REPO=your-repo
```

Shannon 將建置容器、啟動工作流程並返回工作流程 ID。滲透測試在背景執行。

### 監控進度

```bash
# 查看即時工作日誌
./shannon logs

# 查詢特定工作流程的進度
./shannon query ID=shannon-1234567890

# 開啟 Temporal Web UI 進行詳細監控
open http://localhost:8233
```

### 停止 Shannon

```bash
# 停止所有容器（保留工作流程資料）
./shannon stop

# 完全清理（移除所有資料）
./shannon stop CLEAN=true
```

### 使用範例

```bash
# 基本滲透測試
./shannon start URL=https://example.com REPO=repo-name

# 使用設定檔
./shannon start URL=https://example.com REPO=repo-name CONFIG=./configs/my-config.yaml

# 自訂輸出目錄
./shannon start URL=https://example.com REPO=repo-name OUTPUT=./my-reports
```

### 準備您的儲存庫

Shannon 期望目標儲存庫放置在專案根目錄的 `./repos/` 目錄下。`REPO` 標誌指的是 `./repos/` 內的資料夾名稱。將您想要掃描的儲存庫複製到 `./repos/`，或直接在那裡複製它：

```bash
git clone https://github.com/your-org/your-repo.git ./repos/your-repo
```

**對於 monorepo：**

```bash
git clone https://github.com/your-org/your-monorepo.git ./repos/your-monorepo
```

**對於多儲存庫應用程式**（例如，獨立的前端/後端）：

```bash
mkdir ./repos/your-app
cd ./repos/your-app
git clone https://github.com/your-org/frontend.git
git clone https://github.com/your-org/backend.git
git clone https://github.com/your-org/api.git
```

### 平台特定說明

**對於 Linux（原生 Docker）：**

根據您的 Docker 設定，您可能需要使用 `sudo` 執行命令。如果您遇到輸出檔案的權限問題，請確保您的使用者可以存取 Docker socket。

**對於 macOS：**

安裝 Docker Desktop 後即可立即使用。

**測試本地應用程式：**

Docker 容器無法存取主機上的 `localhost`。使用 `host.docker.internal` 代替 `localhost`：

```bash
./shannon start URL=http://host.docker.internal:3000 REPO=repo-name
```

### 設定（選用）

雖然您可以在沒有設定檔的情況下執行，但建立一個可以啟用經過身份驗證的測試和自訂分析。將您的設定檔放在 `./configs/` 目錄內——此資料夾會自動掛載到 Docker 容器中。

#### 建立設定檔

複製並修改範例設定：

```bash
cp configs/example-config.yaml configs/my-app-config.yaml
```

#### 基本設定結構

```yaml
authentication:
  login_type: form
  login_url: "https://your-app.com/login"
  credentials:
    username: "test@example.com"
    password: "yourpassword"
    totp_secret: "LB2E2RX7XFHSTGCK"  # 2FA 選用

  login_flow:
    - "在電子郵件欄位中輸入 $username"
    - "在密碼欄位中輸入 $password"
    - "點擊「登入」按鈕"

  success_condition:
    type: url_contains
    value: "/dashboard"

rules:
  avoid:
    - description: "AI 應避免測試登出功能"
      type: path
      url_path: "/logout"

  focus:
    - description: "AI 應強調測試 API 端點"
      type: path
      url_path: "/api"
```

#### 2FA 的 TOTP 設定

如果您的應用程式使用雙因素身份驗證，只需將 TOTP 密鑰新增到您的設定檔中。AI 將在測試期間自動產生所需的代碼。

### [實驗性 - 不支援] 路由器模式（替代提供者）

Shannon 可以實驗性地透過 claude-code-router 路由請求到替代 AI 提供者。此模式不受官方支援，主要用於：

* **模型實驗** — 嘗試使用 GPT-5.2 或 Gemini 3 系列模型的 Shannon

#### 快速設定

1. 將您的提供者 API 金鑰新增到 `.env`：

```bash
# 選擇一個提供者：
OPENAI_API_KEY=sk-...
# 或
OPENROUTER_API_KEY=sk-or-...

# 設定預設模型：
ROUTER_DEFAULT=openai,gpt-5.2  # 提供者,模型 格式
```

2. 使用 `ROUTER=true` 執行：

```bash
./shannon start URL=https://example.com REPO=repo-name ROUTER=true
```

#### 實驗性模型

| 提供者 | 模型 |
|----------|--------|
| OpenAI | gpt-5.2, gpt-5-mini |
| OpenRouter | google/gemini-3-flash-preview |

#### 免責聲明

此功能是實驗性的且不受支援。輸出品質在很大程度上取決於模型。Shannon 建立在 Anthropic Agent SDK 之上，並針對 Anthropic Claude 模型進行了最佳化和主要測試。替代提供者可能會產生不一致的結果（包括在早期階段如偵察失敗），具體取決於模型和路由設定。

### 輸出與結果

所有結果預設儲存到 `./audit-logs/{hostname}_{sessionId}/`。使用 `--output <path>` 指定自訂目錄。

輸出結構：
```
audit-logs/{hostname}_{sessionId}/
├── session.json          # 指標和工作階段資料
├── agents/               # 每個代理的執行日誌
├── prompts/              # 用於可重現性的提示快照
└── deliverables/
    └── comprehensive_security_assessment_report.md   # 最終綜合安全報告
```

---

## 📊 範例報告

> **尋找量化基準測試？** [查看完整的基準測試方法和結果 →](./xben-benchmark-results/README.md)

透過來自業界標準易受攻擊應用程式的滲透測試結果，了解 Shannon 的實戰能力：

#### 🧃 **OWASP Juice Shop** • [GitHub](https://github.com/juice-shop/juice-shop)

*由 OWASP 維護的一個著名的不安全網路應用程式，旨在測試工具發現各種現代漏洞的能力。*

**效能**：在單次自動執行中識別出目標 OWASP 類別中的**超過 20 個高影響漏洞**。

**主要成就**：

- **實現完整的身份驗證繞過**並透過注入攻擊外洩整個使用者資料庫
- **執行完整的權限提升**，透過註冊工作流程繞過建立新的管理員帳戶
- **識別並利用系統性授權缺陷（IDOR）**以存取和修改任何使用者的私人資料和購物車
- **發現伺服器端請求偽造（SSRF）**漏洞，實現內部網路偵察

📄 **[查看完整報告 →](sample-reports/shannon-report-juice-shop.md)**

---

#### 🔗 **c{api}tal API** • [GitHub](https://github.com/Checkmarx/capital)

*來自 Checkmarx 的一個故意易受攻擊的 API，旨在測試工具發現 OWASP API 安全 Top 10 的能力。*

**效能**：識別出**近 15 個關鍵和高嚴重性漏洞**，導致應用程式完全受損。

**主要成就**：

- **執行根級注入攻擊**，透過在隱藏的除錯端點中使用命令鏈繞過拒絕清單
- **實現完整的身份驗證繞過**，透過發現並針對遺留的、未修補的 v1 API 端點
- **將普通使用者提升為完整的管理員權限**，透過利用使用者個人資料更新功能中的大量賦值漏洞
- **展示高準確性**，透過正確確認應用程式強大的 XSS 防禦，報告零誤報

📄 **[查看完整報告 →](sample-reports/shannon-report-capital-api.md)**

---

#### 🚗 **OWASP crAPI** • [GitHub](https://github.com/OWASP/crAPI)

*來自 OWASP 的一個現代的、故意易受攻擊的 API，旨在對工具對抗 OWASP API 安全 Top 10 的有效性進行基準測試。*

**效能**：識別出**超過 15 個關鍵和高嚴重性漏洞**，實現應用程式完全受損。

**主要成就**：

- **使用多種進階 JWT 攻擊繞過身份驗證**，包括演算法混淆、alg:none 和弱金鑰（kid）注入
- **透過注入攻擊實現完整的資料庫受損**，從 PostgreSQL 資料庫外洩使用者憑證
- **執行關鍵的伺服器端請求偽造（SSRF）攻擊**，成功將內部身份驗證權杖轉發到外部服務
- **展示高準確性**，透過正確識別應用程式強大的 XSS 防禦，報告零誤報

📄 **[查看完整報告 →](sample-reports/shannon-report-crapi.md)**

---

*這些結果展示了 Shannon 超越簡單掃描的能力，執行深度情境利用，誤報最少且概念驗證可操作。*

---

## 🏗️ 架構

Shannon 使用複雜的多代理架構模擬人類滲透測試人員的方法。它在四個不同的階段中結合白盒原始碼分析和黑盒動態利用：

```
                    ┌──────────────────────┐
                    │        偵察          │
                    └──────────┬───────────┘
                               │
                               ▼
                    ┌──────────┴───────────┐
                    │          │           │
                    ▼          ▼           ▼
        ┌─────────────────┐ ┌─────────────────┐ ┌─────────────────┐
        │   漏洞分析      │ │   漏洞分析      │ │      ...        │
        │   (注入)        │ │     (XSS)       │ │                 │
        └─────────┬───────┘ └─────────┬───────┘ └─────────┬───────┘
                  │                   │                   │
                  ▼                   ▼                   ▼
        ┌─────────────────┐ ┌─────────────────┐ ┌─────────────────┐
        │     利用        │ │     利用        │ │      ...        │
        │   (注入)        │ │     (XSS)       │ │                 │
        └─────────┬───────┘ └─────────┬───────┘ └─────────┬───────┘
                  │                   │                   │
                  └─────────┬─────────┴───────────────────┘
                            │
                            ▼
                    ┌──────────────────────┐
                    │        報告          │
                    └──────────────────────┘
```

### 架構概述

Shannon 旨在模擬人類滲透測試人員的方法。它利用 Anthropic 的 Claude Agent SDK 作為其核心推理引擎，但其真正的優勢在於圍繞它建立的複雜多代理架構。此架構結合了**白盒原始碼分析**的深度情境與**黑盒動態利用**的現實世界驗證，由編排器透過四個不同的階段進行管理，以確保專注於最小化誤報和智能情境管理。

---

#### **階段 1：偵察**

第一階段建立應用程式攻擊面的全面地圖。Shannon 分析原始碼並與 Nmap 和 Subfinder 等工具整合，以了解技術堆疊和基礎設施。同時，它透過瀏覽器自動化執行實時應用程式探索，以將程式碼級洞察與現實世界行為相關聯，為下一階段產生所有入口點、API 端點和身份驗證機制的詳細地圖。

#### **階段 2：漏洞分析**

為了最大化效率，此階段並行操作。使用偵察資料，針對每個 OWASP 類別的專門代理並行搜尋潛在缺陷。對於注入和 SSRF 等漏洞，代理執行結構化資料流分析，追蹤使用者輸入到危險接收器。此階段產生一個關鍵交付成果：一個**假設可利用路徑**的清單，傳遞給下一階段進行驗證。

#### **階段 3：利用**

繼續並行工作流程以保持速度，此階段完全致力於將假設轉化為證明。專門的利用代理接收假設路徑並嘗試使用瀏覽器自動化、命令列工具和自訂腳本執行現實世界的攻擊。此階段執行嚴格的**「無利用，無報告」**政策：如果假設無法成功利用以展示影響，則將其作為誤報丟棄。

#### **階段 4：報告**

最後階段將所有經過驗證的發現編譯成專業的、可操作的報告。代理整合偵察資料和成功的利用證據，清理任何雜訊或幻覺偽影。僅包含經過驗證的漏洞，配備**可重現的、複製貼上的概念驗證**，提供專注於經過驗證的風險的最終滲透測試級別報告。

## 📋 覆蓋範圍與路線圖

有關 Shannon 安全測試覆蓋範圍和開發路線圖的詳細資訊，請參閱我們的[覆蓋範圍與路線圖](./COVERAGE.md)文件。

## ⚠️ 免責聲明

### 重要使用指南與免責聲明

在使用 Shannon（Lite）之前，請仔細閱讀以下指南。作為使用者，您對自己的行為負責並承擔所有責任。

#### **1. 潛在的變異效應與環境選擇**

這不是一個被動掃描器。利用代理旨在**主動執行攻擊**以確認漏洞。此過程可能對目標應用程式及其資料產生變異效應。

> [!WARNING]
> **⚠️ 請勿在生產環境中執行 Shannon。**
>
> - 它專門用於沙盒、暫存或本地開發環境，其中資料完整性不是問題。
> - 潛在的變異效應包括但不限於：建立新使用者、修改或刪除資料、損害測試帳戶以及觸發注入攻擊的意外副作用。

#### **2. 合法與道德使用**

Shannon 僅用於合法的安全審計目的。

> [!CAUTION]
> **您必須獲得目標系統所有者的明確書面授權**才能執行 Shannon。
>
> 未經授權掃描和利用您不擁有的系統是非法的，可能會根據《電腦詐欺和濫用法》（CFAA）等法律受到起訴。Keygraph 對 Shannon 的任何濫用概不負責。

#### **3. LLM 與自動化注意事項**

- **需要驗證**：雖然我們的「透過利用證明」方法已經進行了大量工程以消除誤報，但底層 LLM 仍然可能在最終報告中產生幻覺或支援不足的內容。**人工監督至關重要**，以驗證所有報告發現的合法性和嚴重性。
- **全面性**：由於 LLM 情境視窗的固有限制，Shannon Lite 中的分析可能不夠詳盡。為了對整個程式碼庫進行更全面的、基於圖形的分析，**Shannon Pro** 利用其進階資料流分析引擎來確保更深入和更徹底的覆蓋。

#### **4. 分析範圍**

- **目標漏洞**：Shannon Lite 的目前版本專門針對以下*可利用*漏洞類別：
  - 身份驗證與授權破壞
  - 注入
  - 跨站腳本攻擊（XSS）
  - 伺服器端請求偽造（SSRF）
- **Shannon Lite 不涵蓋的內容**：此清單並非所有潛在安全風險的詳盡清單。Shannon Lite 的「透過利用證明」模型意味著它不會報告無法主動利用的問題，例如易受攻擊的第三方程式庫或不安全的設定。這些類型的深度靜態分析發現是 **Shannon Pro** 中進階分析引擎的核心重點。

#### **5. 成本與效能**

- **時間**：截至目前版本，完整測試執行通常需要 **1 到 1.5 小時**才能完成。
- **成本**：使用 Anthropic 的 Claude 4.5 Sonnet 模型執行完整測試可能會產生約 **50 美元**的成本。成本因模型定價和應用程式複雜性而異。

#### **6. Windows 防毒軟體誤報**

Windows Defender 可能會將 `xben-benchmark-results/` 或 `deliverables/` 中的檔案標記為惡意軟體。這些是由報告中的利用程式碼引起的誤報。在 Windows Defender 中為 Shannon 目錄新增排除項，或使用 Docker/WSL2。

## 📜 授權

Shannon Lite 根據 [GNU Affero General Public License v3.0 (AGPL-3.0)](LICENSE) 發布。

Shannon 是開源的（AGPL v3）。此授權允許您：
- 免費用於所有內部安全測試。
- 私下修改程式碼以供內部使用，而無需分享您的變更。

AGPL 的分享要求主要適用於將 Shannon 作為公共或託管服務（例如 SaaS 平台）提供的組織。在這些特定情況下，對核心軟體所做的任何修改都必須開源。

## 👥 社群與支援

### 社群資源

**貢獻：** 目前，我們不接受外部程式碼貢獻（PR）。  
歡迎提交問題以報告錯誤和功能請求。

- 🐛 **報告錯誤**透過 [GitHub Issues](https://github.com/KeygraphHQ/shannon/issues)
- 💡 **建議功能**在 [Discussions](https://github.com/KeygraphHQ/shannon/discussions)
- 💬 **加入我們的 [Discord](https://discord.gg/KAqzSHHpRt)** 以獲得即時社群支援

### 保持聯繫

- 🐦 **Twitter**：[@KeygraphHQ](https://twitter.com/KeygraphHQ)
- 💼 **LinkedIn**：[Keygraph](https://linkedin.com/company/keygraph)
- 🌐 **網站**：[keygraph.io](https://keygraph.io)

## 💬 聯絡我們

### 對 Shannon Pro 感興趣？

Shannon Pro 專為認真對待應用程式安全的組織而設計。它提供企業級功能、專屬支援和無縫 CI/CD 整合，全部由我們最先進的基於 LLM 的分析引擎提供支援。在複雜的漏洞到達生產環境之前，在您的程式碼庫深處發現並修復它們。

有關功能、技術差異和企業用例的詳細分解，請參閱我們的[完整比較指南](./SHANNON-PRO.md)。

<p align="center">
  <a href="https://docs.google.com/forms/d/e/1FAIpQLSf-cPZcWjlfBJ3TCT8AaWpf8ztsw3FaHzJE4urr55KdlQs6cQ/viewform?usp=header" target="_blank">
    <img src="https://img.shields.io/badge/📋%20表達對%20Shannon%20Pro%20的興趣-4285F4?style=for-the-badge&logo=google&logoColor=white" alt="Express Interest">
  </a>
</p>

**或直接聯絡我們：**

📧 **電子郵件**：[shannon@keygraph.io](mailto:shannon@keygraph.io)

---

<p align="center">
  <b>由 Keygraph 團隊用 ❤️ 打造</b><br>
  <i>讓每個人都能使用應用程式安全</i>
</p>
