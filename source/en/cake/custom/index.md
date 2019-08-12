---
title: Custom
comments: true
reward: true
menu:
  中文: /cake/custom/ || wrench
  home: /en/cake/ || eercast
  options: /en/cake/options/ || cog 
  plugins: /en/cake/plugins/ || plug 
---

Cake provides powerful customization features to ensure that you can inject new components without modifying theme files, or replace theme files with external files.

# Inject

Cake provides a new filter type `theme_inject`, which you can use to add your custom content to the provided injection points.

E.g:

```js
Hexo.extend.filter.register('theme_inject', function(injects) {
  Injects.head.file('custom', 'source/_data/head.swig', {}, {cache: true});
  Injects.sidebar.raw('custom', 'Put some in sidebar!');
});
```

Currently have injection points: [View injects-point.js](https://github.com/jiangtj/hexo-theme-cake/blob/master/scripts/injects-point.js)

Api:

- View: injects.[point].file/raw(name, file/raw[, locals][, options])
- Css: injects.[point].push(file)

> Added Inject to NexT, go to [NexT Documentation](https://theme-next.org/docs/advanced-settings#Injects) for more detailed usage

# Replace

This part is the function of hexo, which is supported in most themes (you need to replace include with partial, and Cake can be replaced except for the root of layout).

```js
Const fs = require('fs');
Hexo.extend.filter.register('before_generate', function (data) {
  hexo.theme.setView('File path to be replaced', fs.readFileSync('your custom file').toString());
});
```

You can also simplify this part of the work with [hexo-theme-plus](https://github.com/JiangTJ/hexo-theme-plus)
