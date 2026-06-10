# 测试资产清单

## backend-tests

保存 Agent-RS 后端测试源码，按原目录分组：

- `ai/`：Agent、Tool、MCP、domain、routing、planner、runner、compute、web_search 相关测试。
- `api/`：API 路由、上传、文档接口、限流等测试。
- `auth/`：安全与 cookie 行为测试。
- `db/`：数据库连接池、向量检索、SQL 清理测试。
- `documents/`：文档解析、chunker 测试。
- `mcp/`：MCP client 测试。
- `services/`：chat service 流式事件与持久化行为测试。

## docs

- `agent-tool-architecture.md`：Agent / Tool 架构说明。
- `plan_cloud_shadow_mask.md`：早期工具接入规划，已同步最终验收口径为 `pytest tests`。
- `test-results/`：历史测试输出和阶段报告归档。

## reports

- `agent_rs_strict_smoke_test_report_2026-06-09.docx`：严格冒烟测试报告。

## scripts

- `run_all_tests.ps1`：全量零回归验收。
- `run_ai_tests.ps1`：Agent / Tool 专项快速检查。
- `run_chat_service_tests.ps1`：chat service 流式与环境隔离专项检查。
