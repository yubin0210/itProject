<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
main {
	margin: 0 auto;
}

main>div {
	width: 900px;
	margin: 40px 0px;
}

main>div>p {
	margin: 10px 0;
}

main>div>img {
	width: 800px;
}

.specification, .erd {
	text-align: center;
}

.specification>h1, .erd>h1 {
	text-align: left;
}

footer {
	height: 200px;
}
</style>
</head>
<body>

	<main class="frame">
		<div class="main">
			<h1>프로젝트 소개</h1>

			<hr>
			<br>

			<p>네이버 api를 활용한 로그인, 상품 결제, 채팅문의, 카카오맵 기반 서비스</p>
			<p>
				매장관리, 상품픽업, 나만의 냉장고등의 기능을 구현한 <b>편의점 사이트</b> 입니다.
			</p>

			<br> <br>

			<h3>개발 인원</h3>
			<p>5인</p>

			<br>

			<h3>개발기간</h3>
			<p>24.03.07 ~ 24.04.04 (약 1달)</p>

			<br>

			<h3>개발환경</h3>
			<p>
				<b>BackEnd</b> : Java, JSP, Spring Framework
			</p>
			<p>
				<b>DataBase</b> : Oracle DB
			</p>
			<p>
				<b>FrontEnd</b> : HTML, CSS, JavaScript
			</p>
			<p>
				<b>Collaboration</b> : Git
			</p>

			<br>

			<h3>의존성</h3>
			<p>HikariCP, mybatis, commons-fileupload,</p>
			<p>jackson-databind, spring-websocket,</p>
			<p>spring-integration-stomp, jakarta.mail, scribejava</p>

			<br>

			<h3>사용한 api</h3>
			<p>naver login api</p>
			<p>Kakao map api</p>
			<p>toss payments api</p>
		</div>

		<br> <br>

		<div class="erd">
			<h1>ERD</h1>
			<hr>
			<br> <img src="${cpath }/resources/image/project/ERD.png">
		</div>

		<br>

		<div class="specification">
			<h1>요구사항 명세서</h1>
			<hr>
			<br> <img src="${cpath }/resources/image/project/요구사항명세서.JPG">
		</div>

		<br> <br>

		<div class="main-page">
			<h1>주요 기능</h1>
			<hr>
			<br>

			<h2>1. 로그인 & 회원가입</h2>
			<p>아이디, 이메일 중복 불가능</p>
			<p>Hash 를 이용한 비밀번호 처리</p>
			<p>Ajax 를 이용한 이메일 인증</p>
			<p>일반회원과 매장점주 회원은 다르게 회원가입됨</p>
			<p>네이버 로그인 api를 이용하여 상황에 맞게 데이터 처리</p>
			<p>(DB와 데이터를 비교하여, 간편 회원가입 / 로그인 / 계정연동을 진행함)</p>

			<br>

			<h2>2. 상품/매장</h2>
			<p>상품 및 매장 목록 출력하기</p>
			<p>상품 찜 추가 및 삭제</p>
			<p>매장 즐겨찾기 추가 및 삭제</p>
			<p>별점을 이용한 리뷰 추가 및 삭제</p>
			<p>상품 장바구니에 담기</p>

			<br>

			<h2>3. 결제 및 이벤트</h2>
			<p>이벤트 게시판 관리</p>
			<p>toss payments api를 이용한 결제</p>
			<p>행사 상품 금액 처리</p>
			<p>쿠폰 발급 및 적용 가능</p>
			<p>나만의 냉장고에 저장</p>

			<br>

			<h2>4. 1:1 문의</h2>
			<p>웹소켓 / STOMP프로토콜을 활용한 고객과 관리자간의 실시간 1:1채팅</p>
			<p>Ajax를 이용하여 데이터 실시간 반영</p>
			<p>DataBase에 채팅내역을 저장하고, 저장되어 있는 채팅 데이터 불러오기 가능</p>

			<br>

			<h2>5. 카카오맵 기반 서비스</h2>
			<p>회원의 현재 위치 지정 기능</p>
			<p>회원과 가까운 거리의 매장부터 출력</p>
			<p>선택한 매장의 위치</p>
			<p>재고가 있는 매장의 위치</p>

			<br>

			<h2>6. 회원 등급에 따른 기능</h2>

			<h3>[ 일반 회원 모드 ]</h3>

			<p>로그인</p>
			<p>회원가입</p>
			<p>리뷰작성</p>
			<p>매장 즐겨찾기, 상품 찜</p>
			<p>매장 및 상품 목록 보기</p>
			<p>1:1 문의</p>
			<p>결제</p>
			<p>내 위치설정</p>
			<br>
			<h3>[ 매장 점주 모드 ]</h3>

			<p>로그인</p>
			<p>매장 재고관리</p>
			<p>회원가입</p>
			<br>
			<h3>[ 웹마스터 모드 ]</h3>

			<p>고객센터 관리</p>
			<p>전체 상품관리</p>
			<p>점주 가입신청 관리</p>

		</div>
		<footer></footer>
	</main>

</body>
</html>