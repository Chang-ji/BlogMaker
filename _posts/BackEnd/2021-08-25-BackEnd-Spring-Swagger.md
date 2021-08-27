---
layout: post
current: post
cover: assets/built/images/sky.jpg
navigation: True
title: Spring Swagger
date: 2021-08-24 10:18:00
tags: [BackEnd]
class: post-template
subclass: 'post'
author: Chanji
---
{% include BackEnd-table-of-contents.html %}
***

# Spring Web Swagger

### Swagger 
- Swagger 란 개발한 REST API를 편리하게 문서화 해주고, 이를 통해서 관리 및 제 3의 사용자가 편리하게 API를 호출해보고 테스트 할 수 있는 프로젝트이다.
- Spring Boot에서는 간단하세 springfox-boot-starter 를 gradle dependencies 에 추가 함으로 사용할 수 있다.
- 다만, 주의할 점은 운영환경과 같은 외부에 노출되면 안되는 곳에는 사용할 땐 주의 해야 한다.

### Swagger Annotation


값 | 의미 
--|--  
@Api | 클래스를 스웨거의 리소스로 표시  
@ApiOperation | 특정 경로의 오퍼레이션 HTTP 메소드 설명   
@ApiParam | 오퍼레이션 파라미터에 메타 데이터 설명   
@ApiResponse | 오퍼레이션 응답 지정  
@ApiModelProperty | 모델의 속성 데이터를 설명  
@ApiLmplicitParam | 메소드 단위의 오퍼레이션 파라미터를 설명  
@ApilmplicitParams |   

### Swagger 적용
- 링크: [https://mvnrepository.com/artifact/io.springfox/springfox-boot-starter](https://mvnrepository.com/artifact/io.springfox/springfox-boot-starter)
- 사용할려면: [http://localhost:8080/swagger-ui/](http://localhost:8080/swagger-ui/)

### Swagger 관련 코드 예시

#### 1. GET Mapping 관련 예시 코드
~~~java
// 아래의 어노테이션을 이용하여 이름, 필수요소인지, 데이터 타입, 파라미터 타입을 설정 가능
@ApiImplicitParams({
                @ApiImplicitParam(name = "x", value = "x 값", required = true, dataType = "int", paramType = "path"),
                @ApiImplicitParam(name = "y", value = "y 값", required = true, dataType = "int", paramType = "query")
    })
@GetMapping("/plus/{x}")
public int plus(@PathVariable int x, @RequestParam int y) {
    return x+y;
}
~~~

~~~java
// Api 상태코드가 502일때 조건을 표시할 수 있음
@ApiResponse(code = 502, message = "사용자의 나이가 10살 이하일때")
// Swagger 이름을 설정할 수 있음 이때 객체 데이터라서 객체로 표시
@ApiOperation(value = "사용자의 이름과 나이를 리턴하는 메소드")
@GetMapping("/user")
public UserRes userRes(UserReq userReq) {
    return new UserRes(userReq.getName(), userReq.getAge());
}
~~~

#### 2. PostMapping 관련 예시 코드
// Post도 GET 과 같은 방식으로 작동
~~~java
@PostMapping("/user")
public UserRes user(@RequestBody UserReq req) {
    return new UserRes(req.getName(), req.getAge());
}
~~~

