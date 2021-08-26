---
layout: post
current: post
cover: assets/built/images/sky.jpg
navigation: True
title: Spring Async
date: 2021-08-24 10:18:00
tags: [BackEnd]
class: post-template
subclass: 'post'
author: Chanji
---
{% include BackEnd-table-of-contents.html %}
***

# Spring Web Async

## 비동기 처리 예제

### 1. Application 파일 EnableAsync 추가

~~~java
@SpringBootApplication
@EnableAsync
public class AsyncApplication {

	public static void main(String[] args) {
		SpringApplication.run(AsyncApplication.class, args);
	}

}
~~~

### 2. AsyncService 만들기

~~~java
@Slf4j
@Service
public class AsyncService {

    @Async("async-thread")
    public CompletableFuture run() { 
        return new AsyncResult(hello()).completable();
    }

    public String hello() {

        for (int i = 0; i < 10; i++) {
            try {
                Thread.sleep(2000);
                log.info("thread sleep....");
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        return "async hello";
    }
}
~~~
  - CompletableFuture 를 통해서 async 처리할 수 있음
  - 이때 쓰레드가 다 처리될때 까지 reponse를 지연 시킬 수 있음
  - 비동기를 사용할 함수에는 @Async를 붙여주여야함

### 3. AppConfig 를 만들어서 별도의 쓰레드를 세팅할 수 있음

~~~java
@Configuration
public class AppConfig {

    @Bean("async-thread") // 이름 설정
    public Executor asyncThread() {
        ThreadPoolTaskExecutor threadPoolTaskExecutor = new ThreadPoolTaskExecutor();
        threadPoolTaskExecutor.setMaxPoolSize(100);
        threadPoolTaskExecutor.setCorePoolSize(10);     // 다차면
        threadPoolTaskExecutor.setQueueCapacity(10);    // 여기에 큐가 쌓임
        threadPoolTaskExecutor.setThreadNamePrefix("Asnc-");
        return threadPoolTaskExecutor;
    }
}
~~~

### 4. ApiController 서비스를 호출하여서 사용

~~~java
@Slf4j
@RestController
@RequestMapping("/api")
public class ApiController {

    private final AsyncService asyncService;

    public ApiController(AsyncService asyncService) {
        this.asyncService = asyncService;
    }

    @GetMapping("/hello")
    public CompletableFuture hello() {
        log.info("completableFuture init");
        return asyncService.run();
    }
}
~~~


