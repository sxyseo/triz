# 快速修复部署问题指南

## 🚨 问题分析

网站部署后只有首页能打开，其他链接404的原因：
1. **英文内容未生成** - 构建时因为 Twitter API 超时中断
2. **需要完整构建** - 中英文双语内容都需要生成

## ✅ 已修复

1. ✅ 删除了导致超时的 Tweet 嵌入
2. ✅ 推送修复到 GitHub
3. ✅ 添加了 GitHub Actions 自动部署

## 🚀 两种部署方法

### 方法一：使用 Cloudflare Pages GitHub 集成（最简单）

**步骤**：

1. **访问 Cloudflare Dashboard**
   ```
   https://dash.cloudflare.com
   ```

2. **连接 GitHub 仓库**
   - 点击 **Pages** → **Create a project**
   - 选择 **Connect to Git**
   - 授权 GitHub 并选择 `sxyseo/triz`

3. **配置构建设置**
   ```
   项目名称: triz-help

   构建设置:
   - 构建命令: 留空（或填 npx quarto@latest render）
   - 构建输出目录: _site
   - 根目录: /
   ```

4. **环境变量**（不需要）
   留空即可

5. **点击 "Save and Deploy"**

Cloudflare 会自动：
- ✅ 克隆你的 GitHub 仓库
- ✅ 安装 Quarto 并构建网站
- ✅ 生成中英文双语内容
- ✅ 部署到全球 CDN

### 方法二：使用 GitHub Actions（已配置）

**步骤**：

1. **获取 Cloudflare API Token**
   - 访问：https://dash.cloudflare.com/profile/api-tokens
   - 点击 "Create Token"
   - 使用 "Edit Cloudflare Workers" 模板
   - 权限需要包括：**Cloudflare Pages Edit**
   - 创建并复制 Token

2. **添加到 GitHub Secrets**
   - 访问：https://github.com/sxyseo/triz/settings/secrets/actions
   - 点击 "New repository secret"
   - 添加两个 secrets：

   **Secret 1**:
   - Name: `CLOUDFLARE_API_TOKEN`
   - Value: (粘贴你的 API Token)

   **Secret 2**:
   - Name: `CLOUDFLARE_ACCOUNT_ID`
   - Value: `1ee3166223d2e0ccc24e48636c5971cb`

3. **触发部署**
   - 任何推送到 main 分支都会自动触发构建和部署
   - 或访问 Actions 页面手动触发

## 🎯 推荐方法

**推荐使用方法一（Cloudflare Pages GitHub 集成）**，因为：
- ✅ 更简单，无需配置 secrets
- ✅ 自动检测 GitHub 更新
- ✅ 构建日志可视化
- ✅ 零成本

## 🔧 验证部署

部署完成后，访问：
- **临时 URL**：Cloudflare 会提供
- **自定义域名**：可以添加 `triz.help`

检查：
- ✅ 英文页面能打开：`/en/index.html`
- ✅ 中文页面能打开：`/zh/index.html`
- ✅ 语言切换链接工作
- ✅ 图片和资源加载正常

## 📝 当前状态

- ✅ GitHub 仓库已更新
- ✅ Tweet 嵌入问题已修复
- ✅ GitHub Actions 工作流已配置
- ⏳ 等待在 Cloudflare Pages 配置部署

## 💡 提示

如果使用方法一，不需要配置 GitHub Actions secrets。如果使用方法二，需要先获取 API Token。

两种方法都会构建完整的双语网站！
