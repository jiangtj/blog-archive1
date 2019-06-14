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

TBD.

> You can read [NexT docs](https://theme-next.org/) before complete.

> 标记：目前到300行赞赏

# 基础配置

## favicon

设置网站icon

```yaml
favicon:
  #small: /images/favicon-64.png
  #medium: /images/favicon-128.png
  #apple_touch_icon: /images/favicon-128.png
  #safari_pinned_tab: /images/favicon.svg
  #android_manifest: /images/manifest.json
  #ms_browserconfig: /images/browserconfig.xml
```

## 页脚

定义站点页脚内容

```yaml
footer:
  # Specify the date when the site was setup. If not defined, current year will be used.
  #since: 2015

  # Icon between year and copyright info.
  icon:
    # Icon name in fontawesome, see: https://fontawesome.com/v4.7.0/icons/
    # `heart` is recommended with animation in red (#ff0000).
    name: user
    # If you want to animate the icon, set it to true.
    animated: false
    # Change the color of icon, using Hex Code.
    color: "#808080"

  # If not defined, `author` from Hexo main config will be used.
  copyright:

  powered:
    # Hexo link (Powered by Hexo).
    enable: true
    # Version info of Hexo after Hexo link (vX.X.X).
    version: true

  theme:
    # Theme & scheme info link (Theme - NexT.scheme).
    enable: true
    # Version info of NexT after scheme info (vX.X.X).
    version: true

  # Beian icp information for Chinese users. In China, every legal website should have a beian icp in website footer.
  # http://www.miitbeian.gov.cn
  beian:
    enable: false
    icp:

  # Any custom text can be defined here.
  #custom_text: Hosted by <a href="https://pages.coding.me" class="theme-link" rel="noopener" target="_blank">Coding Pages</a>
```

## 转载权限配置

```yaml
# Creative Commons 4.0 International License.
# See: https://creativecommons.org/share-your-work/licensing-types-examples
# Available values of license: by | by-nc | by-nc-nd | by-nc-sa | by-nd | by-sa | zero
# You can set a language value if you prefer a translated version of CC license.
# CC licenses are available in 39 languages, where you can find the specific and correct abbreviation you need.
# Valid values of language: deed.zh, deed.fr, deed.de, etc.
creative_commons:
  license: by-nc-sa
  sidebar: false
  post: true
  language:
```

## SEO

```yaml
# Set a canonical link tag in your hexo, you could use it for your SEO of blog.
# See: https://support.google.com/webmasters/answer/139066
# Tips: Before you open this tag, remember set up your URL in hexo _config.yml (e.g. url: http://yourdomain.com)
canonical: true

# Change headers hierarchy on site-subtitle (will be main site description) and on all post / page titles for better SEO-optimization.
seo: false

# If true, will add site-subtitle to index page, added in main hexo config.
# subtitle: Subtitle
index_with_subtitle: false
```

## 菜单

### 侧边栏菜单

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

### 文章快捷菜单

需要在文章的post_meta中定义，例如这篇文章的配置

```yml
menu:
  Home: /cake/ || eercast 
  插件: /cake/plugins/ || plug 
  自定义: /cake/custom/ || wrench 
  集成: /cake/cubes/ || cubes 
```

## 侧边栏

```yml
sidebar:
  # Sidebar Position, available values: left | right (only for Pisces | Gemini).
  position: left
  #position: right

  # Manual define the sidebar width. If commented, will be default for:
  # Muse | Mist: 320
  # Pisces | Gemini: 240
  #width: 300

  # Sidebar Display, available values (only for Muse | Mist):
  #  - post    expand on posts automatically. Default.
  #  - always  expand for all pages automatically.
  #  - hide    expand only when click on the sidebar toggle icon.
  #  - remove  totally remove sidebar including sidebar toggle.
  display: post
  
  # Enable sidebar on narrow view (only for Muse | Mist).
  onmobile: true
  # Click any blank part of the page to close sidebar (only for Muse | Mist).
  dimmer: false

# Posts / Categories / Tags in sidebar.
site_state: true
```

### 社交链接

```yml
# Social Links
# Usage: `Key: permalink || icon`
# Key is the link label showing to end users.
# Value before `||` delimeter is the target permalink.
# Value after `||` delimeter is the name of FontAwesome icon. If icon (with or without delimeter) is not specified, globe icon will be loaded.
social:
  #GitHub: https://github.com/yourname || github
  #E-Mail: mailto:yourname@gmail.com || envelope
  #Weibo: https://weibo.com/yourname || weibo
  #Google: https://plus.google.com/yourname || google
  #Twitter: https://twitter.com/yourname || twitter
  #FB Page: https://www.facebook.com/yourname || facebook
  #VK Group: https://vk.com/yourname || vk
  #StackOverflow: https://stackoverflow.com/yourname || stack-overflow
  #YouTube: https://youtube.com/yourname || youtube
  #Instagram: https://instagram.com/yourname || instagram
  #Skype: skype:yourname?call|chat || skype

social_icons:
  enable: true
  icons_only: false
  transition: false

# Blog rolls
links_icon: link
links_title: Links
links_layout: block
#links_layout: inline
links:
  #Title: http://example.com
```

### 头像

```yml
# Sidebar Avatar
avatar:
  # In theme directory (source/images): /images/avatar.gif
  # In site directory (source/uploads): /uploads/avatar.gif
  # You can also use other linking images.
  url: /images/avatar.jpg
  # If true, the avatar would be dispalyed in circle.
  rounded: true
  # The value of opacity should be choose from 0 to 1 to set the opacity of the avatar.
  opacity: 1
  # If true, the avatar would be rotated with the cursor.
  rotated: false
```

### 目录

```yml
# Table Of Contents in the Sidebar
toc:
  enable: true
  # Automatically add list number to toc.
  number: true
  # If true, all words will placed on next lines if header width longer then sidebar width.
  wrap: false
  # If true, all level of TOC in a post will be displayed, rather than the activated part of it.
  expand_all: false
  # Maximum heading depth of generated toc. You can set it in one post through `toc_max_depth` in Front Matter.
  max_depth: 6
```

## 返回顶部按钮

```yml
back2top:
  enable: true
  # Back to top in sidebar.
  sidebar: false
  # Scroll percent label in b2t button.
  scrollpercent: false
```

## 文章

```yml
# Automatically scroll page to section which is under <!-- more --> mark.
scroll_to_more: true

# Automatically Excerpt (Not recommend).
# Use <!-- more --> in the post to control excerpt accurately.
auto_excerpt:
  enable: false
  length: 150

# Read more button
# If true, the read more button would be displayed in excerpt section.
read_more_btn: true

# Post meta display settings
post_meta:
  item_text: false
  created_at: true
  updated_at:
    enable: false
    another_day: true
  categories: true

codeblock:
  # Add copy button on codeblock
  copy_button:
    enable: false
    # Show text copy result
    show_result: false
```

## 赞赏

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


# 第三方配置

这里的配置会在将来移至独立插件

## Baidu Transformation?

```yaml
# Disable Baidu transformation on mobile devices.
disable_baidu_transformation: false
```

## Site Verification

```yaml
# Google Webmaster tools verification.
# See: https://www.google.com/webmasters
google_site_verification:

# Bing Webmaster tools verification.
# See: https://www.bing.com/webmaster
bing_site_verification:

# Yandex Webmaster tools verification.
# See: https://webmaster.yandex.ru
yandex_site_verification:

# Baidu Webmaster tools verification.
# See: https://ziyuan.baidu.com/site
baidu_site_verification:
```

## 滑动保存

```yaml
# Automatically saving scroll position on each post / page in cookies.
save_scroll: false
```

## 计数

```yml
# Post wordcount display settings
# Dependencies: https://github.com/theme-next/hexo-symbols-count-time
symbols_count_time:
  separated_meta: true
  item_text_post: true
  item_text_total: false
  awl: 4
  wpm: 275
```

## 微信订阅

```yml
# Wechat Subscriber
wechat_subscriber:
  enable: false
  #qcode: /path/to/your/wechatqcode e.g. /uploads/wechat-qcode.jpg
  #description: e.g. subscribe to my blog by scanning my public wechat account
```


# 废弃配置

这里的配置在将来不可用，或者已经废弃

```yml
# todo 使用stylus变量实现
text_align:
  # Available values: start | end | left | right | center | justify | justify-all | match-parent
  desktop: justify
  mobile: justify

# todo 使用stylus变量实现
codeblock:
  # Manual define the border radius in codeblock, leave it blank for the default value: 1
  border_radius:
  # Add copy button on codeblock
  copy_button:
    # Style: only 'flat' is currently available, leave it blank if you prefer default theme
    style:
```
