---
title: Java设计模式之建筑者模式.
date: 2016-7-19
categories: [java]
tags: [java,设计模式]
---
初看java设计模式-建造者模式时，肯定有和我一样有疑惑的。网上的例子几乎都一样，但是却没new xxx.Builder().buildxx().buildxx()...这样的。那么我今天来讲讲这种建造者模式的实现。

首先按照我的惯例，先给例子后解说

### 例子
Product.java
<!-- more -->
```java
package com.jtj.builder;

public class Product {

	private String part1;
	private String part2;
	private String part3;
	
	public String getPart1() {
		return part1;
	}
	public void setPart1(String part1) {
		this.part1 = part1;
	}
	public String getPart2() {
		return part2;
	}
	public void setPart2(String part2) {
		this.part2 = part2;
	}
	public String getPart3() {
		return part3;
	}
	public void setPart3(String part3) {
		this.part3 = part3;
	}
	
	public String getProduct(){
		return new StringBuilder().append(part1)
				.append(",")
				.append(part2)
				.append(",")
				.append(part3)
				.toString();
	}
	
	public static class Builder{
		
		private Product product;
		
		public Builder(){
			product=new Product();
		}

		public Builder buildPart1(String part1){
			product.setPart1(part1);
			return this;
		}
		public Builder buildPart2(String part2){
			product.setPart2(part2);
			return this;
		}
		public Builder buildPart3(String part3){
			product.setPart3(part3);
			return this;
		}
		public Product build(){
			return product;
		}
		
	}

}
```
Main.java
```java
package com.jtj.builder;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Product product = new Product.Builder()
		        .buildPart1("qq")
				.buildPart2("2")
				.buildPart3("sa")
				.build();
		System.out.println(product.getProduct());
	}

}
```
### 结果
```java
qq,2,sa
```
### 说明
product是产品，是我们需要构建的对象，里面有静态的构造器Builder，由于是静态类，里面构造方法在使用的时候最开始便会构造，也就是里面的product每次使用时都会先实例化一个。
之后每次buildxxx后，我们可以看到返回的都是this,也就是这个静态类，就是这个原因，我们便可以在后面不断的连续buildxxx。
最后通过一个build返回所实例化的product。
