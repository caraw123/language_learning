#!/usr/bin/env bash
# 法语 A1 学习站 → GitHub Pages 一键部署脚本
# 用法：先把下面的占位符改成你自己的，然后在该目录运行  bash deploy.sh
set -e

# ========== 1. 改成你自己的信息 ==========
GITHUB_USERNAME="<caraw123>"   # GitHub 用户名，例如 kebiwu
REPO_NAME="<language_learning>"               # 仓库名，例如 francais-a1
YOUR_NAME="<language_learning>"               # git 提交显示的名字
YOUR_EMAIL="<kebiwu11@gmail.com>"             # 建议与 GitHub 账号邮箱一致

# 若用 HTTPS 而非 SSH，把下面这行取消注释并改用你的地址：
REMOTE_URL="https://github.com/${GITHUB_USERNAME}/${REPO_NAME}.git"

# ========== 2. 设置本仓库 git 身份（仅当前仓库，不影响全局）==========
git config user.name  "$YOUR_NAME"
git config user.email "$YOUR_EMAIL"

# ========== 3. 提交改动（有改动才提交）==========
if ! git diff --cached --quiet || ! git diff --quiet; then
  git add .
  git commit -m "feat: 法语 A1 学习站部署"
  echo "已提交。"
else
  echo "没有需要提交的新改动，跳过 commit。"
fi

# ========== 4. 关联远程仓库（如尚未关联）==========
if [ -n "${REMOTE_URL:-}" ]; then
  TARGET="$REMOTE_URL"
else
  TARGET="git@github.com:${GITHUB_USERNAME}/${REPO_NAME}.git"
fi

if ! git remote get-url origin >/dev/null 2>&1; then
  git remote add origin "$TARGET"
  echo "已添加远程：$TARGET"
else
  echo "远程 origin 已存在：$(git remote get-url origin)"
fi

# ========== 5. 推送 ==========
git push -u origin main

echo ""
echo "✅ 推送完成！"
echo "下一步：仓库 Settings → Pages → Source 选 GitHub Actions，稍等 1–2 分钟。"
echo "访问地址：https://${GITHUB_USERNAME}.github.io/${REPO_NAME}/"
