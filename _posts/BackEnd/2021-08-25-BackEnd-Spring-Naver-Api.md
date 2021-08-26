---
layout: post
current: post
cover: assets/built/images/sky.jpg
navigation: True
title: Spring Naver Open API
date: 2021-08-24 10:18:00
tags: [BackEnd]
class: post-template
subclass: 'post'
author: Chanji
---
{% include BackEnd-table-of-contents.html %}
***

# Spring Web Naver Open API

### 네이버 OPEN API 참고 자료
- [https://developers.naver.com/docs/common/openapiguide/](https://developers.naver.com/docs/common/openapiguide/)
- [https://developers.naver.com/docs/serviceapi/search/local/local.md#%EC%A7%80%EC%97%AD](https://developers.naver.com/docs/serviceapi/search/local/local.md#%EC%A7%80%EC%97%AD)

### JSON 파일 예쁘게 변형 참고 링크
- [https://jsonformatter.curiousconcept.com/](https://jsonformatter.curiousconcept.com/)

### Naver Open API 참고 코드
~~~java
public class ServerApiController {

    // https://openapi.naver.com/v1/search/local.json
    // ?query=%EC%A3%BC%EC%8B%9D
    // &display=10
    // &start=1
    // &sort=random
    @GetMapping("/naver")
    public String naver() {

        // 갈비집 => UTF-8 encoder
        String query = "갈비집";
        String encode = Base64.getEncoder().encodeToString(query.getBytes(StandardCharsets.UTF_8));

        // encode 두번하면 오류발생함 2번이상 encode 하는지 확인하자
        URI uri = UriComponentsBuilder
                .fromUriString("https://openapi.naver.com")
                .path("/v1/search/local.json")
                .queryParam("query","중국집")
                .queryParam("display",10)
                .queryParam("start",1)
                .queryParam("sort","random")
                .encode(Charset.forName("UTF-8"))
                .build()
                .toUri();
        log.info("uri : {}", uri);

        RestTemplate restTemplate = new RestTemplate();

        // Header를 추가하기 위해서
        RequestEntity<Void> req = RequestEntity
                .get(uri)
                .header("X-Naver-Client-Id","0Y84V06k5FAv4oad_d2y")
                .header("X-Naver-Client-Secret","IxTBcu9rYa")
                .build();


        ResponseEntity<String> result = restTemplate.exchange(req, String.class);
        return  result.getBody();
    }
}
~~~
- restTemplate 에 Header를 보내기 위해서는 exchange 함수를 이용하자
- Header 를 추가하기 위해서는 RequestEntity 를 생성해야한다.
- UTF-8 변환할때 2번 변환하지 않게 조심하자
- http://localhost:9090/api/server/naver 로 요청이 오면 위의 컨트롤러가 응답한다.


  




