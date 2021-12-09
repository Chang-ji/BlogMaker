---
layout: post
current: post
cover: assets/built/images/sky.jpg
navigation: True
title: Filter Interceptor
date: 2021-08-24 10:18:00
tags: [Spring]
class: post-template
subclass: 'post'
author: Chanji
---

스프링 필터와 인터셉터에 대해서 이해하고 코드를 구현


{% include Spring-table-of-contents.html %}
***

# Spring Web Filter Interceptor

## Filter
- Filter란 Web Application에서 관리되는 영역으로써 Spring Boot Framwork에서 Client로 부터 오는 요청/응답에 대해서 최초/최종 단계의 위치에 존재하며, 이를 통해서 요정/응답의 정보를 변경하거나, Spring에 의해서 데이터가 변환되기 전의 순수한 Client의 요청/응답 값을 확인 할 수 있다.
- 유일하게 ServletRequest, ServletResponse 의 객체를 변환 할 수 있다.
- 주로 Spring Framework 에서는 request / response 의 Logging 용도로 활용하거나, 인증과 관련된 Logic 들을 해당 Filter 에서 처리한다.
- 이를 선/후 처리 함으로써, Service business logic과 분리 시킨다.

#### ContentCachingRequestWrapper 예제 부분
- Filter에서 한번 읽으면 AOP 부분에서 다시 읽기 불가능해서 해당 클래스를 사용
- 해당 부분 예시: [https://ddasi-live.tistory.com/83](https://jistol.github.io/java/2019/11/17/spliterator/)


### Filter 관련 코드
~~~java
@Slf4j
@WebFilter(urlPatterns = "/api/user/*")
public class GlobalFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        // 전처리 구간
        ContentCachingRequestWrapper httpServletRequest = new ContentCachingRequestWrapper((HttpServletRequest)request);
        ContentCachingResponseWrapper httpServletResponse = new ContentCachingResponseWrapper((HttpServletResponse)response);

        chain.doFilter(httpServletRequest, httpServletResponse); // doFilter가 일어난 이후에 읽어야 한다.
        // 후처리 구간
        String url = httpServletRequest.getRequestURI();
        String reqContent = new String(httpServletRequest.getContentAsByteArray());
        log.info("request url : {}, request body : {}", url, reqContent);

        String resContent = new String(httpServletResponse.getContentAsByteArray());
        int httpStatusCode = httpServletResponse.getStatus();

        httpServletResponse.copyBodyToResponse(); // 반드시 실행해야 Client가 응답을 받을 수 있다.

        log.info("response status : {}, responseBody : {}",httpStatusCode, resContent);
    }
}
~~~
- Mapping이 이루어지기 전에 발생한다.
- chain.doFilter 가 작동된 이후에 데이터를 읽어야 오류가 나지 않는다.
- 필터로 먼저 들어오기 때문에 ContentCaching 부분 사용하여서 값을 저장해야한다.
- httpServletResponse.copyBodyToResponse() 실행하여 응답을 복사해주어야 Client가 응답을 볼 수 있다.

## Interceptor
- Interceptor 란 Filter 와 매우 유사한 형태로 존재 하지만, 차이점은 Spring Context 에 등록된다.
- AOP 와 유사한 기능을 제공할 수 있다.
- 주로 인증 단계를 처리 하거나, Logging 을 하는데 사용한다.
- 이를 통해서 선/후 처리 함으로써, Service business logic 과 분리 시킨다.
- [메타 어노테이션에 대한 내용](https://velog.io/@kwj1270/%EC%96%B4%EB%85%B8%ED%85%8C%EC%9D%B4%EC%85%98)

### Interceptor 관련 예시
#### 1. GET METHOD 요청
   > http://localhost:8080/api/private/hello?name=aaa

#### 2. 요청하면 AuthInterceptor.java 로 들어옴
~~~java
@Slf4j
@Component
public class AuthInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String url = request.getRequestURI();

        URI uri = UriComponentsBuilder.fromUriString(request.getRequestURI())
                .query(request.getQueryString())
                .build()
                .toUri();

        log.info("request url: {}", url);

        boolean hasAnnotation = checkAnnotation(handler, Auth.class);
        log.info("has annotation : {}",hasAnnotation);

        // 나의 서버는 모두 public 으로 동작하는데
        // 단! Auth 권한을 가진 요청에 대해서는 세션, 쿠키,
        if (hasAnnotation) {
            // 권한체크
            String query = uri.getQuery();  // url query 값을 가져온다.
            log.info("query:{}", query);
            if (query.equals("name=steve")) {
                return true;
            }
            throw new AuthException(); // 쿼리 값이 steve 가 아니면 AuthException으로 던진다.

        }

        return  true; // 이 부분이 True 여야만 Controller로 도달한다.
    }

    // Auth Annotation을 가지고 있는지 검사
    private boolean checkAnnotation(Object handler, Class clazz) {
        // reource javascript, html
        if (handler instanceof ResourceHttpRequestHandler) {
            return true;
        }
        // annotation check
        HandlerMethod handlerMethod = (HandlerMethod) handler;
        if (null != handlerMethod.getMethodAnnotation(clazz) || null != handlerMethod.getBeanType().getAnnotation(clazz)) {
            // Auth annotation 이 있을 때는 true
            return true;
        }
        return false;
    }
}
~~~

- interceptor를 등록하기 위해서는 MvcConfig.java 파일을 만들어서 설정해야한다.


~~~java
@Configuration
@RequiredArgsConstructor
public class MvcConfig implements WebMvcConfigurer {

    private final AuthInterceptor authInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) { // addInterceptors 함수를 통해서 특정한 Url에서 작동하는 Interceptor를 만들 수 있다.
        registry.addInterceptor(authInterceptor).addPathPatterns("/api/private/*");
    }
}
~~~

#### 3. Throw 받으면 아래의 클래스를 실행

~~~java
public class AuthException extends RuntimeException {
}
~~~

#### 4. 아래의 필터에서 AuthException 을 감지하여서 예외 처리를 한다.

~~~java
@RestControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(AuthException.class)
    public ResponseEntity authException() {
        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
    }
}
~~~

#### 5. 위의 예외처리가 작동하면서 Client는 401 Error 가 보이게 된다.






