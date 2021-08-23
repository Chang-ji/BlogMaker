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
***
# Spring Web Exception

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
***

> GlobalControllerAdvice.java


~~~java
@RestControllerAdvice
public class GlobalControllerAdvice {

    @ExceptionHandler(value = Exception.class) // Exception.class에 의해서 모든 예외 부분에 대해서 아래부분의 알고리즘을 처리함
    public ResponseEntity exception(Exception e) {
        System.out.println(e.getClass().getName()); // Exception 클래스 명을 가져옴
        System.out.println("----------------------------------------");
        System.out.println(e.getLocalizedMessage()); 
        System.out.println("----------------------------------------");

        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("");
    }

    @ExceptionHandler(value = MethodArgumentNotValidException.class) // 특정 메소드의 예외를 처리(MethodArgumentNotValidException) MethodArgumentNotValidException에 대한 예외 처리
    public ResponseEntity methodArgumentNotValidException(MethodArgumentNotValidException e) {
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
    }
}
~~~

- [getLocalizedMessage()에 대한 링크](https://stackoverflow.com/questions/24988491/difference-between-e-getmessage-and-e-getlocalizedmessage)
- [HttpStatus에 대한 정보](https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/http/HttpStatus.html)
- [@RestControllerAdvice, @ExceptionHandler 관련 추가 예제](https://jeong-pro.tistory.com/195
)

***


> ApiController.java


~~~java
@RestController
@RequestMapping("/api/user")
public class ApiController {

    @GetMapping("") // ?name&age 이런 형식으로 들어올때 반응 (Get방식)
    public User get(@RequestParam(required = false) String name, @RequestParam(required = false) Integer age) { // 
        User user = new User();
        user.setName(name);
        user.setAge(age);

        int a = 10 + age;
        return user;
    }

    @PostMapping("") // ?name&age 이런 형식으로 들어올때 반응 (Post방식)
    public User post(@Valid @RequestBody User user) { // Body에 실려서 들어옴
        System.out.println(user);
        return user;
    }

    @ExceptionHandler(value = MethodArgumentNotValidException.class) // Api안에 있는 Controller 작동한다
    public ResponseEntity methodArgumentNotValidException(MethodArgumentNotValidException e) {
        System.out.println("api controller");
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
    }
}
~~~

- @ExceptionHandler 부분이 ApiController 안에 있다면 다른 부분으로 예외처리하지 않고 여기에서 처리
  
***

> User.java


~~~java
public class User {

    @NotEmpty // 빈칸 안됨
    @Size(min = 1, max = 10) // 최소 1 ~ 10
    private String name;

    @Min(1) // 최소 1
    @NotNull // 들어오는 값이 NULL 이면 안된다
    private Integer age;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    @Override
    public String toString() {
        return "User{" +
                "name='" + name + '\'' +
                ", age=" + age +
                '}';
    }
}
~~~

- dto.User 파일 내부 유저 데이터를 객체로 관리함