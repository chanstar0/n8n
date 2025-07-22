#!/bin/bash

# 生活小妙招短视频自动生成工作流 - 文件打包脚本
# 使用方法: bash download_package.sh

echo "🎬 生活小妙招短视频自动生成工作流"
echo "📦 正在打包所有文件..."

# 创建项目目录
PROJECT_DIR="life_tips_video_automation"
mkdir -p "$PROJECT_DIR"

echo "📁 创建目录结构..."

# 创建子目录
mkdir -p "$PROJECT_DIR/workflows"
mkdir -p "$PROJECT_DIR/docs"
mkdir -p "$PROJECT_DIR/templates"

# 复制工作流文件
cp life_tips_video_workflow.json "$PROJECT_DIR/workflows/"
cp budget_workflow.json "$PROJECT_DIR/workflows/"

# 复制文档文件
cp setup_guide.md "$PROJECT_DIR/docs/"
cp api_keys_guide.md "$PROJECT_DIR/docs/"

echo "📝 创建README文件..."

# 创建项目README
cat > "$PROJECT_DIR/README.md" << 'EOF'
# 生活小妙招短视频自动生成工作流

## 📋 项目概述

这是一个基于N8N的自动化工作流，每天自动生成一个生活小妙招短视频，包含AI生成的脚本、配图、语音和完整视频制作。

## 📁 文件结构

```
life_tips_video_automation/
├── README.md                          # 项目说明文档
├── workflows/                         # N8N工作流文件
│   ├── life_tips_video_workflow.json  # 标准方案工作流
│   └── budget_workflow.json           # 超低成本方案工作流
├── docs/                              # 详细文档
│   ├── setup_guide.md                 # 设置指南
│   └── api_keys_guide.md             # API密钥获取指南
└── templates/                         # 模板文件
    └── creatomate_template.json       # Creatomate视频模板
```

## 🚀 快速开始

1. **选择方案**：
   - 标准方案（$20-53/月）：专业质量，适合商用
   - 超低成本方案（$0-5/月）：基础质量，适合测试

2. **阅读文档**：
   - 查看 `docs/setup_guide.md` 了解详细设置步骤
   - 查看 `docs/api_keys_guide.md` 获取API密钥

3. **导入工作流**：
   - 在N8N中导入对应的JSON工作流文件
   - 配置所需的API凭据

4. **启动运行**：
   - 激活定时触发器
   - 检查第一个生成的视频质量

## 💰 成本对比

| 组件 | 标准方案 | 超低成本方案 |
|------|----------|-------------|
| 文本生成 | Groq ($0-5) | Cohere (免费) |
| 图像生成 | ShuttleAI ($3-10) | HuggingFace (免费) |
| 语音合成 | ElevenLabs ($0-5) | StreamElements (免费) |
| 视频制作 | Creatomate ($20) | FFmpeg (免费) |
| N8N平台 | 云版本 ($20) | 自部署 (免费) |
| **总计** | **$20-53/月** | **$0-5/月** |

## 🎯 功能特点

- ✅ 每日自动生成不重复内容
- ✅ 20+种生活小妙招主题
- ✅ AI智能脚本生成
- ✅ 自动配图和语音
- ✅ 完整视频制作流程
- ✅ 自动记录和通知
- ✅ 支持自定义扩展

## 📞 技术支持

如遇问题，请检查：
1. API密钥配置是否正确
2. 服务商余额是否充足
3. N8N工作流执行日志
4. 各API服务状态

## 📄 许可证

本项目仅供学习和个人使用，请遵守各API服务商的使用条款。

---

**⚠️ 重要提醒**：
- 请确保生成的内容真实、安全、有用
- 遵守各平台的内容政策和版权规定
- 建议先测试小规模使用再扩大规模
EOF

echo "🎨 创建Creatomate模板文件..."

# 创建Creatomate模板文件
cat > "$PROJECT_DIR/templates/creatomate_template.json" << 'EOF'
{
  "name": "生活小妙招视频模板",
  "description": "专为生活小妙招短视频设计的模板",
  "width": 1080,
  "height": 1920,
  "duration": "auto",
  "backgroundColor": "#f8f9fa",
  "elements": [
    {
      "type": "image",
      "name": "background-image",
      "source": "{{background-image}}",
      "x": "0%",
      "y": "0%",
      "width": "100%",
      "height": "100%",
      "fit": "cover",
      "opacity": 0.8
    },
    {
      "type": "shape",
      "name": "overlay",
      "shape": "rectangle",
      "x": "0%",
      "y": "0%",
      "width": "100%",
      "height": "100%",
      "fillColor": "rgba(0,0,0,0.3)"
    },
    {
      "type": "text",
      "name": "title-text",
      "text": "{{title-text}}",
      "x": "50%",
      "y": "15%",
      "width": "90%",
      "height": "auto",
      "horizontalAlignment": "center",
      "verticalAlignment": "center",
      "fontSize": 48,
      "fontWeight": "bold",
      "fontFamily": "Noto Sans SC",
      "color": "#ffffff",
      "stroke": "#000000",
      "strokeWidth": 2,
      "shadowColor": "rgba(0,0,0,0.5)",
      "shadowX": 2,
      "shadowY": 2,
      "shadowBlur": 4
    },
    {
      "type": "text",
      "name": "description-text",
      "text": "{{description-text}}",
      "x": "50%",
      "y": "85%",
      "width": "90%",
      "height": "auto",
      "horizontalAlignment": "center",
      "verticalAlignment": "center",
      "fontSize": 24,
      "fontFamily": "Noto Sans SC",
      "color": "#ffffff",
      "backgroundColor": "rgba(0,0,0,0.7)",
      "borderRadius": 10,
      "padding": 15
    },
    {
      "type": "audio",
      "name": "voiceover-audio",
      "source": "{{voiceover-audio}}",
      "volume": 0.8,
      "fadeIn": 0.5,
      "fadeOut": 0.5
    },
    {
      "type": "text",
      "name": "watermark",
      "text": "生活小妙招",
      "x": "95%",
      "y": "95%",
      "fontSize": 16,
      "color": "rgba(255,255,255,0.6)",
      "horizontalAlignment": "right",
      "verticalAlignment": "bottom"
    }
  ],
  "output": {
    "format": "mp4",
    "resolution": "1080x1920",
    "fps": 30,
    "quality": "high"
  }
}
EOF

echo "📋 创建部署清单..."

# 创建部署清单
cat > "$PROJECT_DIR/DEPLOYMENT_CHECKLIST.md" << 'EOF'
# 部署清单

## ✅ 准备工作

### 1. 选择方案
- [ ] 标准方案（推荐商用）
- [ ] 超低成本方案（适合测试）

### 2. N8N环境
- [ ] N8N云版本账号
- [ ] 或本地Docker部署N8N

### 3. API密钥准备
- [ ] Groq API Key (文本生成)
- [ ] ShuttleAI API Key (图像生成)
- [ ] ElevenLabs API Key (语音合成)
- [ ] Creatomate API Key (视频制作)
- [ ] Google Sheets API凭据
- [ ] Discord Webhook URL

## ✅ 配置步骤

### 1. 导入工作流
- [ ] 在N8N中导入JSON工作流文件
- [ ] 检查所有节点连接正常

### 2. 配置凭据
- [ ] 添加所有API凭据到N8N
- [ ] 测试每个API连接

### 3. 设置存储
- [ ] 创建Google表格
- [ ] 设置表格列名
- [ ] 配置权限

### 4. 模板配置
- [ ] 在Creatomate中创建视频模板
- [ ] 测试模板渲染效果
- [ ] 记录模板ID

## ✅ 测试验证

### 1. 功能测试
- [ ] 手动执行工作流
- [ ] 检查脚本生成质量
- [ ] 验证图像生成效果
- [ ] 测试语音合成质量
- [ ] 确认视频制作成功

### 2. 自动化测试
- [ ] 设置定时触发器
- [ ] 验证每日自动执行
- [ ] 检查通知功能
- [ ] 确认记录功能

## ✅ 上线运行

### 1. 监控设置
- [ ] 设置API使用量监控
- [ ] 配置错误告警
- [ ] 设置成本控制

### 2. 内容质量
- [ ] 定期检查生成内容
- [ ] 优化提示词模板
- [ ] 调整主题池内容

### 3. 持续优化
- [ ] 收集用户反馈
- [ ] 分析视频表现
- [ ] 优化工作流程

## 🚨 常见问题

1. **API调用失败**
   - 检查密钥是否正确
   - 确认余额是否充足
   - 查看API限制

2. **视频质量问题**
   - 优化Creatomate模板
   - 调整AI提示词
   - 提升素材质量

3. **成本控制**
   - 监控每日使用量
   - 设置消费上限
   - 优化调用频率
EOF

echo "🔧 创建快速安装脚本..."

# 创建快速安装脚本
cat > "$PROJECT_DIR/quick_install.sh" << 'EOF'
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
EOF

# 使脚本可执行
chmod +x "$PROJECT_DIR/quick_install.sh"

echo "🎉 创建项目说明文件..."

# 创建版本信息
cat > "$PROJECT_DIR/VERSION.md" << 'EOF'
# 版本信息

## v1.0.0 (2024-01-15)

### 功能特性
- ✅ 完整的N8N工作流自动化
- ✅ 双方案支持（标准/超低成本）
- ✅ 20+种生活小妙招主题
- ✅ AI文本、图像、语音生成
- ✅ 自动视频合成
- ✅ Google表格记录
- ✅ Discord通知

### 技术栈
- **自动化平台**: N8N
- **文本生成**: Groq API / Cohere API
- **图像生成**: ShuttleAI / HuggingFace
- **语音合成**: ElevenLabs / StreamElements
- **视频制作**: Creatomate / FFmpeg
- **存储记录**: Google Sheets
- **通知**: Discord

### 支持平台
- ✅ Linux (推荐)
- ✅ macOS
- ✅ Windows (WSL)
- ✅ Docker容器

### 下一版本计划
- 🔄 增加更多AI服务选择
- 📱 支持直接发布到社交平台
- 🎨 更多视频模板样式
- 📊 数据分析和优化建议
EOF

echo "🗜️  创建压缩包..."

# 创建压缩包
tar -czf life_tips_video_automation.tar.gz "$PROJECT_DIR"

echo ""
echo "🎉 打包完成！"
echo "📦 生成文件："
echo "   📁 life_tips_video_automation/          # 项目目录"
echo "   📦 life_tips_video_automation.tar.gz    # 压缩包"
echo ""
echo "📋 文件清单："
echo "   ├── README.md                           # 项目说明"
echo "   ├── DEPLOYMENT_CHECKLIST.md            # 部署清单"
echo "   ├── VERSION.md                         # 版本信息"
echo "   ├── quick_install.sh                   # 快速安装脚本"
echo "   ├── workflows/                         # N8N工作流"
echo "   │   ├── life_tips_video_workflow.json  # 标准方案"
echo "   │   └── budget_workflow.json           # 超低成本方案"
echo "   ├── docs/                             # 详细文档"
echo "   │   ├── setup_guide.md                # 设置指南"
echo "   │   └── api_keys_guide.md             # API密钥指南"
echo "   └── templates/                        # 模板文件"
echo "       └── creatomate_template.json      # 视频模板"
echo ""
echo "🚀 使用方法："
echo "1. 下载: 复制 life_tips_video_automation.tar.gz"
echo "2. 解压: tar -xzf life_tips_video_automation.tar.gz"
echo "3. 进入: cd life_tips_video_automation"
echo "4. 阅读: cat README.md"
echo "5. 安装: bash quick_install.sh"
echo ""
echo "📞 如需帮助，请查看 docs/ 目录中的详细文档"