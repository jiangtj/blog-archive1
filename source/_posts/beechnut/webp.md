---
title: 全站图片转换WebP格式
date: 2019-03-22 23:20:30
---
Netlify目前存在流量限制，虽然足够，但还是希望更节省些。另外压缩图片可以加快用户端的载入。

写了个脚本用于支持转换。脚本地址：<https://github.com/JiangTJ/hexo-theme-next/blob/neet/scripts/console/pic.js>

需要添加依赖
```bash
yarn add imagemin
yarn add imagemin-webp
```

使用
- `hexo webp -a [--all]` 转换所有`source/_post`下的图片至webp格式
- `hexo webp -c [--clean]` 删除所有`source/_post`下已转换的图片
- `hexo webp --images` 转换`source/images`下的图片至webp格式
- `hexo webp path` 转换`source/_post/{path}`下的图片至webp格式
- `hexo webp --path path` 转换`{path}`下的图片至webp格式

或许可以单独把它作为一个npm库，稍后弄

你还可以尝试在`hexo g`构建时，执行转换，由于我使用netlify的图像转换服务，不支持构建时转换图片。。。
