---
layout: post
current: post
cover: assets/built/images/waves.jpg
navigation: True
title: Startbucks - 순차적 요소 보이기
date: 2021-08-22 10:18:00
tags: [Startbucks]
class: post-template
subclass: 'post'
author: Chanji
---
{% include Startbucks-table-of-contents.html %}

## 순차적 요소 보이기
***
### **html**
~~~html
<!-- VISUAL -->
  <section class="visual">
    <div class="inner">
      <div class="title fade-in">
        <img src="/images/visual_title.png" alt="STARBUCKS DELIGHTFUL START TO THE YEARS" />
        <a href="javascript:void(0)" class="btn btn--brown">자세히 보기</a>
      </div>
      <div class="fade-in">
        <img src="/images/visual_cup1.png" alt=" new OATMEAL LATTE" class="cup1 image" />
        <img src="/images/visual_cup1_text.png" alt="오트밀 라떼" class="cup1 text" />
      </div>
      <div class="fade-in">
        <img src="/images/visual_cup2.png" alt="new STARBUCKS CARAMEL CRUMBLE MOCHA" class="cup2 image" />
        <img src="/images/visual_cup2_text.png" alt="스타벅스 카라멜 크럼블 모카" class="cup2 text" />
      </div>
      <div class="fade-in">
        <img src="/images/visual_spoon.png" alt="Spoon" class="spoon" />
      </div>
    </div>
  </section>
~~~

> 각각의 이미지에 div 요소 및 fade-in class 추가<br/>
visual_title => visual_cup1 => visual_cup2 => visual_spoon

### **css**
~~~css
.visual .fade-in {
  opacity: 0;
}
~~~

> visual fade-in 클래스 요소 투명도 0으로 설정<br/>
향후에 각각의 요소를 투명도 1로 변경하여 순차적으로 보이게함

### **javascript**
~~~javascript
const fadeEls = document.querySelectorAll('.visual .fade-in');
fadeEls.forEach(function (fadeEl, index) {
  //gsap.to(요소, 지속시간, 옵션);
  gsap.to(fadeEl, 1, {
    delay: (index + 1) * .7, // 0.7초, 1.4초, 2.1초 2.7초
    opacity: 1
  });
});
~~~

> querySelectorAll을 통해서 해당하는 클래스를 가진 모든 요소를 불러옴<br/>
forEach를 통해서 각각의 요소를 설정<br/> 
visual_title => visual_cup1 => visual_cup2 => visual_spoon 해당하는 순서<br/>
gsap함수를 활용하여 Animation 효과 부여하고 delay 함수로 시간차를 둠





