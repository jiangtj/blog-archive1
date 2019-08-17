---
title: Options
include: fm-cake-en
i18n:
  中文: /cake/options/
  English: /en/cake/options/
---

> Most of them are the same as NexT, you can refer to [NexT Documentation](https://theme-next.org/), the following are the different sections.

# Menu

Submenu removed, changed to the shortcut menu for the article

## Sidebar menu

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

## Article shortcut menu

Need to be defined in the post_meta of the article, such as the configuration of this article

```yml
menu:
  home: /cake/ || eercast
  plugin: /cake/plugins/ || plug
  custom: /cake/custom/ || wrench
```

# Reward

Need to configure icon or name, it is recommended to maintain a uniform style, use icon. Image is required, url and url_name can be added as needed.

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

# Deprecated

- If you do not find an option in NexT in the Cake configuration, this feature may have been deprecated.

- The `vendors` will be discarded, and by default all js will go cdn. If you want js to be saved locally, download it from cdn and save it in the blog's resource directory, then change it to a local address in the cdn setup option.
