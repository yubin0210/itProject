<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div class="frame">
	<div class="loginForm">
	<h2 class="loginMainLogo">GS25 Login</h2>
	
	<div class="login">
		<h3 class="loginLogo">로그인</h3>
		<form method="POST">
			<p><input id="loginPadding" type="text" name="userid" placeholder="아이디" required autofocus></p>
			<p><input id="loginPadding" type="password" name="userpw" placeholder="비밀번호" required></p>
			<p><input type="submit" value="로그인"></p>
		</form>
	</div>
	</div>
</div>
</body>
</html>