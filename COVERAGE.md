# 覆蓋範圍與路線圖

網路安全測試（WST）檢查清單是一份全面的指南，系統性地概述了網路應用程式的安全測試，涵蓋資訊收集、身份驗證、工作階段管理、輸入驗證和錯誤處理等領域，以識別和減輕漏洞。

下面的檢查清單突出顯示了我們的產品持續且可靠地解決的特定 WST 類別和項目。雖然 Shannon 的動態檢測通常會擴展到其他領域，但我們相信透明度，因此只勾選了我們設計用於持續捕獲的漏洞。**我們的覆蓋範圍策略性地專注於適用於當今網路應用程式技術堆疊的 WST 控制項。**

我們正在積極努力擴大此覆蓋範圍，為現代網路應用程式提供更全面的安全解決方案。

## 目前覆蓋範圍

Shannon 目前針對以下*可利用*漏洞類別：
- 身份驗證與授權破壞
- SQL 注入（SQLi）
- 命令注入
- 跨站腳本攻擊（XSS）
- 伺服器端請求偽造（SSRF）

## Shannon 不涵蓋的內容

此清單並非所有潛在安全風險的詳盡清單。例如，Shannon 不會報告無法主動利用的問題，例如使用易受攻擊的第三方程式庫、弱加密演算法或不安全的設定。這些類型的靜態分析發現是我們即將推出的 **Keygraph Code Security（SAST）** 產品的重點。

## WST 測試檢查清單

| 測試 ID | 測試名稱 | 狀態 |
| --- | --- | --- |
| **WSTG-INFO** | **資訊收集** |  |
| WSTG-INFO-01 | 進行搜尋引擎發現和偵察以查找資訊洩漏 |  |
| WSTG-INFO-02 | 指紋識別網路伺服器 | ✅ |
| WSTG-INFO-03 | 檢查網路伺服器中繼檔案以查找資訊洩漏 |  |
| WSTG-INFO-04 | 列舉網路伺服器上的應用程式 |  |
| WSTG-INFO-05 | 檢查網頁內容以查找資訊洩漏 |  |
| WSTG-INFO-06 | 識別應用程式入口點 | ✅ |
| WSTG-INFO-07 | 映射應用程式的執行路徑 | ✅ |
| WSTG-INFO-08 | 指紋識別網路應用程式框架 | ✅ |
| WSTG-INFO-09 | 指紋識別網路應用程式 | ✅ |
| WSTG-INFO-10 | 映射應用程式架構 | ✅ |
|  |  |  |
| **WSTG-CONF** | **配置和部署管理測試** |  |
| WSTG-CONF-01 | 測試網路基礎設施配置 | ✅ |
| WSTG-CONF-02 | 測試應用程式平台配置 |  |
| WSTG-CONF-03 | 測試敏感資訊的檔案副檔名處理 |  |
| WSTG-CONF-04 | 檢查舊備份和未引用的檔案以查找敏感資訊 |  |
| WSTG-CONF-05 | 列舉基礎設施和應用程式管理介面 |  |
| WSTG-CONF-06 | 測試 HTTP 方法 |  |
| WSTG-CONF-07 | 測試 HTTP 嚴格傳輸安全 |  |
| WSTG-CONF-08 | 測試 RIA 跨域策略 |  |
| WSTG-CONF-09 | 測試檔案權限 |  |
| WSTG-CONF-10 | 測試子域接管 | ✅ |
| WSTG-CONF-11 | 測試雲端儲存 |  |
| WSTG-CONF-12 | 測試內容安全策略 |  |
| WSTG-CONF-13 | 測試路徑混淆 |  |
| WSTG-CONF-14 | 測試其他 HTTP 安全標頭錯誤配置 |  |
|  |  |  |
| **WSTG-IDNT** | **身份管理測試** |  |
| WSTG-IDNT-01 | 測試角色定義 | ✅ |
| WSTG-IDNT-02 | 測試使用者註冊流程 | ✅ |
| WSTG-IDNT-03 | 測試帳戶佈建流程 | ✅ |
| WSTG-IDNT-04 | 測試帳戶列舉和可猜測的使用者帳戶 | ✅ |
| WSTG-IDNT-05 | 測試弱或未強制執行的使用者名稱策略 | ✅ |
|  |  |  |
| **WSTG-ATHN** | **身份驗證測試** |  |
| WSTG-ATHN-01 | 測試透過加密通道傳輸的憑證 | ✅ |
| WSTG-ATHN-02 | 測試預設憑證 | ✅ |
| WSTG-ATHN-03 | 測試弱鎖定機制 | ✅ |
| WSTG-ATHN-04 | 測試繞過身份驗證架構 | ✅ |
| WSTG-ATHN-05 | 測試易受攻擊的記住密碼 |  |
| WSTG-ATHN-06 | 測試瀏覽器快取弱點 |  |
| WSTG-ATHN-07 | 測試弱密碼策略 | ✅ |
| WSTG-ATHN-08 | 測試弱安全問題答案 | ✅ |
| WSTG-ATHN-09 | 測試弱密碼變更或重設功能 | ✅ |
| WSTG-ATHN-10 | 測試替代通道中較弱的身份驗證 | ✅ |
| WSTG-ATHN-11 | 測試多因素身份驗證（MFA） | ✅ |
|  |  |  |
| **WSTG-ATHZ** | **授權測試** |  |
| WSTG-ATHZ-01 | 測試目錄遍歷檔案包含 | ✅ |
| WSTG-ATHZ-02 | 測試繞過授權架構 | ✅ |
| WSTG-ATHZ-03 | 測試權限提升 | ✅ |
| WSTG-ATHZ-04 | 測試不安全的直接物件引用 | ✅ |
| WSTG-ATHZ-05 | 測試 OAuth 弱點 | ✅ |
|  |  |  |
| **WSTG-SESS** | **工作階段管理測試** |  |
| WSTG-SESS-01 | 測試工作階段管理架構 | ✅ |
| WSTG-SESS-02 | 測試 Cookie 屬性 | ✅ |
| WSTG-SESS-03 | 測試工作階段固定 | ✅ |
| WSTG-SESS-04 | 測試暴露的工作階段變數 |  |
| WSTG-SESS-05 | 測試跨站請求偽造 | ✅ |
| WSTG-SESS-06 | 測試登出功能 | ✅ |
| WSTG-SESS-07 | 測試工作階段逾時 | ✅ |
| WSTG-SESS-08 | 測試工作階段謎題 |  |
| WSTG-SESS-09 | 測試工作階段劫持 |  |
| WSTG-SESS-10 | 測試 JSON Web Token | ✅ |
| WSTG-SESS-11 | 測試並發工作階段 |  |
|  |  |  |
| **WSTG-INPV** | **輸入驗證測試** |  |
| WSTG-INPV-01 | 測試反射型跨站腳本攻擊 | ✅ |
| WSTG-INPV-02 | 測試儲存型跨站腳本攻擊 | ✅ |
| WSTG-INPV-03 | 測試 HTTP 動詞篡改 |  |
| WSTG-INPV-04 | 測試 HTTP 參數污染 |  |
| WSTG-INPV-05 | 測試 SQL 注入 | ✅ |
| WSTG-INPV-06 | 測試 LDAP 注入 |  |
| WSTG-INPV-07 | 測試 XML 注入 |  |
| WSTG-INPV-08 | 測試 SSI 注入 |  |
| WSTG-INPV-09 | 測試 XPath 注入 |  |
| WSTG-INPV-10 | 測試 IMAP SMTP 注入 |  |
| WSTG-INPV-11 | 測試程式碼注入 | ✅ |
| WSTG-INPV-12 | 測試命令注入 | ✅ |
| WSTG-INPV-13 | 測試格式字串注入 |  |
| WSTG-INPV-14 | 測試潛伏漏洞 |  |
| WSTG-INPV-15 | 測試 HTTP 分割走私 |  |
| WSTG-INPV-16 | 測試 HTTP 傳入請求 |  |
| WSTG-INPV-17 | 測試主機標頭注入 |  |
| WSTG-INPV-18 | 測試伺服器端範本注入 | ✅ |
| WSTG-INPV-19 | 測試伺服器端請求偽造 | ✅ |
| WSTG-INPV-20 | 測試大量賦值 |  |
|  |  |  |
| **WSTG-ERRH** | **錯誤處理** |  |
| WSTG-ERRH-01 | 測試不當錯誤處理 |  |
| WSTG-ERRH-02 | 測試堆疊追蹤 |  |
|  |  |  |
| **WSTG-CRYP** | **密碼學** |  |
| WSTG-CRYP-01 | 測試弱傳輸層安全 | ✅ |
| WSTG-CRYP-02 | 測試填充預言機 |  |
| WSTG-CRYP-03 | 測試透過未加密通道發送的敏感資訊 | ✅ |
| WSTG-CRYP-04 | 測試弱加密 |  |
|  |  |  |
| **WSTG-BUSLOGIC** | **業務邏輯測試** |  |
| WSTG-BUSL-01 | 測試業務邏輯資料驗證 |  |
| WSTG-BUSL-02 | 測試偽造請求的能力 |  |
| WSTG-BUSL-03 | 測試完整性檢查 |  |
| WSTG-BUSL-04 | 測試流程時序 |  |
| WSTG-BUSL-05 | 測試功能可使用次數限制 |  |
| WSTG-BUSL-06 | 測試工作流程的規避 |  |
| WSTG-BUSL-07 | 測試針對應用程式濫用的防禦 |  |
| WSTG-BUSL-08 | 測試上傳意外檔案類型 |  |
| WSTG-BUSL-09 | 測試上傳惡意檔案 |  |
| WSTG-BUSL-10 | 測試支付功能 |  |
|  |  |  |
| **WSTG-CLIENT** | **客戶端測試** |  |
| WSTG-CLNT-01 | 測試基於 DOM 的跨站腳本攻擊 | ✅ |
| WSTG-CLNT-02 | 測試 JavaScript 執行 | ✅ |
| WSTG-CLNT-03 | 測試 HTML 注入 | ✅ |
| WSTG-CLNT-04 | 測試客戶端 URL 重定向 | ✅ |
| WSTG-CLNT-05 | 測試 CSS 注入 |  |
| WSTG-CLNT-06 | 測試客戶端資源操作 |  |
| WSTG-CLNT-07 | 測試跨源資源共享 |  |
| WSTG-CLNT-08 | 測試跨站 Flash |  |
| WSTG-CLNT-09 | 測試點擊劫持 |  |
| WSTG-CLNT-10 | 測試 WebSocket |  |
| WSTG-CLNT-11 | 測試網路訊息傳遞 |  |
| WSTG-CLNT-12 | 測試瀏覽器儲存 | ✅ |
| WSTG-CLNT-13 | 測試跨站腳本包含 | ✅ |
| WSTG-CLNT-14 | 測試反向標籤劫持 |  |
|  |  |  |
| **WSTG-APIT** | **API 測試** |  |
| WSTG-APIT-01 | API 偵察 | ✅ |
| WSTG-APIT-02 | API 破壞物件級別授權 | ✅ |
| WSTG-APIT-99 | 測試 GraphQL | ✅ |
|  |  |  |
