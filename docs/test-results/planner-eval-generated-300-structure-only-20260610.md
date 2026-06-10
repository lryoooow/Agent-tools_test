# Planner 路由评测 300 条 Generated Live 基线

## 背景

本次评测用于验证 LLM planner 在 300 条程序化生成题库上的路由决策表现。主评分只做确定性比对，不使用关键词规则，不使用 LLM 自评。

## 评分口径

- 主链路：`plan -> validate -> select`
- 主评分：expected action / capability / key arguments
- `web_search` 复合检索：只校验 `queries` 是 list 且有效条数满足 `min_query_count`
- `unsupported_multi_tool`：只进入诊断块，不计入主准确率
- `prompt_near`：单独统计，不进入 hard score

## 聚合结果

| 分块 | 样本数 | 准确率 | FP | FN |
| --- | ---: | ---: | ---: | ---: |
| all generated | 300 | 85.7% | 43 | 0 |
| main | 268 | 92.9% | 19 | 0 |
| generated_positive | 178 | 100.0% | 0 | 0 |
| hard_negative | 90 | 78.9% | 19 | 0 |
| prompt_near | 2 | 100.0% | 0 | 0 |
| diagnostic_unsupported | 30 | 20.0% | 24 | 0 |

## 主要结论

- 正向工具路由全部通过，说明能力描述和基础路由足够稳定。
- 主要问题集中在 hard negative：缺 ID、矛盾诱导等场景仍会误触发工具。
- `unsupported_multi_tool` 诊断块暴露出模型倾向于从多工具请求中强行选择一个工具；这不计入主分，但应作为后续 prompt 改进方向。
- 下一步应优先优化 planner prompt 的克制规则，而不是修改评分口径。

## 不入库内容

- live raw responses
- recordings JSON
- API 配置
- 临时运行目录
