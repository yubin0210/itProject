<hr>

# 프로젝트 소개
**네이버 api를 활용한 로그인, 상품 결제, 채팅문의, 카카오맵 기반 서비스   
매장관리, 상품픽업, 나만의 냉장고등의 기능을 구현한 편의점 사이트 입니다.**

<hr>


### 개발 인원 
5인



### 개발기간
24.03.07 ~ 24.04.04 (약 1달)



### 개발환경
**BackEnd** : Java, JSP, Spring Framework  
**DataBase** : Oracle DB  
**FrontEnd** : HTML, CSS, JavaScript  
**Collaboration** : Git  



### 의존성
HikariCP, mybatis, commons-fileupload,   
jackson-databind, spring-websocket,   
spring-integration-stomp, jakarta.mail, scribejava  


### 사용한 api
naver login api  
Kakao map api  
toss payments api  

<br>

### 요구사항 명세서

![image](https://github.com/foolcoding/itbankProject/assets/141770025/f8fc03e8-83dd-4b08-887d-d46bd540921e)


<br>

### ERD

![ERD 수정](https://github.com/foolcoding/itbankProject/assets/141770025/6c132d98-48c3-41bb-991b-83565271f377)





<hr>

## 주요기능

### 1. 로그인 & 회원가입
- 아이디, 이메일 중복 불가능  
- Hash 를 이용한 비밀번호 처리  
- Ajax 를 이용한 이메일 인증  
- 일반회원과 매장점주 회원은 다르게 회원가입됨  
- 네이버 로그인 api를 이용하여 상황에 맞게 데이터 처리  
- (DB와 데이터를 비교하여, 간편 회원가입 / 로그인 / 계정연동을 진행함) 


### 2. 상품/매장
- 상품 및 매장 목록 출력하기
- 상품 찜 추가 및 삭제
- 매장 즐겨찾기 추가 및 삭제
- 별점을 이용한 리뷰 추가 및 삭제
- 상품 장바구니에 담기


### 3. 결제 및 이벤트
- 이벤트 게시판 관리
- toss payments api를 이용한 결제
- 행사 상품 금액 처리
- 쿠폰 발급 및 적용 가능
- 나만의 냉장고에 저장


### 4. 1:1 문의
- 웹소켓 / STOMP프로토콜을 활용한 고객과 관리자간의 실시간 1:1채팅
- Ajax를 이용하여 데이터 실시간 반영
- DataBase에 채팅내역을 저장하고,
저장되어 있는 채팅 데이터 불러오기 가능


### 5. 카카오맵 기반 서비스
- 회원의 현재 위치 지정 기능
- 회원과 가까운 거리의 매장부터 출력
- 선택한 매장의 위치
- 재고가 있는 매장의 위치

### 6. 회원 등급에 따른 기능

**[ 일반 회원 모드 ]** 
- 로그인  
- 회원가입  
- 리뷰작성  
- 매장 즐겨찾기, 상품 찜  
- 매장 및 상품 목록 보기  
- 1:1 문의  
- 결제   
- 내 위치설정   


**[ 매장 점주 모드 ]**
- 로그인
- 매장 재고관리
- 회원가입


**[ 웹마스터 모드 ]**
- 고객센터 관리
- 전체 상품관리
- 점주 가입신청 관리

## Preview

<hr>

![로그인.png](https://github.com/yubin0210/itProject/blob/master/upload/%EB%A1%9C%EA%B7%B8%EC%9D%B8.png)
![네이버로그인.png](https://github.com/yubin0210/itProject/blob/master/upload/%EB%84%A4%EC%9D%B4%EB%B2%84%EB%A1%9C%EA%B7%B8%EC%9D%B8.png)

사이트 이용자들의 접근성과 편의성을 높이기 위해 네이버 아이디와 연동하여 로그인이 가능하게 구현하였습니다.

***

![재고찾기.png](https://github.com/yubin0210/itProject/blob/master/upload/%EC%9E%AC%EA%B3%A0%EC%B0%BE%EA%B8%B0.png)

지도 위에 마커로 편의점 위치를 나타내어 이용자들이 쉽게 위치 정보를 알 수 있게 하였습니다.

화면 우측에는 자신의 위치와 가까운 순서대로 편의점 위치가 리스트로 출력됩니다.

***

![점주재고관리.png](https://github.com/yubin0210/itProject/blob/master/upload/%EC%A0%90%EC%A3%BC%EC%9E%AC%EA%B3%A0%EA%B4%80%EB%A6%AC.png)

점주로 등록된 회원은 자신의 매장 재고를 관리 할 수 있습니다.

***

![결제.png](https://github.com/yubin0210/itProject/blob/master/upload/%EA%B2%B0%EC%A0%9C.png)

테스트용 결제 API를 이용하여 실제 결제가 발생하는 것과 똑같이 구현하였습니다.

***

![게시판.png](https://github.com/yubin0210/itProject/blob/master/upload/%EA%B2%8C%EC%8B%9C%ED%8C%90.png)

이용자들의 질문과 이에 대한 답변들을 모아놓은 게시판 입니다. 

웹마스터 모드로 접속시 해당 글들을 관리(추가, 수정, 삭제 등)할 수 있습니다.

***

![유저채팅.png](https://github.com/yubin0210/itProject/blob/master/upload/%EC%9C%A0%EC%A0%80%EC%B1%84%ED%8C%85.png)

사이트 이용 중 불편, 에로사항이 있을 시에 실시간으로 채팅 문의가 가능합니다. 

관리자는 여러 고객과 각각 1:1로 채팅 상담을 진행 할 수 있습니다.




