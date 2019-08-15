---
title: Plugins
comments: true
reward: true
menu:
  中文: /cake/plugins/ || plug
  home: /en/cake/ || eercast 
  options: /en/cake/options/ || cog 
  custom: /en/cake/custom/ || wrench 
---

Cake integrates additional features through plugins, and does not itself contain any files with additional features. So lightweight and powerful. Consistent with NexT's plugin solution (keep in sync with it), so you can go to [Awesome NexT](https://github.com/theme-next/awesome-next) to see more plugins

# List

The following are the plugins I have written, most of which are the original integrated functions of NexT, which I went out independently （＃￣～￣＃）

- [hexo-cake-canvas-ribbon](https://github.com/jiangtj-lab/hexo-cake-canvas-ribbon): Ribbon background
- [hexo-cake-math](https://github.com/jiangtj-lab/hexo-cake-math): Math Support
- [hexo-cake-live2d](https://github.com/jiangtj-lab/hexo-cake-live2d): Live2d support (different from upstream: only the Html files generated by Cake are not all)
- [hexo-cake-moon-menu](https://github.com/jiangtj-lab/hexo-cake-moon-menu): New lower right button (read progress and return to top button)
- [hexo-next-article-anchor](https://github.com/jiangtj-lab/hexo-next-article-anchor): Page title anchor
- [hexo-cake-local-search](https://github.com/jiangtj-lab/hexo-cake-local-search): Local search function

Some other plugins may be helpful for you to use hexo
- [hexo-netlify-cms](https://github.com/jiangtj/hexo-netlify-cms): Simplify the use of Netlify CMS (an online content editor)
- [hexo-theme-plus](https://github.com/jiangtj/hexo-theme-plus): Designed to externally replace the layout files inside the theme

# Use

```bash
# use npm
npm i <plugin-name>(example:hexo-cake-canvas-ribbon) --save
# or use yarn
yarn add <plugin-name>(example:hexo-cake-canvas-ribbon)
```

The Cake plugin is very easy to install, just like the normal hexo plugin, the only difference is that it works only on NexT or Cake themes ([the same plugin scheme](/cake/cubes)). See the plugin project for specific configuration.

# Create

View the article below
- [inject docs](https://theme-next.org/docs/advanced-settings#Injects): Introduction to NexT about inject
- [hexo next injects](https://www.dnocm.com/articles/beechnut/hexo-next-injects/): How to create an npm plugin