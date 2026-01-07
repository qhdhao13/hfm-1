# GitHub Actions 版本说明

## ⚠️ 注意

这个GitHub Actions版本是n8n工作流的替代方案，可以在GitHub上直接运行，**无需n8n平台**。

## 📋 使用步骤

### 1. 配置Secrets（必需）

在GitHub仓库中设置以下Secrets：

1. 进入仓库 → **Settings** → **Secrets and variables** → **Actions**
2. 点击 **New repository secret**，添加：

   - **EMAIL_USER**: `qhdhao@126.com`
   - **EMAIL_PASSWORD**: 126邮箱的授权码（不是登录密码）
   - **SERVERCHAN_SENDKEY**: Server酱的SendKey（可选，如果不用微信推送可以不设置）

### 2. 启用工作流

1. 进入仓库的 **Actions** 标签页
2. 在左侧选择 **论语每日推送** 工作流
3. 点击 **Run workflow** 可以手动测试
4. 工作流会自动在每天UTC 0点（北京时间8点）执行

### 3. 测试

- 点击 **Actions** → **论语每日推送** → **Run workflow** → **Run workflow** 按钮
- 查看执行日志，确认是否成功

## 🔧 配置说明

### 邮件配置

- 使用126邮箱SMTP服务
- 需要授权码，不是登录密码
- 获取授权码：登录126邮箱 → 设置 → POP3/SMTP/IMAP → 开启SMTP → 生成授权码

### 微信推送（可选）

- 使用Server酱服务
- 注册地址：https://sct.ftqq.com/
- 获取SendKey后添加到Secrets

### 修改执行时间

编辑 `.github/workflows/lunyu-daily.yml`，修改cron表达式：

```yaml
schedule:
  - cron: '0 0 * * *'  # UTC 0点 = 北京时间8点
  # 其他时间示例：
  # '0 8 * * *'  # UTC 8点 = 北京时间16点
  # '0 12 * * *' # UTC 12点 = 北京时间20点
```

## ⚖️ 两种方案对比

| 特性 | n8n工作流 | GitHub Actions |
|------|----------|----------------|
| 运行平台 | n8n云端/自托管 | GitHub（免费） |
| 配置难度 | 中等 | 简单 |
| 可视化 | ✅ 有图形界面 | ❌ 无 |
| 免费额度 | 有限制 | 2000分钟/月 |
| 数据隐私 | 取决于平台 | GitHub托管 |
| 维护成本 | 自托管需要维护 | 无需维护 |

## 📝 推荐

- **新手用户**：使用GitHub Actions版本（这个文件）
- **需要可视化**：使用n8n工作流版本
- **需要更多功能**：使用n8n（功能更强大）

## ❓ 常见问题

### Q: GitHub Actions免费吗？
**A:** 是的，公开仓库完全免费，私有仓库每月有2000分钟免费额度。

### Q: 需要服务器吗？
**A:** 不需要。GitHub Actions在GitHub的服务器上运行。

### Q: 可以同时使用两种方案吗？
**A:** 可以，但建议只使用一种，避免重复推送。

