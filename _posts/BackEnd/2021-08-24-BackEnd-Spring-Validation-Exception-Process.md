---
layout: post
current: post
cover: assets/built/images/sky.jpg
navigation: True
title: BackEnd - Spring-Validation-Exception-Process
date: 2021-08-24 10:18:00
tags: [BackEnd]
class: post-template
subclass: 'post'
author: Chanji
---
{% include BackEnd-table-of-contents.html %}
***
# Spring Web Validation Exception Process

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
|   |               |       ApiControllerAdvice.java
|   |               |
|   |               +---controller
|   |               |       ApiController.java
|   |               |
|   |               \---dto
|   |                       Error.java
|   |                       ErrorResponse.java
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

> Error.java

~~~java
public class Error {

    private String field;
    private String message;
    private String invalidValue;

    public String getField() {
        return field;
    }

    public void setField(String field) {
        this.field = field;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getInvalidValue() {
        return invalidValue;
    }

    public void setInvalidValue(String invalidValue) {
        this.invalidValue = invalidValue;
    }
}
~~~

- Error 객체 안에는 field, message, invalidValue 으로 선언


> ErrorResponse.java

~~~java
public class ErrorResponse {

    String statusCode;
    String requestUrl;
    String code;
    String message;
    String resultCode;

    List<Error> errorList;

    public String getStatusCode() {
        return statusCode;
    }

    public void setStatusCode(String statusCode) {
        this.statusCode = statusCode;
    }

    public String getRequestUrl() {
        return requestUrl;
    }

    public void setRequestUrl(String requestUrl) {
        this.requestUrl = requestUrl;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getResultCode() {
        return resultCode;
    }

    public void setResultCode(String resultCode) {
        this.resultCode = resultCode;
    }

    public List<Error> getErrorList() {
        return errorList;
    }

    public void setErrorList(List<Error> errorList) {
        this.errorList = errorList;
    }
}
~~~

- ErrorResponse 객체 안에는 statusCode, requestUrl, code, message, resultCode, errorList 으로 선언
  
***


> ApiControllerAdvice.java


~~~java
@RestControllerAdvice(basePackageClasses = ApiController.class) // ApiController에서만 동작
public class ApiControllerAdvice {

    @ExceptionHandler(value = ConstraintViolationException.class) // 특정 메소드의 예외를 처리 ConstraintViolationException 대한 예외 처리
    public ResponseEntity constraintViolationException(ConstraintViolationException e, HttpServletRequest httpServletRequest) {
        System.out.println("ConstraintViolationException 예외 처리");

        List<Error> errorList = new ArrayList<>();

        e.getConstraintViolations().forEach(error -> {
            Stream<Path.Node> stream = StreamSupport.stream(error.getPropertyPath().spliterator(), false);
            List<Path.Node> list = stream.collect(Collectors.toList());

            String field = list.get(list.size()-1).getName();
            String message = error.getMessage();
            String invalidValue = error.getInvalidValue().toString();

            Error errorMessage = new Error();
            errorMessage.setField(field);
            errorMessage.setMessage(message);
            errorMessage.setInvalidValue(invalidValue);

            errorList.add(errorMessage);

        });

        ErrorResponse errorResponse = new ErrorResponse();
        errorResponse.setErrorList(errorList);
        errorResponse.setMessage("");
        errorResponse.setRequestUrl(httpServletRequest.getRequestURI());
        errorResponse.setStatusCode(HttpStatus.BAD_REQUEST.toString());
        errorResponse.setResultCode("FAIL");

        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(errorResponse);
    }
}
~~~
1. ApiController.class에서 ConstraintViolationException 에러 발생시 동작
2. e 의 ConstraintViolations 값 안에 name, message, value 값을 추출
3. 2번의 값을 이용하여 Error 객체를 만들고 errorList 저장
4. ErrorResponse 객체를 만듬
5. 이때 HttpServletRequest 클래스를 이용하여 url 값을 받아올 수 있음
6. errorResponse 값을 body에 보내면 클라이언트가 편리하게 오류를 판단할 수 있음

> 위와 같은 것들을 구현 할때 Debug 기능을 이용해서 해당하는 값들을 잘 분석하기 바람

- Spliterator에 대한 링크: https://jistol.github.io/java/2019/11/17/spliterator/





  





