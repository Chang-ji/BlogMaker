---
layout: post
current: post
cover: assets/built/images/waves.jpg
navigation: True
title: Startbucks Element center
date: 2021-08-24 10:18:00
tags: [Startbucks]
class: post-template
subclass: 'post'
author: Chanji
---
{% include Startbucks-table-of-contents.html %}

## Startbucks Element center

### Html
~~~html
<div class="promotion">
  <div class="swiper-container">
    TEST
  </div>
</div>
~~~

### css
~~~css
.notice .promotion {
  height: 693px;
  background-color:#f6f5ef;
  position:relative;                              // 기준 요소로 설정
}
/* width: calc(100% -50px) 예시 */ 
.notice .promotion .swiper-container {
  width: calc(819px * 3 + 10px * 2);              // css에서는 calc를 통해서 연산가능
  height: 553px;
  background-color: orange;
  text-align:center;
  font-size: 200px;
  position: absolute;                             // relative 기준으로 배치
  top: 40px;                                      // relative 기준으로 위에서 40px
  left: 50%;                                      // relative 기준으로 옆에서 절반으로 배치
  margin-left: calc((819px * 3 + 10px * 2)/-2);   // 절반으로 배치된 곳에서 요소 길이만큼 빼기하니 중앙으로 배치
}
~~~







