---
title: 插件
comments: true
reward: true
menu:
  English: /en/cake/plugins/ || plug
  主页: /cake/ || eercast
  基础配置: /cake/options/ || cog
  自定义: /cake/custom/ || wrench
---

Cake通过插件集成附加的功能，而本身不包含附加功能的任何文件。所以轻量且强大。与NexT的插件方案一致（保持与它的同步），所以你可以前往[Awesome NexT](https://github.com/theme-next/awesome-next)查看更多的插件

# List

下面是我所编写的插件，其中大部分是NexT原本集成的功能，被我独立出去的（＃￣～￣＃）

- [hexo-cake-canvas-ribbon](https://github.com/jiangtj-lab/hexo-cake-canvas-ribbon): Ribbon背景
- [hexo-cake-math](https://github.com/jiangtj-lab/hexo-cake-math): Math支持
- [hexo-cake-live2d](https://github.com/jiangtj-lab/hexo-cake-live2d): Live2d支持(与上游区别：仅Cake生成的Html文件非全部)
- [hexo-cake-moon-menu](https://github.com/jiangtj-lab/hexo-cake-moon-menu): 新的右下角按钮(阅读进度与返回顶部按钮)
- [hexo-cake-local-search](https://github.com/jiangtj-lab/hexo-cake-local-search): 本地搜索功能

另外的一些插件，可能对你使用hexo有帮助
- [hexo-netlify-cms](https://github.com/jiangtj/hexo-netlify-cms)：简化Netlify CMS（一个在线的内容编辑器）的使用
- [hexo-theme-plus](https://github.com/jiangtj/hexo-theme-plus)：旨在外部替换主题内部的布局文件

还有些例子，如果你希望自己编写插件，可以参考
- [hexo-next-article-anchor](https://github.com/jiangtj-lab/hexo-next-article-anchor): 页面标题锚点
- [hexo-next-wapper-tag-cloud](https://github.com/jiangtj-lab/hexo-next-wapper-tag-cloud)：封装hexo-tag-cloud插件

# Use

```bash
# use npm
npm i <plugin-name>(example:hexo-cake-canvas-ribbon) --save
# or use yarn
yarn add <plugin-name>(example:hexo-cake-canvas-ribbon)
```

Cake插件非常容易安装，就像普通的hexo的插件一样，唯一的区别在于仅在NexT或者Cake主题（[相同的插件方案](/cake/cubes)）下有效。具体配置见插件项目。

# Create

查看下面的文章
- [inject docs](https://theme-next.org/docs/advanced-settings#Injects)：NexT关于inject的介绍
- [hexo next injects](https://www.dnocm.com/articles/beechnut/hexo-next-injects/)：如何创建一个npm插件
