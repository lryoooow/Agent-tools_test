param(
    [string]$Python = "D:\miniconda3\envs\chatbot\python.exe"
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path "tests")) {
    throw "请在 Agent-RS/backend 目录中运行本脚本。当前目录下未找到 tests/。"
}

& $Python -m pytest tests -q -p no:cacheprovider --basetemp=.tmp_pytest_all_external_pack
