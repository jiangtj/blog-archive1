---
title: 配置
comments: true
reward: true
menu:
  Home: /cake/ || eercast 
  插件: /cake/plugins/ || plug 
  自定义: /cake/custom/ || wrench 
  集成: /cake/cubes/ || cubes 
---

> 大部分与NexT一样，您可以参考[NexT文档](https://theme-next.org/)，下面是不同部分。

# 菜单

原子菜单去除，改为针对文章的快捷菜单

## 侧边栏菜单

```yaml
# When running the site in a subdirectory (e.g. domain.tld/blog), remove the leading slash from link value (/archives -> archives).
# Usage: `Key: /link/ || icon`
# Key is the name of menu item. If the translation for this item is available, the translated text will be loaded, otherwise the Key name will be used. Key is case-senstive.
# Value before `||` delimeter is the target link.
# Value after `||` delimeter is the name of FontAwesome icon. If icon (with or without delimeter) is not specified, question icon will be loaded.
# External url should start with http:// or https://
menu:
  home: / || home
  #tags: /tags/ || tags
  #categories: /categories/ || th
  archives: /archives/ || archive
  #sitemap: /sitemap.xml || sitemap
  #commonweal: /404/ || heartbeat

# Enable / Disable menu icons / item badges.
menu_settings:
  icons: true
  badges: false
```

## 文章快捷菜单

需要在文章的post_meta中定义，例如这篇文章的配置

```yml
menu:
  Home: /cake/ || eercast 
  插件: /cake/plugins/ || plug 
  自定义: /cake/custom/ || wrench 
  集成: /cake/cubes/ || cubes 
```

# 赞赏

需要配置icon或者name，建议保持统一样式，使用icon。image是必填想，url与url_name可依据需要添加。

```yml
# Reward (Donate)
reward_settings:
  # If true, reward would be displayed in every article by default.
  # You can show or hide reward in a specific article throuth `reward: true | false` in Front Matter.
  enable: false
  comment: Donate comment here

reward:
  wechat:
    icon: weixin
    image: /images/wechatpay.png
  alipay:
    name: 支
    image: /images/alipay.png
    url_name: 点击跳转
    url: HTTPS://QR.ALIPAY.COM/FKX06416WJNHOWKMRQQFFE
  paypal:
    icon: paypal
    image: /images/paypal.png
    url: https://www.paypal.me/jiangtj
```

# 废弃

- 如果你在Cake配置中未找到NexT中存在选项，那么这个功能可能已经被废弃。

- 将废弃`vendors`，默认情况下所有的js都走cdn。如果你可能希望js保存在本地，那么通过cdn下载下来，并保存在blog的资源目录，然后在cdn设置选项中修改为本地地址即可。
