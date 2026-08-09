# 🇫🇷 每日法语 A1 · 场景学习站

一个纯静态、零依赖的法语 A1 场景学习网站。每个场景是一个独立 HTML 页面，包含：

- 场景核心词汇（按 **名词 / 动词 / 形容词·小词** 分类）
- 每个词的 **IPA 音标 + 汉字谐音** 辅助发音
- 一段场景对话 + 语法小贴士
- `index.html` 总目录（课程列表 + 复习单元 + 全部词汇速览）
- `revision-a1-uniteN.html` 复习单元（卡片词汇 + 纯前端自测小测）

## 目录结构

```
.
├── index.html                 # 总目录（首页）
├── francais-a1-YYYY-MM-DD.html # 每日场景页（如 francais-a1-2026-08-09.html）
├── revision-a1-uniteN.html    # 复习单元页（每 5 个场景生成 1 个）
├── .github/workflows/pages.yml# GitHub Pages 自动部署工作流
├── .nojekyll                  # 关闭 Jekyll 处理（纯静态站点）
└── .gitignore                 # 忽略 .workbuddy 私有数据
```

## 本地预览

无需任何构建，直接用任意静态服务器即可：

```bash
# 方式一：Python
python3 -m http.server 8000
# 浏览器打开 http://localhost:8000

# 方式二：Node
npx serve .
```

> 直接双击 `index.html` 也能打开，但用本地服务器可保证相对链接与自测脚本正常工作。

## 部署到 GitHub Pages

本仓库已内置 GitHub Actions 工作流（`.github/workflows/pages.yml`），推送即自动部署。

1. 在 GitHub 新建仓库（如 `francais-a1`）。
2. 把本目录推送到仓库的 `main` 分支：
   ```bash
   git remote add origin git@github.com:<你的用户名>/<仓库名>.git
   git push -u origin main
   ```
3. 仓库 **Settings → Pages → Build and deployment → Source** 选择
   **GitHub Actions**。
4. 首次推送后稍等 1–2 分钟，站点地址为
   `https://<你的用户名>.github.io/<仓库名>/`。

### 使用自定义域名（可选）

如需绑定自己的域名，在仓库根目录放一个 `CNAME` 文件，内容为你的域名
（如 `francais.example.com`），然后在 Settings → Pages 中填写该域名并配置 DNS。

## 技术说明

- 所有页面为自包含的单文件 HTML（CSS 内联在 `<style>`，JS 内联在 `<script>`）。
- 页面间使用相对链接（`./francais-a1-...`），因此可部署在任意子路径下。
- 无第三方 CDN、无构建步骤，符合 GitHub Pages 静态托管要求。
