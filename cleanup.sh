#!/bin/bash
# 磁盘清理脚本
# 用于清理常见的临时文件和缓存

echo "开始清理磁盘空间..."

# 1. 清理系统缓存（需要管理员权限）
echo "1. 清理系统缓存..."
sudo rm -rf ~/Library/Caches/* 2>/dev/null
echo "   系统缓存已清理"

# 2. 清理下载文件夹中的临时文件
echo "2. 清理下载文件夹中的临时文件..."
find ~/Downloads -name "*.tmp" -delete 2>/dev/null
find ~/Downloads -name "*.log" -delete 2>/dev/null
find ~/Downloads -name ".DS_Store" -delete 2>/dev/null
find ~/Downloads -name "*.cache" -delete 2>/dev/null
echo "   临时文件已清理"

# 3. 清空废纸篓
echo "3. 清空废纸篓..."
rm -rf ~/.Trash/* 2>/dev/null
echo "   废纸篓已清空"

# 4. 清理Xcode缓存（如果有）
echo "4. 清理Xcode缓存..."
rm -rf ~/Library/Developer/Xcode/DerivedData/* 2>/dev/null
rm -rf ~/Library/Developer/Xcode/Archives/* 2>/dev/null
echo "   Xcode缓存已清理"

# 5. 清理npm缓存
echo "5. 清理npm缓存..."
npm cache clean --force 2>/dev/null
echo "   npm缓存已清理"

# 6. 清理pip缓存
echo "6. 清理pip缓存..."
pip cache purge 2>/dev/null
echo "   pip缓存已清理"

# 7. 显示清理后的空间
echo ""
echo "清理完成！"
df -h / | tail -1

