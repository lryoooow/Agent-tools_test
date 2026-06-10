param(
    [string]$Python = "D:\miniconda3\envs\chatbot\python.exe"
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path "tests\ai")) {
    throw "请在 Agent-RS/backend 目录中运行本脚本。当前目录下未找到 tests/ai。"
}

& $Python -m pytest tests\ai -q -p no:cacheprovider --basetemp=.tmp_pytest_ai_external_pack
