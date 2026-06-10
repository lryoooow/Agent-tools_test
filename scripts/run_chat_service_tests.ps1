param(
    [string]$Python = "D:\miniconda3\envs\chatbot\python.exe"
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path "tests\services\test_chat_service.py")) {
    throw "请在 Agent-RS/backend 目录中运行本脚本。当前目录下未找到 tests/services/test_chat_service.py。"
}

& $Python -m pytest tests\services\test_chat_service.py -q -p no:cacheprovider --basetemp=.tmp_pytest_chat_service_external_pack
