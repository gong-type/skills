---
name: uv-python
description: 强制使用 uv 工具开发 Python：用 `uv init` 初始化项目、用 `uv add` 管理依赖、用 `uv run` 运行代码/测试/脚本。只要用户请求涉及任何 Python 开发/维护（例如“初始化python项目”“帮我写一个python程序”“运行/测试/分析某个 Python 项目”“安装依赖”“有 .py/pyproject.toml/requirements/pip/venv 相关内容”等），即使用户没提 uv 也必须使用本技能；除非用户明确要求不用 uv。开始前先检测 `uv --version`，缺失则检测 scoop 并通过 scoop 安装 uv。
---

# uv Python 工作流

## 目标

- 统一以 `uv` 作为项目初始化、依赖管理与运行入口（避免 `pip`/`python -m venv`/`poetry`/`pipenv` 等混用）
- 在 `uv` 不存在时，按固定顺序自检与安装：`uv --version` → `scoop` → `scoop install uv`

## 快速流程（必须按顺序）

1. 检测 uv 是否可用：运行 `uv --version`
2. 若 uv 不存在：
   - 检测 scoop：`Get-Command scoop`（PowerShell）或 `scoop --version`
   - 若 scoop 存在：运行 `scoop install uv`
   - 安装后再次运行 `uv --version` 确认成功
   - 若 scoop 不存在：先向用户说明无法自动安装，并请求用户选择安装方式（例如安装 scoop 或手动安装 uv）
3. 项目层面的操作一律走 uv：
   - 初始化：`uv init`
   - 添加依赖：`uv add <pkg>`（开发依赖也用 uv 的对应方式；不使用 pip）
   - 运行：`uv run python ...` / `uv run pytest` / `uv run <cmd>`

## 交付标准

- 给出的命令必须是可复制执行的 `uv ...`
- 任何“运行/测试/脚本执行”指令优先提供 `uv run ...` 形式
- 若需要新增依赖，必须同时给出 `uv add ...`，并说明新增原因与最小依赖集合

## 资源

- 一键自检/安装脚本：`scripts/ensure_uv.ps1`
- 常用命令与项目结构建议：`references/uv-workflow.md`
