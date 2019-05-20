---
title: Spring Cloud 之 Gateway （Greenwich版）
categories: [DevOps]
tags: [微服务,Spring Cloud]
date: 2019-05-20 21:16:33
---

众所周知，netflix OSS 2.0 难产了，上一代的zuul网关虽说不错，但其并不是异步的。所以，Spring团队推出了基于Spring Webflux的全新异步的网关--Spring Cloud Gateway。

> 本文内容基于Spring Cloud Gateway 2.1.0.GA

来跟着我一步步，探索它的~~魅力~~坑吧！

<!-- more -->

# 环境搭建

与所有的微服务组件一样，demo总是很简单的，如果你要启用，创建时勾上相关依赖即可。

就像这样：
```xml
<dependencies>
        <dependency>
            <groupId>org.springframework.cloud</groupId>
            <artifactId>spring-cloud-starter-gateway</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.cloud</groupId>
            <artifactId>spring-cloud-starter-netflix-eureka-client</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.cloud</groupId>
            <artifactId>spring-cloud-starter-netflix-hystrix</artifactId>
        </dependency>

        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-configuration-processor</artifactId>
            <optional>true</optional>
        </dependency>
        <dependency>
            <groupId>org.projectlombok</groupId>
            <artifactId>lombok</artifactId>
            <optional>true</optional>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-test</artifactId>
            <scope>test</scope>
        </dependency>
    </dependencies>
```
其中`lombok`是我的习惯，你可以选择不添加。

启动类修改为`@SpringCloudApplication`。
```java
@SpringCloudApplication
public class SpringCloudGatewayApplication {
    public static void main(String[] args) {
        SpringApplication.run(SpringCloudGatewayApplication.class, args);
    }
}
```

添加些简单配置（一个路由），跳转到我的博客，直接填写了url。由于只涉及网关，所以我把不必要的eureka关了，但实际开发中需要使用它，并添加ribbon路由`lb://<service-name>`
```yml
spring:
  cloud:
    gateway:
      routes:
        - id: app
          uri: http://www.dnocm.com
          # lb: Ribbon
          # uri: lb://app-name
          predicates:
            - Path=/app/**
          filters:
            # Strip first path，such base
            - StripPrefix=1
            # - RewritePath=/base/,/
eureka:
  client:
    enabled: false
```

就此完成，启动运行。当你访问`localhost:8080/app/**`路由时，都会调整至`www.dnocm.com/**`。这是因为我设置了`http`一律`302`跳转至`https`。所以，这证明我们的网关搭建完成啦！！

# Route Predicate Factory
id uri顾名思义，不多说，但predicates是什么呢？predicates做动词有`使基于; 使以…为依据; 表明; 阐明; 断言;`的意思，简单说，用于表明在那种条件下，该路由配置生效。

官方提供给我了许多的predicates
```yml
spring:
  cloud:
    gateway:
      routes:
      - id: after_route
        uri: http://example.org
        predicates:
        # 匹配在什么时间之后的
        - After=2017-01-20T17:42:47.789-07:00[America/Denver]
        # 匹配在什么时间之前的
        - Before=2017-01-20T17:42:47.789-07:00[America/Denver]
        # 匹配在某段时间的
        - Between=2017-01-20T17:42:47.789-07:00[America/Denver], 2017-01-21T17:42:47.789-07:00[America/Denver]
        # 匹配cookie名称为`chocolate`的值要符合`ch.p`正则.
        - Cookie=chocolate, ch.p
        # 匹配header为`X-Request-Id`的值要符合`\d+`正则.
        - Header=X-Request-Id, \d+
        # 匹配任意符合`**.somehost.org`与`**.anotherhost.org`正则的网址
        - Host=**.somehost.org,**.anotherhost.org
        # Host还支持模版变量，会保存在`ServerWebExchange.getAttributes()`的 ServerWebExchangeUtils.URI_TEMPLATE_VARIABLES_ATTRIBUTE中，以Map形式存储
        - Host={sub}.myhost.org
        # 匹配GET方法
        - Method=GET
        # 路径匹配，与Host一样支持模版变量，存在URI_TEMPLATE_VARIABLES_ATTRIBUTE中。
        - Path=/foo/{segment},/bar/{segment}
        # 匹配存在baz查询参数
        - Query=baz
        # 匹配存在foo且符合`ba.`正则
        - Query=foo, ba.
        # 匹配远程地址
        - RemoteAddr=192.168.1.1/24
```

官方几乎提供了我们所需的全部功能，这点值得鼓掌👏，然而假如遇到无法满足的情况呢？我们翻阅文档，发现自定义部分是大写的`TBD`待定ヾ(｡｀Д´｡)。

那么怎么办呢？我们从官方的Predicate Factory看起，去学习。

挑个简单的`HeaderRoutePredicateFactory`

```java
public class HeaderRoutePredicateFactory extends AbstractRoutePredicateFactory<HeaderRoutePredicateFactory.Config> {

	public static final String HEADER_KEY = "header";
	public static final String REGEXP_KEY = "regexp";

	public HeaderRoutePredicateFactory() {
		super(Config.class);
	}

	@Override
	public List<String> shortcutFieldOrder() {
		return Arrays.asList(HEADER_KEY, REGEXP_KEY);
	}

	@Override
	public Predicate<ServerWebExchange> apply(Config config) {
		boolean hasRegex = !StringUtils.isEmpty(config.regexp);

		return exchange -> {
			List<String> values = exchange.getRequest().getHeaders()
					.getOrDefault(config.header, Collections.emptyList());
			if (values.isEmpty()) {
				return false;
			}
			// values is now guaranteed to not be empty
			if (hasRegex) {
				// check if a header value matches
				return values.stream().anyMatch(value -> value.matches(config.regexp));
			}

			// there is a value and since regexp is empty, we only check existence.
			return true;
		};
	}

	@Validated
	public static class Config {

		@NotEmpty
		private String header;

		private String regexp;

		public String getHeader() {
			return header;
		}

		public Config setHeader(String header) {
			this.header = header;
			return this;
		}

		public String getRegexp() {
			return regexp;
		}

		public Config setRegexp(String regexp) {
			this.regexp = regexp;
			return this;
		}

	}

}
```
上面的例子，我们可以看出
- HeaderRoutePredicateFactory的构造方式与继承类视乎是固定的，目的是传递配置类
- 需要实现`Predicate<ServerWebExchange> apply(Consumer<C> consumer)`
- shortcutFieldOrder()似乎是为了配置值与配置类属性对应的
- 需要定义接受的配置类
- 查看继承可以发现，它通过`NameUtils.normalizeRoutePredicateName(this.getClass())`来获取配置文件中的名称

Okay，验证上面的内容，我们重新编写一个`NonHeaderRoutePredicateFactory`，与head取反。同时配置类属性的交换位置。
```java
public class NonHeaderRoutePredicateFactory extends AbstractRoutePredicateFactory<NonHeaderRoutePredicateFactory.Config> {

	public static final String HEADER_KEY = "header";
	public static final String REGEXP_KEY = "regexp";

	public NonHeaderRoutePredicateFactory() {
		super(Config.class);
	}
	@Override
	public List<String> shortcutFieldOrder() {
		return Arrays.asList(HEADER_KEY, REGEXP_KEY);
	}
	@Override
	public Predicate<ServerWebExchange> apply(Config config) {
		boolean hasRegex = !StringUtils.isEmpty(config.regexp);
		return exchange -> {
			List<String> values = exchange.getRequest().getHeaders().getOrDefault(config.header, Collections.emptyList());
			if (values.isEmpty()) {
				return true;
			}
			if (hasRegex) {
				return values.stream().noneMatch(value -> value.matches(config.regexp));
			}
			return false;
		};
	}
	@Data
	@Validated
	public static class Config {
		private String regexp;
		@NotEmpty
		private String header;
	}
}
```

配置添加`- NonHeader=tt`，当存在`tt`header时 `404 ERROR`，不存在时，正常访问。符合推测！

# GatewayFilter Factory
TBD

# Global Filter
TBD

# Fluent Java Routes API
TBD

# Others
TBD
