---
layout: post
current: post
cover: assets/built/images/bus.jpg
navigation: True
title: Markdown Basic
date: 2021-08-16 10:18:00
tags: [markdown]
class: post-template
subclass: 'post'
author: Chanji
---
{% include markdown-table-of-contents.html %}

# MARKDOWN
## 장점
1. 문법이 쉽고 간결하다!
2. 관리가 쉽다.
3. 지원 가능한 플랫폼과 프로그램이 다양하다!

## 단점
1. 표준이 없다!
2. 모든 HTML 마크업을 대신하지 못한다!

# 참고 자료

https://theorydb.github.io/

# 제목(Header)

# 제목 1
## 제목 2
### 제목 3
#### 제목 4
##### 제목 5
###### 제목 6


# 문장(Paragraph)

동해물과 백두산이 마르고 닳도록
하느님이 보우하사 우리나라 만세

# 줄바꿈(Line Breaks)
~~~markdown
동해물과 백두산이 마르고 닳도록<br/>
하느님이 보우하사 우리나라 만세<br/>
무궁화 삼천리 화려 강산<br/>
대한 사람 대한으로 길이 보전하세<br/>
~~~

동해물과 백두산이 마르고 닳도록<br/>
하느님이 보우하사 우리나라 만세<br/>
무궁화 삼천리 화려 강산<br/>
대한 사람 대한으로 길이 보전하세<br/>

# 강조(Emphasis)

~~~markdown
_이텔릭_  
**두껍게**  
**_이텔릭 + 두껍게_**  
~~취소선~~  
<u>밑줄</u>
~~~

_이텔릭_  
**두껍게**  
**_이텔릭 + 두껍게_**  
~~취소선~~  
<u>밑줄</u>

# 목록(List)

~~~markdown
1. 순서가 필요한 목록
1. 순서가 필요한 목록
1. 순서가 필요한 목록
    1. 순서가 필요한 목록
    1. 순서가 필요한 목록
    1. 순서가 필요한 목록
1. 순서가 필요한 목록

- 순서가 필요하지 않은 목록
- 순서가 필요하지 않은 목록
- 순서가 필요하지 않은 목록
    - 순서가 필요하지 않은 목록
    - 순서가 필요하지 않은 목록
- 순서가 필요하지 않은 목록
~~~

1. 순서가 필요한 목록
1. 순서가 필요한 목록
1. 순서가 필요한 목록
    1. 순서가 필요한 목록
    1. 순서가 필요한 목록
    1. 순서가 필요한 목록
1. 순서가 필요한 목록

- 순서가 필요하지 않은 목록
- 순서가 필요하지 않은 목록
- 순서가 필요하지 않은 목록
    - 순서가 필요하지 않은 목록
    - 순서가 필요하지 않은 목록
- 순서가 필요하지 않은 목록

# 링크(Links)

~~~markdown
<a href="https://google.com">GOOGLE</a>  
[GOOGLE](https://google.com)
~~~

<a href="https://google.com">GOOGLE</a>  
[GOOGLE](https://google.com)

~~~markdown
<a href="https://naver.com" title="NAVER로 이동!">NAVER</a>  
[NAVER](https://naver.com "NAVER로 이동!")
~~~

<a href="https://naver.com" title="NAVER로 이동!">NAVER</a>  
[NAVER](https://naver.com "NAVER로 이동!")

# 이미지(image)
~~~markdown
https://heropy.blog/css/images/logo.png  
![HEROPY](https://heropy.blog/css/images/logo.png)

[![HEROPY](https://heropy.blog/css/images/logo.png)](https://heropy.blog)
~~~

https://heropy.blog/css/images/logo.png  
![HEROPY](https://heropy.blog/css/images/logo.png)

[![HEROPY](https://heropy.blog/css/images/logo.png)](https://heropy.blog)

# 인용문(BlockQuoto)

~~~markdown
> 남의 말이나 글에서 직접 또는 간접으로 따온 문장.  
> (네이버 국어 사전)

> 인용문을 작성하세요!
>> 중전된 인용문
>>> 중첩된 인용문 1  
>>> 중첩된 인용문 2  
>>> 중첩된 인용문 3
~~~

> 남의 말이나 글에서 직접 또는 간접으로 따온 문장.  
> (네이버 국어 사전)

> 인용문을 작성하세요!
>> 중전된 인용문
>>> 중첩된 인용문 1  
>>> 중첩된 인용문 2  
>>> 중첩된 인용문 3

# 인라인 (inline) 코드 강조

~~~markdown
CSS에서 `background` 혹은 `background-image` 속성으로 요소에 배경 이미지를 삽입할 수 있습니다.
~~~

CSS에서 `background` 혹은 `background-image` 속성으로 요소에 배경 이미지를 삽입할 수 있습니다.

# 블록(block) 코드 강조

## HTML
<a href="https://www.google.co.kr">GOOGLE</a>
~~~plaintext
~~~html
<a href="https://www.google.co.kr">GOOGLE</a>~~~
~~~

~~~html
<a href="https://www.google.co.kr">GOOGLE</a>
~~~

## CSS
~~~plaintext
~~~css
.list > li {
  position: absolute;
  top: 40px;
}~~~
~~~

~~~css
.list > li {
  position: absolute;
  top: 40px;
}
~~~

## JAVASCRIPT
~~~plaintext
~~~javascript
function func() {
  var a = 'AAA';
  return a;
}~~~
~~~

~~~javascript
function func() {
  var a = 'AAA';
  return a;
}
~~~

## BASH
~~~plaintext
~~~bash
$ git commit -m 'Study Markdown'~~~
~~~

~~~bash
$ git commit -m 'Study Markdown'
~~~

## PLAINTEXT
~~~plaintext
~~~plaintext
동해물과 백두산의 마르고 닳도록
하느님이 보우하사 우리나라 만세~~~
~~~

~~~plaintext
동해물과 백두산의 마르고 닳도록
하느님이 보우하사 우리나라 만세
~~~

# 표(Table)

position 속성

~~~markdown
값 | 의미 | 기본값
:--|:--:|--:
static | 기준 없음 | 0
relative | 요소 자신 | X
absolute | 위치 상 부모 요소 | X
fixed | 뷰포트 | X
~~~

값 | 의미 | 기본값
:--|:--:|--:
static | 기준 없음 | 0
relative | 요소 자신 | X
absolute | 위치 상 부모 요소 | X
fixed | 뷰포트 | X

# 원시 HTML(Raw HTML)
## 밑줄
~~~markdown
동해물과 <span style="text-decoration: underline;">백두산</span>이 마르고 닳도록<br/>
하느님이 보우하사 우리나라 만세
~~~
동해물과 <span style="text-decoration: underline;">백두산</span>이 마르고 닳도록<br/>
하느님이 보우하사 우리나라 만세

## 링크

~~~markdown
<a href="https://naver.com" title="NAVER로 이동!" target="_blank">NAVER</a>
~~~
<a href="https://naver.com" title="NAVER로 이동!" target="_blank">NAVER</a>

## 수평선

~~~markdown
---
~~~
---

## 이미지
~~~markdown
<img width="70" src="https://heropy.blog/css/images/logo.png" alt="HEROPY">
~~~
<img width="70" src="https://heropy.blog/css/images/logo.png" alt="HEROPY">

# 수평선(Horizontal Rule)
~~~markdown
---
***
___

~~~

---
***
___


