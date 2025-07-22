#!/bin/bash

echo "🚀 生活小妙招视频工作流 - 快速安装"
echo "=================================="

# 检查Docker是否安装
if ! command -v docker &> /dev/null; then
    echo "⚠️  Docker未安装，请先安装Docker"
    echo "Ubuntu/Debian: sudo apt install docker.io"
    echo "macOS: brew install docker"
    exit 1
fi

echo "📦 启动N8N容器..."

# 创建N8N数据目录
mkdir -p ~/.n8n

# 启动N8N容器
docker run -d \
    --name n8n-life-tips \
    -p 5678:5678 \
    -v ~/.n8n:/home/node/.n8n \
    -e N8N_BASIC_AUTH_ACTIVE=true \
    -e N8N_BASIC_AUTH_USER=admin \
    -e N8N_BASIC_AUTH_PASSWORD=changeme \
    n8nio/n8n

echo "✅ N8N已启动！"
echo "🌐 访问地址: http://localhost:5678"
echo "👤 用户名: admin"
echo "🔑 密码: changeme"
echo ""
echo "📋 下一步："
echo "1. 在浏览器中打开 http://localhost:5678"
echo "2. 使用上述账号密码登录"
echo "3. 导入 workflows/ 目录中的JSON文件"
echo "4. 按照docs/目录中的指南配置API密钥"
echo "5. 开始使用！"
