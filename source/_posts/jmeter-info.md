---
title: 利用Jmeter进行压力测试
date: 2018-5-15
categories: [工具]
tags: [Jmeter,压力测试]
---

压力测试（Stress Test），也称为强度测试、负载测试。压力测试是模拟实际应用的软硬件环境及用户使用过程的系统负荷，长时间或超大负荷地运行测试软件，来测试被测系统的性能、可靠性、稳定性等。目前互联网的环境下，压力测试是必不可少的，其中Apache JMeter是目前主流的开源的压力测试工具。

Apache JMeter是Apache组织开发的基于Java的压力测试工具。用于对软件做压力测试，它最初被设计用于Web应用测试，但后来扩展到其他测试领域。 它可以用于测试静态和动态资源，例如静态文件、Java 小服务程序、CGI 脚本、Java 对象、数据库、FTP 服务器， 等等。JMeter 可以用于对服务器、网络或对象模拟巨大的负载，来自不同压力类别下测试它们的强度和分析整体性能。另外，JMeter能够对应用程序做功能/回归测试，通过创建带有断言的脚本来验证你的程序返回了你期望的结果。为了最大限度的灵活性，JMeter允许使用正则表达式创建断言。

<!-- more -->

# 开始

## 下载
Jmeter可以在官网<https://jmeter.apache.org/download_jmeter.cgi>直接下载编译过的文件    
```bash
wget http://mirrors.shu.edu.cn/apache/jmeter/binaries/apache-jmeter-4.0.zip -O jmeter.zip
```
## 配置
下载好后解压，并修改配置文件，使其启动时默认使用中文语言     
${jmeter-dir}/bin/jmeter.properties 37行左右      
```properties
#Preferred GUI language. Comment out to use the JVM default locale's language.
language=zh_CN
```

## 运行
Windows下双击jmeter.bat启动，Linux或者其他用相应的脚本启动

# 测试计划

jmeter可以自定义测试计划，比较常用的有线程组（用户组）、线程（用户）、控制器、定时器和监听器等

## 线程组
一般都需要

# 测试结果



# 插件

## MQTT


