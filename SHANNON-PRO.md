# Shannon Pro vs Shannon Lite

## 技術差異

**Shannon Pro** 建立在進階的、由 LLM 驅動的資料流分析之上，靈感來自 [LLM 驅動的資料流分析論文](https://arxiv.org/abs/2402.10754)的想法。它追蹤資料流以高精度識別複雜的、可利用的漏洞。它是基於雲端的，具有原生 CI/CD 整合（GitHub Actions、GitLab CI、Jenkins）並支援自託管部署。

### 功能比較

| 功能 | Shannon Lite<br>(AGPL-3.0) | Shannon Pro<br>(商業授權) |
|---------|:-------------------------:|:---------------------------:|
| **核心掃描** |
| 來源-接收器分析 | 基本 | 由 LLM 驅動的資料流分析，用於高精度、從來源到接收器的漏洞檢測 |
| CVSS 評分 | ❌ | ✅ |
| 修復指導 | 基本 | 程式碼級修復 |
| **整合** |
| CI/CD 管道支援 | ❌ | ✅ |
| API 存取 | ❌ | ✅ |
| Jira/Linear/ServiceNow/Slack | ❌ | ✅ |
| **部署** |
| 託管 | 自託管 | 雲端或自託管 |
| **企業** |
| 多使用者與 RBAC | ❌ | ✅ |
| SSO/SAML | ❌ | ✅ |
| 審計日誌 | ❌ | ✅ |
| 合規報告 | ❌ | ✅ (OWASP, PCI-DSS, SOC2) |
| **支援** |
| 支援 | 社群 | 專屬 + SLA |
| **成本** | 免費 + API 成本 | 聯絡我們 |

## 如何選擇？

**Shannon Lite**：個人研究人員、小型團隊或測試個人專案  
**Shannon Pro**：專為希望「左移」並將安全性直接整合到其開發生命週期中的組織而設計。其_進階的由 LLM 驅動的資料流分析引擎_非常適合在深層漏洞到達生產環境之前捕獲它們，並輔以完整的 CI/CD 整合和企業支援。

## 對 Shannon Pro 感興趣？

Shannon Pro 為認真對待應用程式安全的組織提供企業級功能、專屬支援和無縫 CI/CD 整合。

<p align="center">
  <a href="https://docs.google.com/forms/d/e/1FAIpQLSf-cPZcWjlfBJ3TCT8AaWpf8ztsw3FaHzJE4urr55KdlQs6cQ/viewform?usp=header" target="_blank">
    <img src="https://img.shields.io/badge/📋%20表達對%20Shannon%20Pro%20的興趣-4285F4?style=for-the-badge&logo=google&logoColor=white" alt="Express Interest">
  </a>
</p>

**或直接聯絡我們：**

📧 **電子郵件**：[shannon@keygraph.io](mailto:shannon@keygraph.io)
