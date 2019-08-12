---
title: Hexo Theme Cake
comments: true
reward: true
menu:
  中文: /cake/ || eercast
  options: /en/cake/options/ || cog 
  plugins: /en/cake/plugins/ || plug 
  custom: /en/cake/custom/ || wrench 
---

# About

![](/cake/images/t1.png)

Hexo Theme Cake is a lovely theme based on the 7.1.0 version of NexT. Just like Cake, it's very delicious, and it's easy to do.

Cake has eliminated a lot of features already on NexT, most of which can be quickly integrated into the theme as plugins. If you find that NexT has it and Cake doesn't, you can submit the issue on [GitHub](https://github.com/JiangTJ/hexo-theme-cake) and I will support these features as soon as possible.

# Why

Why do I want to separate a topic separately? This mainly includes the following reasons
1. Practice some new features, most of which I will add to NexT, but due to the number of NexT users, need to consider compatibility, support will be slower
2. With greater control, I can do anything to refactor/remove some dissident features, such as the following example
  - Exturl encryption is meaningless for the front end, so it will be removed
  - Note Tag refactoring, adjusting its headers, removing style configuration (retaining a nice style, due to stylus customization)

> So if you like my style, try it out. If you prefer more built-in features, [NexT](https://github.com/theme-next/hexo-theme-next) might be better for you.

# Quick Start

```bash
# Create a new hexo project
hexo init <dir>
cd <dir>
# Add Cake theme as a submodule
git init
git add .
git submodule add https://github.com/JiangTJ/hexo-theme-cake themes/cake
```

Modify `theme` in `_config.yml` to `cake`.

`hexo s` runs, you can preview it locally