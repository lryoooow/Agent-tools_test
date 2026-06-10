# Agent-tools_test

Agent-RS 的 Agent / Tool 测试方法库。

这个仓库保存的是测试资产，不是独立可运行的后端应用。测试代码来自 Agent-RS 项目的 `backend/tests`，用于沉淀 12 个能力接入后的冒烟测试、覆盖测试、契约测试、回归测试和测试报告。

## 内容结构

- `backend-tests/`：后端测试源码，保持原 `backend/tests` 结构。
- `docs/`：测试规划、架构说明和历史测试输出。
- `reports/`：测试报告文档。
- `scripts/`：在 Agent-RS 项目中运行这些测试的 PowerShell 脚本。

## 当前测试口径

最终验收必须跑全量测试：

```powershell
python -m pytest tests -q
```

`tests/ai` 只能作为 Agent / Tool 专项快速检查，不能替代全量零回归验收。此前只跑 `tests/ai` 漏掉过 `tests/services` 的真实回归，因此这个口径必须保留。

## 覆盖重点

- 工具注册、路由、domain、guard 的全集一致性。
- MCP runner 真实 payload 与容器 `inputSchema` 的契约一致性。
- 12 个能力的 schema、success、bad case、MCP disabled、MCP error、guard 覆盖。
- `ocr_recognize` 的特殊设计：走 imagery route/owner guard，但归属 `document_agent`。
- detect / segment / preprocess / document 工具的异常分支和结果结构。
- chat service 流式事件、meta 持久化 ID、rag_trace 稳定字段、环境隔离。
- 报告文档中文可读性和源码编码异常检查。

## 使用方式

1. 将 `backend-tests/` 复制或同步到 Agent-RS 的 `backend/tests/`。
2. 在 Agent-RS 的 `backend` 目录中使用项目 Python 环境运行脚本。
3. 最终验收以 `scripts/run_all_tests.ps1` 为准。

示例：

```powershell
cd D:\Lry\AI\LLM\Agent-RS\backend
D:\tmp\Agent-tools_test\scripts\run_all_tests.ps1
```

## 设计原则

- 不写只为通过的 happy path。
- Bad case 与异常路径必须和正向路径同等重要。
- 能用全集相等就不用子集包含。
- 避免测试依赖宿主环境随机状态。
- 生产行为正确时，同步测试断言，不用改生产代码迁就旧断言。
