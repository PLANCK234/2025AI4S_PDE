#!/usr/bin/env bash
# ==========================================================
#  自动配置 PINNs 项目的 Python 虚拟环境 (pinn_env)
#  支持：本地电脑 / GitHub Codespaces / 云端开发环境
# ==========================================================

set -e  # 遇到错误立即退出

echo "🔍 检查 Conda 是否可用..."
if command -v conda &> /dev/null
then
    echo "✅ 检测到 Conda，开始配置 Conda 环境。"
    
    # 初始化 conda（必要时）
    conda init bash || true
    source ~/.bashrc || true

    # 如果已有同名环境，询问是否重建
    if conda env list | grep -q "pinn_env"; then
        read -p "⚠️ 检测到已存在的环境 pinn_env，是否重新创建？(y/n): " yn
        if [ "$yn" = "y" ]; then
            conda remove -n pinn_env --all -y
        fi
    fi

    # 优先使用 environment.yml
    if [ -f "environment.yml" ]; then
        echo "📦 使用 environment.yml 创建环境..."
        conda env create -f environment.yml || {
            echo "⚠️ environment.yml 安装失败，尝试使用 pip 方式..."
            conda create -n pinn_env python=3.10 -y
            conda activate pinn_env
            pip install -r requirements.txt
        }
    else
        echo "⚠️ 未找到 environment.yml，使用 pip 安装。"
        conda create -n pinn_env python=3.10 -y
        conda activate pinn_env
        pip install -r requirements.txt
    fi

    echo "✅ 环境创建完成！正在激活..."
    conda activate pinn_env || source activate pinn_env

else
    echo "⚠️ 未检测到 Conda，将使用系统 pip 安装依赖。"
    python3 -m venv pinn_env
    source pinn_env/bin/activate
    pip install --upgrade pip setuptools wheel
    if [ -f "requirements.txt" ]; then
        pip install -r requirements.txt
    else
        echo "❌ 未找到 requirements.txt，请检查仓库。"
    fi
fi

echo "🔧 安装 Jupyter kernel..."
python -m ipykernel install --user --name pinn_env --display-name "Python (pinn_env)"

echo "✅ 一切就绪！"
echo "💡 现在可以运行: conda activate pinn_env"
echo "💡 或在 Jupyter Notebook 中选择 kernel: Python (pinn_env)"
