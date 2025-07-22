# 生活小妙招短视频自动生成工作流 - 设置指南

## 🎯 工作流概述

这个N8N工作流每天自动生成一个生活小妙招短视频，包含：
- 📝 AI生成的实用脚本
- 🎨 匹配的配图
- 🎵 自然的语音播报
- 🎬 完整的短视频制作
- 📊 自动记录和通知

## 💰 成本分析（最低成本方案）

### 月度预估成本：
- **Groq API (文本生成)**: $0-5/月 (免费额度充足)
- **ShuttleAI (图像生成)**: $0-3/月 (有免费额度)
- **ElevenLabs (语音合成)**: $0-5/月 (免费10,000字符/月)
- **Creatomate (视频制作)**: $0-20/月 (有免费试用)
- **Google Sheets**: 免费
- **Discord**: 免费
- **N8N**: $20/月 (云版本) 或 自部署免费

**总计: $20-53/月** (如果使用自部署N8N，成本可降至$0-33/月)

## 🔧 必需的API密钥获取指南

### 1. Groq API (文本生成 - 免费/低成本)

**获取步骤：**
1. 访问 [https://console.groq.com](https://console.groq.com)
2. 使用Google或GitHub账号注册
3. 进入API Keys页面
4. 点击"Create API Key"
5. 复制并保存API密钥

**特点：**
- ✅ 免费额度充足（每日限制）
- ✅ 支持中文
- ✅ 响应速度快
- 💰 成本：免费额度内基本够用

### 2. ShuttleAI API (图像生成 - 最便宜)

**获取步骤：**
1. 访问 [https://shuttleai.com](https://shuttleai.com)
2. 注册账号
3. 进入Dashboard
4. 获取API Key
5. 选择最便宜的图像生成模型

**特点：**
- ✅ 价格最便宜的AI图像生成
- ✅ 支持多种模型
- ✅ 有免费额度
- 💰 成本：约$0.001-0.01/张图

### 3. ElevenLabs API (语音合成)

**获取步骤：**
1. 访问 [https://elevenlabs.io](https://elevenlabs.io)
2. 注册免费账号
3. 进入Profile -> API Keys
4. 生成新的API密钥
5. 选择免费的声音模型

**免费额度：**
- 🎵 每月10,000个字符
- 🎤 多种声音选择
- 💰 超出后约$0.0001/字符

### 4. Creatomate API (视频制作)

**获取步骤：**
1. 访问 [https://creatomate.com](https://creatomate.com)
2. 注册账号并获得免费试用
3. 进入项目设置
4. 获取API密钥
5. 创建视频模板

**模板设计：**
- 🎨 简洁的生活小妙招风格
- 📱 适合短视频平台（9:16比例）
- 🎬 包含标题、图片、语音和字幕

### 5. Google Sheets API (记录存储)

**获取步骤：**
1. 访问 [Google Cloud Console](https://console.cloud.google.com)
2. 创建新项目或选择现有项目
3. 启用Google Sheets API
4. 创建服务账号
5. 下载JSON密钥文件

### 6. Discord Webhook (通知)

**获取步骤：**
1. 在Discord服务器中右键点击频道
2. 选择"编辑频道" -> "整合"
3. 创建Webhook
4. 复制Webhook URL

## 📋 N8N工作流配置步骤

### 1. 导入工作流
```bash
# 在N8N中导入提供的JSON文件
# 或复制JSON内容到N8N的导入界面
```

### 2. 配置API凭据
在N8N的凭据设置中添加：

**Groq API凭据：**
- 类型：HTTP Header Auth
- 名称：groq_api
- Header名称：Authorization
- 值：Bearer YOUR_GROQ_API_KEY

**ShuttleAI凭据：**
- 类型：HTTP Header Auth
- 名称：shuttleai_api
- Header名称：Authorization
- 值：Bearer YOUR_SHUTTLEAI_API_KEY

**ElevenLabs凭据：**
- 类型：HTTP Header Auth
- 名称：elevenlabs_api
- Header名称：xi-api-key
- 值：YOUR_ELEVENLABS_API_KEY

**Creatomate凭据：**
- 类型：HTTP Header Auth
- 名称：creatomate_api
- Header名称：Authorization
- 值：Bearer YOUR_CREATOMATE_API_KEY

### 3. 设置Google Sheets
1. 创建新的Google表格
2. 设置以下列名：
   - 日期
   - 主题
   - 标题
   - 脚本
   - 视频链接
   - 状态

### 4. 配置Creatomate视频模板

**建议模板设置：**
```json
{
  "name": "生活小妙招模板",
  "width": 1080,
  "height": 1920,
  "duration": "auto",
  "elements": [
    {
      "type": "image",
      "source": "{{background-image}}",
      "fit": "cover"
    },
    {
      "type": "text",
      "text": "{{title-text}}",
      "fontSize": 48,
      "fontWeight": "bold",
      "color": "#ffffff",
      "position": "top"
    },
    {
      "type": "audio",
      "source": "{{voiceover-audio}}",
      "volume": 0.8
    },
    {
      "type": "text",
      "text": "{{description-text}}",
      "fontSize": 24,
      "position": "bottom"
    }
  ]
}
```

## 🚀 启动工作流

1. 激活定时触发器（每日执行）
2. 测试工作流确保所有API连接正常
3. 检查生成的第一个视频质量
4. 根据需要调整模板和参数

## 🎨 自定义选项

### 主题扩展
编辑"主题池"节点，添加更多生活小妙招类别：
- 宠物护理技巧
- 园艺种植
- 数字生活
- 健康饮食
- 等等...

### 视频风格调整
- 修改Creatomate模板的颜色、字体
- 调整ElevenLabs的语音设置
- 优化图像生成的提示词

### 发布渠道
可以扩展工作流，自动发布到：
- 抖音/TikTok
- 小红书
- 微信视频号
- YouTube Shorts

## 🔄 维护和优化

### 定期检查：
- API使用量和成本
- 生成内容的质量
- 用户反馈和建议

### 优化建议：
- 根据热门话题调整主题池
- 优化脚本生成的提示词
- 改进视频模板设计

## 🆘 常见问题

**Q: 如何降低成本？**
A: 
- 使用免费API的额度内功能
- 自部署N8N而非使用云版本
- 选择成本最低的AI服务提供商

**Q: 如何确保内容不重复？**
A: 
- 工作流会随机选择主题
- AI生成确保每次内容不同
- 可添加内容去重检查机制

**Q: 如何提高视频质量？**
A: 
- 优化Creatomate模板设计
- 使用更好的语音模型
- 改进图像生成提示词

**Q: 可以支持多语言吗？**
A: 
- 是的，只需修改提示词语言
- ElevenLabs支持多语言语音
- 可以为不同语言创建不同的工作流

## 📞 技术支持

如果遇到技术问题，可以：
1. 检查API密钥是否正确配置
2. 查看N8N执行日志
3. 测试各个API服务是否正常
4. 参考各服务提供商的文档

---

**注意：** 请遵守各平台的内容政策和版权规定，确保生成的内容真实、安全、有用。