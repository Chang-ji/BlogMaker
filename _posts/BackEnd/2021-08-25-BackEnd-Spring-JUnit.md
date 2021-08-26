---
layout: post
current: post
cover: assets/built/images/sky.jpg
navigation: True
title: BackEnd Spring JUnit
date: 2021-08-24 10:18:00
tags: [BackEnd]
class: post-template
subclass: 'post'
author: Chanji
---
{% include BackEnd-table-of-contents.html %}
***

# Spring Web JUnit

### JUnit으로 테스트 하기
- TDD (Test-driven Development)
  > 테스트 주도 개발에서 사용하지만, 코드의 유지 보수 및 운영 환경에서의 에러를 미리 방지 하기 위해서 단위 별로 검증하는 테스트 프레임 워크
- 단위테스트
  > 작성한 코드가 기대하는 대로 동작을 하는지 검증하는 절차
- JUnit
  > Java 기반의 단위 테스트를 위한 프레임워크
  > Annotation 기반으로 테스트를 지원하며, Assert를 통하여, (예상, 실제)를 통해 검증
- Jacoco
  > Java 코드의 코드 커버리지를 체크하는 라이브러리 결과를 html, xml, csv로 확인 가능하다.
  > build.gradle 파일에 plugins 에 id 'jacoco 설정하여 사용가능
  > gradle > Task > verification > test 더블클릭으로 실행가능

### JUnit 테스트 관련 Mockito
- [https://mvnrepository.com/artifact/org.mockito/mockito-core](https://mvnrepository.com/artifact/org.mockito/mockito-core)
- [https://mvnrepository.com/artifact/org.mockito/mockito-junit-jupiter](https://mvnrepository.com/artifact/org.mockito/mockito-junit-jupiter)


### JUnit 관련 테스트 코드
#### 1. 전체 스프링 부트 활성화 시켜서 테스트
~~~java
@SpringBootTest
// Import 시켜서 MarketApi, DollarCalculator 주입
@Import({MarketApi.class, DollarCalculator.class})  
@ExtendWith(MockitoExtension.class)
public class DollarCalculatorTest {

    // MarketApi를 Bean 등록
    @MockBean
    private MarketApi marketApi;

    @Autowired
    private Calculator calculator;

    @Test
    public void dollerCalculatorTest() {
        // marketApi.connect() 이 실행될때 3000 값을 리턴
        Mockito.when(marketApi.connect()).thenReturn(3000);

        int sum = calculator.sum(10,10);
        int minus = calculator.minus(10,10);

        // assertEquals 함수를 통해서 예측치가 맞게 나오는 지 테스트
        Assertions.assertEquals(60000, sum);
        Assertions.assertEquals(0, minus);
    }

}
~~~
#### 2. Controller 테스트
##### 기본적인 부분
~~~java
// 테스트 할려는 컨트롤러 선택
@WebMvcTest(CalculatorApiController.class)
// Controller 테스트시 기본적으로 설정
@AutoConfigureWebMvc
// Calculator, DollarCalculator 주입
@Import({Calculator.class, DollarCalculator.class})
public class CalculatorApiControllerTest {

    // marketApi Bean 등록
    @MockBean
    private MarketApi marketApi;

    // MockMvc를 등록하여 원활하게 Controller 테스터 가능
    @Autowired
    public MockMvc mockMvc;

    // marketApi.connect() 실행되면 3000을 반환
    @BeforeEach
    public void init() {
        Mockito.when(marketApi.connect()).thenReturn(3000);
    }
}
~~~

##### GET 방식 테스트
~~~java
@Test
public void sumTest() throws Exception {

    // http://localhost:8080/api/sum
    // mockMvc 를 통해서 요청 수행
    // MockMvcRequestBuilders 를 통해서 GET 요청
    mockMvc.perform(
            MockMvcRequestBuilders.get("http://localhost:8080/api/sum") // 해당주소
            .queryParam("x","10")  // 쿼리만들기
            .queryParam("y", "10")

    ).andExpect(
            // MockMvcResultMatchers 요청에 대한 응답값 중 status 가 200인지 확인
            MockMvcResultMatchers.status().isOk() 
    ).andExpect(
            // MockMvcResultMatchers 요청에 대한 응답값 중 content 값이 60000인지 확인
            MockMvcResultMatchers.content().string("60000")
    ).andDo(MockMvcResultHandlers.print()); // 해당하는 응답값 출력
}
~~~

##### POST 방식
~~~java
@Test
public void minusTest() throws Exception {

    // http://localhost:8080/api/minus
    Req req = new Req();
    req.setX(10);
    req.setY(10);

    // ObjectMapper를 통해서 JSON 값으로 변경
    // JSON으로 변경
    String json = new ObjectMapper().writeValueAsString(req);

    // POST 방식으로 요청하여 테스트
    mockMvc.perform(
            MockMvcRequestBuilders.post("http://localhost:8080/api/minus")
            .contentType(MediaType.APPLICATION_JSON)
            .content(json) // Body 값
    ).andExpect(
            MockMvcResultMatchers.status().isOk()
    ).andExpect(
            MockMvcResultMatchers.jsonPath("$.result").value("0")
    ).andExpect(
            // response 객체 안에 resultCode 확인
            MockMvcResultMatchers.jsonPath("response.resultCode").value("OK") 
    ).andDo(
        MockMvcResultHandlers.print()
    );
}
~~~




