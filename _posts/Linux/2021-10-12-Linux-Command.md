---
layout: post
current: post
cover: assets/built/images/summit.jpg
navigation: True
title: Linux
date: 2021-10-12 00:00:00
tags: [Linux]
class: post-template
subclass: 'post'
author: Chanji
---

Linux Command Line And Linux CLI Learn


{% include Linux-table-of-contents.html %}

## 윈도우 Linux 사용하기

> 리눅스 배포판 중 하나를 운영 체제로 컴퓨터에 설치한 상태이거나,  
> macOS가 깔린 맥(Mac)이 있어야 합니다.

### 유사 유닉스 VirtualBox 설치

1. VirtualBox 설치 파일을 다운로드하겠습니다. 일단 VirtualBox 다운로드 페이지로 가세요. 그 다음, 아래 그림처럼 Windows hosts를 클릭해서 설치 파일을 다운로드하세요.
2. 다운로드한 설치 파일을 실행하면 아래와 같은 창이 뜹니다. Next 또는 Yes 버튼을 눌러서 쭉 진행하세요
3. 마지막으로 Install 버튼을 눌러 설치를 시작하세요.
4. 설치가 완료되면 Finish 버튼을 눌러 창을 닫으세요.
5. 그럼 VirtualBox의 화면이 나타납니다. 이제 VirtualBox로 가상 머신을 생성할 수 있습니다. 가상 머신을 생성하는 방법과 그 가상 머신에 우분투를 설치하는 방법은 다음 노트에서 설명해드릴게요.


- date : 날짜
- cal : 달력
- 인자: Arugement
- 인자를 여러개 줄수도 있다
- 옵션: 커맨드의 구체적 동작방식 설정
- 인자와 옵션은 정해진 형식이 있으니 사용법을 알아서 사용하자

~~~bash
cal -y
cal 2020
cal -B 2
cal -A 3
cal -B 2
cal -B 2 -A 3
cal -B 2 -A 3 -j
~~~

### 커맨드에 관한 공식메뉴얼 확인하자

~~~bash
man cal
~~~

화면 올리기 : b
화면 내리기 : space
창 나가기 : q

현재 위치
~: 현재 사용자 지금 컴퓨터를 사용하고 있는 사용자
홈 디렉토리: 사용자 필요로 하는 파일을 저장 자신이 필요한 것을 저장하는 디렉토리

pwd : 현재 작업중인 디렉토리를 출력하라

가장 상위에 있는 디렉토리 : 루트 디렉토리
디렉토리가 디렉토리르 포함하고 있는 관계 / 부모 디렉토리 / 자식 디렉토리
경로: 디렉토리 위치, 파일의 위치

cd: change directory

절대경로: 루트 디렉토리 기준으로 고유한 경로 
상대경로: 나의 현재위치를 기준으로 나타낸 경로
.: 현재 디렉토리
..: 부모 디렉토리

절대경로는 그대로 이지만 상대경로는 현재 작업중인 위치에 따라서 바뀐다.

상대경로 현재디렉토리, 부모디렉토리를 사용할 때 편리하게 이용할 수 있다.

루트 디렉토리 가기
홈디렉토리
이전 디렉토리로 가기

~~~bash
cd /
cd /home/changji
cd ~
cd -
~~~

디렉토리 내부 살펴보기
-l 리스트 형식으로 보여주기
-a 모든 디렉토리 보여주기 -> 나타나지 않는 숨겨진 파일을 볼수 있다.
-d 디렉토리 자체의 정보를 보여준다.
파일에 대한 정보를 볼수 있다.

~~~bash
ls
ls -l
ls -a
ls -l [파일이름]
ls -l -d [파일이름]
~~~

디렉토리 만들기
새로운 파일 만들기

~~~bash
mkdir parent
touch test
~~~

디렉토리 파일 이동시키기
디렉토리 파일 이름바꾸기

~~~bash
mv test child
mv test sample
~~~

디렉토리 파일 복사 붙여넣기
파일 복사-붙여넣기 할때 같은 이름의 파일이 있는지 확인해야한다.
디렉토리 복사 붙어넣을 때 자식 디렉토리가 있을 수 있고 함께 복사해야 해서 -r 옵션이 필요하다.

~~~bash
cp first second
cp -i first second
cp -r kid baby
~~~

파일 디렉토리 삭제하기 rm
디렉토리 삭제할 때는 -r 옵션이 필요하다.
-i 옵션을 통해 삭제하기 전에 확인하자.

~~~bash
rm second
rm baby
~~~

파일 출력하기

~~~bash
cat Twice
cat Zico
less Twice
~~~
b, space, G, g, q, :n, :p 단축키 활용하자

`cat`: concatenate, 이어 붙이다 파일들의 `내용을 이어서 출력` 봐야 할 내용이 `단순할 때`
`less`: 한 화면에 `하나`의 파일을 보여줌 봐야할 내용이 `많거나 하나씩` 봐야 할때
`head`: 파일의 맨앞부분을 출력 -n 20 옵션 인자 넣어주면 된다.
`tail`: 파일의 뒤 부분을 출력하는 것


`history`: 사용한 커맨드의 내역을 보여줌 그리고 !221 이렇게 숫자 넣어서 쓰면 됨

`ctrl+a`: 그 행에 맨앞으로 이동
`ctrl+e`: 그 행에 맨뒤으로 이동

mkdir happy programming 폴더가 두개 만들어 진다.
mkdir 'happy programming' 으로 만들어야 한다.

## Vim 사용법

### vi
- 빌조이 브람 믈레나르 vim 향상된 vi
- 마우스 없이 키보드로만 사용한다.
  
> 모드
  > 일반 모드(Normal Mode) 
  > 입력 모드(Insert Mode)
  > 비주얼 모드(Visual Mode)
  > 명령 모드(Command Mode)

  처음 일반모드
  a A 입력 
  대문자I 첫번째 줄 맨앞으로 이동하면서 입력모드
  o 다음 문장으로 이동하면서 엽력모드
  v V 비주얼
  : / 명령 모드
  esc 일반 모드

  명령모드 내용 저장하기
  :w exercise 자동으로 일반모드로 돌아온다

  입력 -> 일반 -> 명령 가서 저장한다.

  `:q!`: 경고 무시하고 실행해라

  `/`: 텍스트 검색 `n` 다음으로 이동 `N` 이전으로 이동

  `:%s/!/#/g`: 모든 단어를 변경 ! -> #
  `:%s/!/#/gc`: 원하는 부분만 교체 가능하다 단어를 변경 ! -> #

  일반모드 단축키 h,j,k,l ctrl+g 정보 확인, 0 맨앞, $ 맨뒤, gg 맨처음, G 맨 마지막

  `x`: 한칸씩 삭제
  `숫자 + x`: 여러칸 삭제
  `dd`: 한줄 지우기
  `숫자 + dd`: 여러줄 지우기
  `u`: 이전 작업 취소



  비주얼 모드 블록지정 삭제 복사 붙여넣기
  `y`: 복사하다
  `p`: 붙여넣기
  `V`: 비주얼 모드로 전환 줄 단위로 블록 지정
  ``: 잘라내기

  - Vim 공식 사용 설명서: [https://vimhelp.org/#help.txt](https://vimhelp.org/#help.txt)
  - Vim을 게임처럼 재미있게 배울 수 있는 사이트: [https://vim-adventures.com/](https://vim-adventures.com/)

![기본모드](/assets\built\images\vim_normal.PNG)
![입력모드](/assets\built\images\vim_insert.PNG)
![명령모드](/assets\built\images\vim_command.PNG)
![비주얼모드](/assets\built\images\vim_visual.PNG)







