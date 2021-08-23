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


## Spring Boot 예외처리 파일 구조
~~~
+---main
|   +---java
|   |   \---com
|   |       \---example
|   |           \---exception
|   |               |   ExceptionApplication.java
|   |               |
|   |               +---advice
|   |               |       GlobalControllerAdvice.java
|   |               |
|   |               +---controller
|   |               |       ApiController.java
|   |               |
|   |               \---dto
|   |                       User.java
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

> GlobalControllerAdvice.java


~~~java
@RestControllerAdvice
@RestControllerAdvice
public class GlobalControllerAdvice {

    @ExceptionHandler(value = Exception.class) // 예외처리 Handler 모든 예외에 대해서 처리함
    public ResponseEntity exception(Exception e) {
        System.out.println(e.getClass().getName()); // Exception 클래스 명
        System.out.println("----------------------------------------");
        System.out.println(e.getLocalizedMessage());
        System.out.println("----------------------------------------");

        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("");
    }

    @ExceptionHandler(value = MethodArgumentNotValidException.class) // 특정 메소드의 예외를 처리 MethodArgumentNotValidException에 대한 예외 처리
    public ResponseEntity methodArgumentNotValidException(MethodArgumentNotValidException e) {
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
    }
}
~~~



> ApiController.java
~~~java
~~~

> User.java
~~~java
~~~