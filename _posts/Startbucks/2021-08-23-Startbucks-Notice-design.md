---
layout: post
current: post
cover: assets/built/images/waves.jpg
navigation: True
title: Startbucks - 공지사항 디자인
date: 2021-08-22 10:18:00
tags: [Startbucks]
class: post-template
subclass: 'post'
author: Chanji
---
{% include Startbucks-table-of-contents.html %}

## 순차적 요소 보이기
***
### HTML 구조
~~~html
<section class="notice">
    <div class="notice-line">
      <div class="bg-left"></div>
      <div class="bg-right"></div>
      <div class="inner">
        <div class="inner__left">
          <h2>공지사항</h2>
          <div class="swiper-container"></div>
          <a href="javascript:void(0)" class="notice-line__more">
            <span class="material-icons">add_circle</span>
          </a>
        </div>
        <div class="inner__right">
          <h2>스타벅스 프로모션</h2>
          <div class="toggle-promotion">
            <div class="material-icons">upload</div>
          </div>
        </div>
      </div>
    </div>
  </section>
~~~

- notice-line 을 기준으로 bg-left, bg-right, inner 로 구성됨
- inner 기준으로 inner__left, inner__right로 구성됨
- inner__left 기준으로 h2 태그, div 요소, a.material-icons으로 구성됨
- inner__right 기준으로 h2 태그, div 요소, a.material-icons으로 구성됨

### **css**
~~~css
.notice .notice-line{
  position: relative;
}
.notice .notice-line .bg-left{
  position: absolute;     // position relative 기준
  top: 0;                 // 위에서 0px
  left: 0;                // 왼쪽에서 0px
  width: 50%;             // 넓이 절반
  height: 100%;           // 높이 notice-line 과 같음
  background-color: #333; // 검은색
}
.notice .notice-line .bg-right{
  position: absolute;         // position relative 기준
  top: 0;                     // 위에서 0px
  right: 0;                   // 오른쪽에서 0px
  width: 50%;                 // 넓이 절반
  height: 100%;               // 높이 notice-line 과 같음
  background-color: #f6f5ef;  // 흰색
}
~~~

***

~~~css
.notice .notice-line .inner{
  height: 62px;
  display: flex;        // 수평쌓기
}
.notice .notice-line .inner .inner__left{
  width: 60%;
  height: 100%;
  background-color: #333;
  display: flex;         // 수평쌓기
  align-items: center;   // 수평정렬: 가운데 정렬
}
.notice .notice-line .inner .inner__left h2 {
  color: #fff;
  font-size: 17px;
  font-weight: 700;
  margin-right: 20px;
}
.notice .notice-line .inner .inner__left .swiper-container {
  height: 62px;
  background-color: orange;
  flex-grow:1;                // 수평쌓기 요소 최대로 늘이기
}
.notice .notice-line .inner .inner__left .notice-line__more {
  width: 62px;
  height: 62px;
  display: flex;              // 수평쌓기
  justify-content: center;    // 수평정렬: 가운데 정렬
  align-items: center;        // 수직정렬: 가운데 정렬
}
.notice .notice-line .inner .inner__left .notice-line__more .material-icons {
  color:#fff;
  font-size: 30px;
}
~~~

***
~~~css
.notice .notice-line .inner .inner__right{
  width: 40%;
  height: 100%;
  display: flex;              // 수평쌓기
  justify-content: flex-end;  // 수평정렬: 오른쪽 정렬
  align-items: center;        // 수직정렬: 가운데 정렬
}
.notice .notice-line .inner .inner__right h2{
  font-size: 17px;
  font-weight: 700;
}
.notice .notice-line .inner .inner__right .toggle-promotion{
  width: 62px;
  height: 62px;
  cursor: pointer;          // 커서 대면 포인터 보임
  display: flex;            // 수평쌓기
  justify-content: center;  // 수평정렬: 가운데 정렬
  align-items: center;      // 수직정렬: 가운데 정렬
}
.notice .notice-line .inner .inner__right .toggle-promotion .material-icons{
  font-size: 30px;
}
~~~






