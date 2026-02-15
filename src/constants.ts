// Copyright (C) 2025 Keygraph, Inc.
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License version 3
// as published by the Free Software Foundation.

import { path, fs } from 'zx';
import chalk from 'chalk';
import { validateQueueAndDeliverable, type VulnType } from './queue-validation.js';
import type { AgentName, PromptName, PlaywrightAgent, AgentValidator } from './types/agents.js';

// 漏洞佇列驗證器的工廠函式
function createVulnValidator(vulnType: VulnType): AgentValidator {
  return async (sourceDir: string): Promise<boolean> => {
    try {
      await validateQueueAndDeliverable(vulnType, sourceDir);
      return true;
    } catch (error) {
      const errMsg = error instanceof Error ? error.message : String(error);
      console.log(chalk.yellow(`   Queue validation failed for ${vulnType}: ${errMsg}`));
      return false;
    }
  };
}

// 利用交付成果驗證器的工廠函式
function createExploitValidator(vulnType: VulnType): AgentValidator {
  return async (sourceDir: string): Promise<boolean> => {
    const evidenceFile = path.join(sourceDir, 'deliverables', `${vulnType}_exploitation_evidence.md`);
    return await fs.pathExists(evidenceFile);
  };
}

// MCP 代理映射 - 將每個代理分配給特定的 Playwright 實例以防止衝突
export const MCP_AGENT_MAPPING: Record<PromptName, PlaywrightAgent> = Object.freeze({
  // 階段 1：預偵察（實際提示名稱為 'pre-recon-code'）
  // 注意：預偵察是純程式碼分析，不使用瀏覽器自動化，
  // 但為了一致性和未來擴展性，仍然分配 MCP 伺服器
  'pre-recon-code': 'playwright-agent1',

  // 階段 2：偵察（實際提示名稱為 'recon'）
  recon: 'playwright-agent2',

  // 階段 3：漏洞分析（5 個並行代理）
  'vuln-injection': 'playwright-agent1',
  'vuln-xss': 'playwright-agent2',
  'vuln-auth': 'playwright-agent3',
  'vuln-ssrf': 'playwright-agent4',
  'vuln-authz': 'playwright-agent5',

  // 階段 4：利用（5 個並行代理 - 與漏洞對應代理相同）
  'exploit-injection': 'playwright-agent1',
  'exploit-xss': 'playwright-agent2',
  'exploit-auth': 'playwright-agent3',
  'exploit-ssrf': 'playwright-agent4',
  'exploit-authz': 'playwright-agent5',

  // 階段 5：報告（實際提示名稱為 'report-executive'）
  // 注意：報告生成通常基於文字且不使用瀏覽器自動化，
  // 但為了潛在的截圖包含或未來需求，仍然分配 MCP 伺服器
  'report-executive': 'playwright-agent3',
});

// 直接的代理到驗證器映射 - 比模式匹配簡單得多
export const AGENT_VALIDATORS: Record<AgentName, AgentValidator> = Object.freeze({
  // 預偵察代理 - 驗證代理建立的程式碼分析交付成果
  'pre-recon': async (sourceDir: string): Promise<boolean> => {
    const codeAnalysisFile = path.join(sourceDir, 'deliverables', 'code_analysis_deliverable.md');
    return await fs.pathExists(codeAnalysisFile);
  },

  // 偵察代理
  recon: async (sourceDir: string): Promise<boolean> => {
    const reconFile = path.join(sourceDir, 'deliverables', 'recon_deliverable.md');
    return await fs.pathExists(reconFile);
  },

  // 漏洞分析代理
  'injection-vuln': createVulnValidator('injection'),
  'xss-vuln': createVulnValidator('xss'),
  'auth-vuln': createVulnValidator('auth'),
  'ssrf-vuln': createVulnValidator('ssrf'),
  'authz-vuln': createVulnValidator('authz'),

  // 利用代理
  'injection-exploit': createExploitValidator('injection'),
  'xss-exploit': createExploitValidator('xss'),
  'auth-exploit': createExploitValidator('auth'),
  'ssrf-exploit': createExploitValidator('ssrf'),
  'authz-exploit': createExploitValidator('authz'),

  // 執行報告代理
  report: async (sourceDir: string): Promise<boolean> => {
    const reportFile = path.join(
      sourceDir,
      'deliverables',
      'comprehensive_security_assessment_report.md'
    );

    const reportExists = await fs.pathExists(reportFile);

    if (!reportExists) {
      console.log(
        chalk.red(`    ❌ Missing required deliverable: comprehensive_security_assessment_report.md`)
      );
    }

    return reportExists;
  },
});
