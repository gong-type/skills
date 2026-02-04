# uv 工作流备忘

## 常用命令

- 初始化项目：`uv init`
- 添加依赖：`uv add <package>`
- 运行 Python：`uv run python <file.py> [args...]`
- 运行模块：`uv run python -m <module> [args...]`
- 运行测试：`uv run pytest`

## 约束（本技能默认）

- 不使用 `pip install ...`（统一改为 `uv add ...`）
- 不手动创建/激活 venv（让 uv 处理环境）
- 所有可复现命令都给出 `uv run ...` 版本

