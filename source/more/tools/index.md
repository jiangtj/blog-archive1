---
title: 工具集
date: 2018-11-12 12:10:12
description: 收集各个领域前沿技术、方案、工具等，还有在线小工具~
comments: true
---

{% tabs Tools %}

<!-- tab 编辑器 -->
- Typora  markdown编辑器
- VS Code  代码编辑器
- OneNote 微软出的笔记应用
- IntelliJ IDEA java开发工具
<!-- endtab -->

<!-- tab 设计 -->
- 墨刀  原型模型设计
- 亿图 流程图软件，试用过期了还能用
- Sway 微软出的故事线应用
<!-- endtab -->

<!-- tab 文档 -->
- Docsify 静态文档工具
- VuePress 静态文档工具（配置复杂，seo优化好）
- Hexo+NexT
- 石墨文档 协作文档  
<!-- endtab -->

<!-- tab DevOps -->
- CI/CD
  - GitLab-CI 持续集成工具
  - Jenkins 持续集成工具（目前最主流的CI工具）
- 数据分析
  - TICK技术栈 数据采集、存储、分析、监控方案
  - Grafana 多数据源数据分析
  - Google 分析
<!-- endtab -->

<!-- tab 消息沟通 -->
- 客服支持
  - Chatra
  - Tidio
  - small.chat
- 内部沟通
  - Slack
  - Mattermost 开源的slack，企业内部消息平台
<!-- endtab -->

<!-- tab 排行 -->
- [TIOBE](https://www.tiobe.com/tiobe-index/)
- [TechEmpower Benchmarks](https://www.techempower.com/benchmarks/)
- [DB-Engines Ranking](https://db-engines.com/en/ranking)
<!-- endtab -->

<!-- tab 其他 -->
- Snipaste  截图工具(出了Win10商店版)
- Git2Go ios git client
<!-- endtab -->

{% endtabs %}



<style type="text/css">
#tools {
  display: flex;
  justify-content: center;
  flex-wrap: wrap;
}
#tools ul.nav-tabs {
  display: block;
  text-align: center;
  width: 25%;
  max-width: 120px;
}
#tools li.tab {
  border: 0;
}
#tools li.tab.active {
  border-radius: 0.25em;
  background-color: #fc6423;
  color: #fff;
}
#tools li.tab.active a {
    color: #fff;
}
#tools .tab-content {
  width: 75%;
}
#tools .tab-pane.active {
  border: 0;
  padding: 0;
}
#tools .tab-pane.active ul {
  margin: 0;
}
</style>
