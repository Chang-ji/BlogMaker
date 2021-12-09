---
layout: post
current: post
cover: assets/built/images/sky.jpg
navigation: True
title: Spring RestApi Server Client
date: 2021-08-24 10:18:00
tags: [Spring]
class: post-template
subclass: 'post'
author: Chanji
---


스프링의 기본 요소인 REST API를 구현

{% include Spring-table-of-contents.html %}
***

# Spring Web RestApi Server Client

## REST API Client

### 1. ApiController 구성함
~~~ java
@RestController
@RequestMapping("/api/client")
public class ApiController {
    
    private final RestTemplateService restTemplateService;
    public ApiController(RestTemplateService restTemplateService) {
        this.restTemplateService = restTemplateService;
    }

    @GetMapping("/hello")
    public Req<UserResponse> Hello() {
        // restTemplateService.exchange();
        // restTemplateService.genericExcange();
        return restTemplateService.genericExcange();
        //return new UserResponse();
        //return  restTemplateService.post();
    }
}
~~~

### 2. Service를 구성
#### RestApi GET 방식으로 요청
~~~java
// http://localhost/api/server/hello
// response
public UserResponse hello() {
    // UriComponentsBuilder 를 이용해서 uri를 생성할 수 있음
    // queryParam 을 사용하여서 ?name=aaa&age=99 로 만듬
    // http://localhost:9090/api/server/hello?name=steve&age=10 이와 같은 주소 만들기
    URI uri = UriComponentsBuilder
            .fromUriString("http://localhost:9090")
            .path("/api/server/hello")
            .queryParam("name", "aaaa")
            .queryParam("age",99)
            .encode()
            .build()
            .toUri();

    System.out.println(uri.toString());

    // RestTemplate 사용하여서 getForEntity => GET 방식으로 동작한다.
    RestTemplate restTemplate = new RestTemplate();
    ResponseEntity<UserResponse> result = restTemplate.getForEntity(uri, UserResponse.class);

    System.out.println(result.getStatusCode());
    System.out.println(result.getBody());

    return result.getBody();
}
~~~

#### RestApi POST 방식으로 요청
~~~java
public UserResponse post() {

    // UriComponentsBuilder expand로 PathValiable을 추가 할려면 encode, build 된 이후에 설정해야함
    // http://localhost:9090/api/server/user/{userId}/name/{userName}
    URI uri = UriComponentsBuilder
            .fromUriString("http://localhost:9090")
            .path("/api/server/user/{userId}/name/{userName}")
            .encode()
            .build()
            .expand(100, "steve")
            .toUri();
    System.out.println(uri);

    // http body -> object -> object mapper -> json -> rest template ->http body json
    UserRequest req = new UserRequest();
    req.setName("steve");
    req.setAge(10);

    // Post 방식으로 Api 요청
    RestTemplate restTemplate = new RestTemplate();
    ResponseEntity<UserResponse> response = restTemplate.postForEntity(uri, req, UserResponse.class);
    System.out.println(response.getStatusCode());
    System.out.println(response.getHeaders());
    System.out.println(response.getBody());

    return response.getBody();
}
~~~

#### RestApi exchange 방식으로 요청
~~~java
public UserResponse exchange() {

    // uri 만들어지는 부분
    // expand 부분을 통해서 해당 PathVariable 부분에 삽입할 수 있음
    // http://localhost:9090/api/server/user/{userId}/name/{userName}
    URI uri = UriComponentsBuilder
            .fromUriString("http://localhost:9090")
            .path("/api/server/user/{userId}/name/{userName}")
            .encode()
            .build()
            .expand(100, "steve")
            .toUri();
    System.out.println(uri);

    // UserRequest 객체를 생성하는 부분
    // http body -> object -> object mapper -> json -> rest template ->http body json
    UserRequest req = new UserRequest();
    req.setName("steve");
    req.setAge(10);


    // Header 객체 와 Body 객체를 생성하는 부분 // 아래와 같이 객체 생성
    //        {
    //            "name": "steve",
    //            "age": 10
    //        }
    RequestEntity<UserRequest> requestEntity = RequestEntity
            .post(uri)
            .contentType(MediaType.APPLICATION_JSON)
            .header("x-authorization", "abcd")
            .header("custom-header", "ffff")
            .body(req);

    // RestTemplate 응답으로 받는 객체가 UserResponse
    // requestEntity 객체가 가지는 값으로 요청이 들어간다. 
    // 이때 POST 요청
    RestTemplate restTemplate = new RestTemplate();
    ResponseEntity<UserResponse> response = restTemplate.exchange(requestEntity, UserResponse.class);

    return response.getBody();
}
~~~

### 3. dto 생성
~~~java
public class UserRequest {

    private String name;
    private int age;
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
        return "UserResponse{" +
                "name='" + name + '\'' +
                ", age=" + age +
                '}';
    }
}
~~~

~~~java
public class Req<T> {

    private Header header;
    private T httpBody;

    public static class Header {
        private String responseCode;
        public String getResponseCode() {
            return responseCode;
        }
        public void setResponseCode(String responseCode) {
            this.responseCode = responseCode;
        }
        @Override
        public String toString() {
            return "Header{" +
                    "responseCode='" + responseCode + '\'' +
                    '}';
        }
    }
    public Header getHeader() {
        return header;
    }
    public void setHeader(Header header) {
        this.header = header;
    }
    public T getHttpBody() {
        return httpBody;
    }
    public void setHttpBody(T httpBody) {
        this.httpBody = httpBody;
    }
    @Override
    public String toString() {
        return "Req{" +
                "header=" + header +
                ", body=" + httpBody +
                '}';
    }
}
~~~
~~~json
{
	"hearder" : {
		"response_code" : ""
	},
	"httpBody" : {
		"book" : "spring boot",
		"page" : 1024
	},
}
~~~
- 위와 같은 JSON 형태로 출력된다
- 이때 HttpBody 값은 Generic으로 설정되어 있어서 해당하는 클래스에 따라서 달라진다.

## REST API Server
### 1. ServerApiController 구성하기
~~~java
// Lombok을 사용하면 Slf4j 기능을 이용할 수 있어서 개발할때 편리하다.
@Slf4j
@RestController
@RequestMapping("/api/server")
public class ServerApiController {

    @GetMapping("/hello")
    public User hello(@RequestParam String name, @RequestParam int age) {
        User user = new User();
        user.setName(name);
        user.setAge(age);
        return user;
    }

    // RequestBody를 쓸때 이름을 맞추엇 받아야 잘 들어옴 아니면 Mapping이 안됨
    // HttpEntity 를 통해서 들어오는 값을 찍어 볼수 있음 잘 활용하자
    @PostMapping("/user/{userId}/name/{userName}")
    public Req<User> post(
                     // HttpEntity<String> entity,
                     @RequestBody Req<User> user,
                     @PathVariable int userId,
                     @PathVariable String userName,
                     @RequestHeader("x-authorization") String authorization,
                     @RequestHeader("custom-header") String customHeader
    ) {
        // log.info("req: {}", entity.getBody());
        log.info("userId : {}, userName : {} ", userId, userName);
        log.info("x-authorization : {}, custom-header : {} ", authorization, customHeader);
        log.info("client : {}", user);

        Req<User> response = new Req<>();
        response.setHeader(
                new Req.Header()
        );
        response.setHttpBody(user.getHttpBody());

        return response;
    }
}
~~~
- 위의 ApiController는 Client에서 오는 요청을 받는 부분이다.
- Mapping 단계에서 오류 발생시 HttpEntity 객체를 참조하여서 어떤 데이터가 들어오는지 확인한다.

### 2. dto 구성하기
~~~java
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Req<T> {

    private Header header;
    private T httpBody;

    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    public static class Header {
        private String responseCode;
    }
}
~~~

~~~java
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Req<T> {

    private Header header;
    private T httpBody;

    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    public static class Header {
        private String responseCode;
    }
}
~~~
- 위와 같이 Lombok을 사용하면 아주아주 편리하다.
- @Data, @NoArgsConstructor, @AllArgsConstructor 붙여서 사용하자

## RestApi 참고 자료 부분
- [https://advenoh.tistory.com/46](https://advenoh.tistory.com/46)
  




