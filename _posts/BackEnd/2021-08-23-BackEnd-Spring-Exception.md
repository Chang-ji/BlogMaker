---
layout: post
current: post
cover: assets/built/images/sky.jpg
navigation: True
title: BackEnd - Spring
date: 2021-08-22 10:18:00
tags: [BackEnd]
class: post-template
subclass: 'post'
author: Chanji
---
{% include BackEnd-table-of-contents.html %}

# BackEnd Exception

## window 트리 형태로 파일 구조 출력
- 트리 주소: https://bustar.tistory.com/231</br>
- 현재 위치: https://m.blog.naver.com/superyeoju/221737848729</br>
~~~bash
tree %cd% /f /a
~~~

~~~
+---main
|   +---java
|   |   \---com
|   |       \---example
|   |           \---exception
|   |                   ExceptionApplication.java
|   |
|   \---resources
|       |   application.properties
|       |
|       +---static
|       \---templates
\---test
    \---java
        \---com
            \---example
                \---exception
                        ExceptionApplicationTests.java
~~~