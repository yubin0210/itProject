<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div class="frame">
	<div class="joinForm">
	<h2 class="joinLogo">GS25 신규 회원가입</h2>
	
	<p class="joinContent">고객과 함께 내일을 꿈꾸며, 새로운 삶의 가치를 창조하는 GS리테일 회원가입을 환영합니다.</p>
	
	<form method="POST">
		<p><input type="radio" name="role" value="1">관리자
		<input type="radio" name="role" value="2">매장 점주
		<input type="radio" name="role" value="3">개인</p>
		<p><input type="text" name="userid" placeholder="아이디" required autofocus></p>
		<p><input type="password" name="userpw" placeholder="비밀번호" required></p>
		<p><input type="email" name="email" placeholder="이메일" required></p>
		<p><input type="text" name="nickname" placeholder="닉네임" required></p>
		<p><input type="submit" value="회원가입"></p>
	</form>
	</div>
</div>



</body>
</html>