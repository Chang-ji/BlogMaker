---
layout: post
current: post
cover: assets/built/images/waves.jpg
navigation: True
title: Startbucks Swiper
date: 2021-08-24 10:18:00
tags: [Startbucks]
class: post-template
subclass: 'post'
author: Chanji
---
{% include Startbucks-table-of-contents.html %}

## Startbucks Swiper
***
### swiperjs 설치
- 주소 : https://swiperjs.com/
- 예제 : https://swiperjs.com/demos
~~~html
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css" />
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />

<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
~~~

### Add Swiper HTML Layout
~~~html
<!-- Slider main container -->
<div class="swiper-container">
  <!-- Additional required wrapper -->
  <div class="swiper-wrapper">
    <!-- Slides -->
    <div class="swiper-slide">Slide 1</div>
    <div class="swiper-slide">Slide 2</div>
    <div class="swiper-slide">Slide 3</div>
    ...
  </div>
  <!-- If we need pagination -->
  <div class="swiper-pagination"></div>

  <!-- If we need navigation buttons -->
  <div class="swiper-button-prev"></div>
  <div class="swiper-button-next"></div>

  <!-- If we need scrollbar -->
  <div class="swiper-scrollbar"></div>
</div>
~~~

### Starbucks html swiper
~~~html
<div class="swiper-container">
  <div class="swiper-wrapper">
    <div class="swiper-slide">
      <a href="javascript:void(0)">크리스마스 & 연말연시 스타벅스 매장 영업시간</a>
    </div>
    <div class="swiper-slide">
      <a href="javascript:void(0)">[당첨자 발표] 2021 스타벅스 플래너 영수증 이벤트</a>
    </div>
    <div class="swiper-slide">
      <a href="javascript:void(0)">스타벅스커피 코리아 애플리케이션 버전 업데이트 안내</a>
    </div>
    <div class="swiper-slide">
      <a href="javascript:void(0)">[당첨자 발표] 뉴이어 전자영수증 이벤트</a>
    </div>
  </div>
</div>
~~~

- 위와 같은 예시로 설정해야함

### Starbucks css swiper
~~~css
.notice .notice-line .inner .inner__left .swiper-container {
  height: 62px;
  flex-grow:1;
}
.notice .notice-line .inner .inner__left .swiper-container .swiper-slide {
  height: 62px;
  display: flex;              // 수평으로 쌓음
  align-items: center;        // 수직정렬: 가운데
}
.notice .notice-line .inner .inner__left .swiper-container .swiper-slide a {
  color: #fff;
}
~~~


### Starbucks javascript swiper
~~~javascript
// new Swiper(선택자, 옵션)
new Swiper('.notice-line .swiper-container', {
  direction: 'vertical',
  autoplay: true,
  loop: true
});
~~~
- 위와 같이 Swiper 객체를 만들면 알아서 작동
- 이때 요소를 선택할 선택자와 옵션을 설정할 객체를 넣어야함







