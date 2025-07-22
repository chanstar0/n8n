# AI工具API密钥获取详细指南

## 🎯 两套方案对比

### 方案一：标准方案 ($20-53/月)
- **文本生成**: Groq API (免费额度+付费)
- **图像生成**: ShuttleAI ($3-10/月)
- **语音合成**: ElevenLabs ($0-5/月)
- **视频制作**: Creatomate ($20/月)

### 方案二：超低成本方案 ($0-5/月)
- **文本生成**: Cohere Trial (免费)
- **图像生成**: HuggingFace (免费)
- **语音合成**: StreamElements (免费)
- **视频制作**: 开源工具/自搭建

---

## 📋 方案一：标准方案API获取

### 1. Groq API (文本生成) - 免费起步

**🔗 网址**: [https://console.groq.com](https://console.groq.com)

**获取步骤**:
1. 点击"Sign Up"注册账号
2. 可用Google/GitHub快速注册
3. 验证邮箱后登录
4. 左侧导航栏点击"API Keys"
5. 点击"Create API Key"
6. 命名并创建密钥
7. **立即复制保存**（只显示一次）

**免费额度**:
- ✅ 每日免费请求限制
- ✅ 支持多种模型（Llama、Mixtral等）
- ✅ 高速推理
- 💰 免费额度耗尽后按token计费

**API格式**:
```bash
Authorization: Bearer gsk_xxxxxxxxxxxxxxxxxxxx
```

### 2. ShuttleAI (图像生成) - 最便宜

**🔗 网址**: [https://shuttleai.com](https://shuttleai.com)

**获取步骤**:
1. 点击"Sign Up"注册
2. 验证邮箱
3. 进入Dashboard
4. 点击"API Keys"标签
5. 生成新的API密钥
6. 充值最低额度（通常$5起）

**定价**:
- 🎨 图像生成: $0.001-0.01/张
- ✅ 多种模型选择
- ✅ 快速生成
- 💡 建议选择`shuttle-3-diffusion`模型

**API格式**:
```bash
Authorization: Bearer shuttle-xxxxxxxxxxxxxxxxxxxx
```

### 3. ElevenLabs (语音合成) - 有免费额度

**🔗 网址**: [https://elevenlabs.io](https://elevenlabs.io)

**获取步骤**:
1. 注册免费账号
2. 验证邮箱
3. 点击右上角头像
4. 选择"Profile" 
5. 点击"API Key"标签
6. 点击"Generate"创建密钥
7. 复制保存API密钥

**免费额度**:
- 🎵 每月10,000字符
- 🎤 3个自定义声音
- ✅ 基础语音质量
- 💰 超出后$0.30/1K字符

**中文语音设置**:
- 选择"Multilingual v2"模型
- 推荐声音ID: `21m00Tcm4TlvDq8ikWAM` (Rachel)

**API格式**:
```bash
xi-api-key: your_elevenlabs_api_key
```

### 4. Creatomate (视频制作) - 专业视频

**🔗 网址**: [https://creatomate.com](https://creatomate.com)

**获取步骤**:
1. 注册账号
2. 选择合适的套餐（有免费试用）
3. 进入项目设置
4. 找到"API Access"部分
5. 复制API密钥

**免费试用**:
- 🎬 50个免费渲染
- ✅ 1080p质量
- ✅ 无水印
- 💰 付费$20/月起

**API格式**:
```bash
Authorization: Bearer your_creatomate_api_key
```

---

## 🆓 方案二：超低成本方案API获取

### 1. Cohere API (文本生成) - 免费试用

**🔗 网址**: [https://cohere.ai](https://cohere.ai)

**获取步骤**:
1. 注册免费账号
2. 验证邮箱
3. 进入Dashboard
4. 点击"API Keys"
5. 创建新的API密钥

**免费额度**:
- ✅ 每月大量免费调用
- ✅ 支持多语言
- ✅ Command-light模型免费
- 💰 商用需付费

### 2. HuggingFace API (图像生成) - 免费

**🔗 网址**: [https://huggingface.co](https://huggingface.co)

**获取步骤**:
1. 注册HuggingFace账号
2. 进入Settings -> Access Tokens
3. 创建新token，选择"Read"权限
4. 复制token

**免费使用**:
- ✅ 完全免费
- ✅ 大量开源模型
- ✅ Stable Diffusion等热门模型
- ⚠️ 可能有请求限制和延迟

**推荐模型**:
- `runwayml/stable-diffusion-v1-5`
- `stabilityai/stable-diffusion-2-1`

### 3. StreamElements TTS (语音合成) - 免费

**🔗 网址**: [https://streamelements.com](https://streamelements.com)

**特点**:
- ✅ 完全免费
- ✅ 支持中文
- ✅ 无需API密钥
- ⚠️ 质量相对较低

**使用方法**:
```
GET https://api.streamelements.com/kappa/v2/speech?voice=zh-CN&text=你的文本
```

### 4. 开源视频工具 - 完全免费

**FFmpeg + 自搭建方案**:

**工具组合**:
- 🎬 FFmpeg (视频处理)
- 🖼️ ImageMagick (图像处理)  
- 🎵 SoX (音频处理)
- 🐳 Docker (容器化部署)

**搭建步骤**:
```bash
# 安装FFmpeg
sudo apt install ffmpeg

# 创建简单的视频合成脚本
#!/bin/bash
# combine_video.sh
ffmpeg -loop 1 -i background.jpg -i audio.mp3 -c:v libx264 -tune stillimage -c:a aac -b:a 192k -pix_fmt yuv420p -shortest output.mp4
```

---

## 🛠️ N8N配置指南

### 自部署N8N (免费)

**Docker方式**:
```bash
docker run -it --rm \
  --name n8n \
  -p 5678:5678 \
  -v ~/.n8n:/home/node/.n8n \
  n8nio/n8n
```

**优势**:
- ✅ 完全免费
- ✅ 无执行次数限制
- ✅ 数据完全自控
- ⚠️ 需要自维护

### N8N云版本 ($20/月)

**🔗 网址**: [https://n8n.io](https://n8n.io)

**优势**:
- ✅ 无需维护
- ✅ 自动备份
- ✅ 高可用性
- 💰 $20/月起

---

## 📊 成本优化策略

### 极限省钱方案 ($0/月)
- **N8N**: 自部署
- **文本**: Cohere免费额度
- **图像**: HuggingFace免费
- **语音**: StreamElements免费
- **视频**: FFmpeg自搭建
- **存储**: Google Drive免费15GB

### 平衡方案 ($10-20/月)
- **N8N**: 自部署 ($0)
- **文本**: Groq免费+付费 ($0-5)
- **图像**: ShuttleAI ($3-5)  
- **语音**: ElevenLabs免费额度 ($0)
- **视频**: 简化版Creatomate ($10)

### 专业方案 ($50+/月)
- **N8N**: 云版本 ($20)
- **文本**: OpenAI GPT-4 ($10-20)
- **图像**: Midjourney ($10)
- **语音**: ElevenLabs专业版 ($11)
- **视频**: Creatomate完整版 ($20)

---

## 🔐 API密钥安全管理

### 1. 密钥存储
- ✅ 使用环境变量
- ✅ N8N凭据管理器
- ❌ 不要硬编码在代码中
- ❌ 不要提交到Git仓库

### 2. 权限控制
- 设置最小必要权限
- 定期轮换密钥
- 监控API使用量
- 设置消费限额

### 3. 密钥格式示例
```bash
# .env文件
GROQ_API_KEY=gsk_xxxxxxxxxxxxxxxxxxxx
SHUTTLEAI_API_KEY=shuttle-xxxxxxxxxxxxxxxxxxxx
ELEVENLABS_API_KEY=your_elevenlabs_key
CREATOMATE_API_KEY=your_creatomate_key
```

---

## 🚨 常见问题解决

### Q: API密钥不工作？
**解决方案**:
1. 检查密钥格式是否正确
2. 确认是否有足够余额/额度
3. 检查API权限设置
4. 查看服务商状态页

### Q: 免费额度用完了？
**解决方案**:
1. 等待额度重置（通常每月）
2. 升级到付费计划
3. 切换到其他免费服务
4. 优化使用频率

### Q: 如何监控成本？
**解决方案**:
1. 各服务商控制台查看用量
2. 设置消费警报
3. 在N8N中记录每次调用成本
4. 定期审核支出报告

---

**💡 建议**: 先从免费方案开始测试，确认效果后再考虑升级到付费服务。大部分服务都有免费试用期，可以充分评估后再做决定。