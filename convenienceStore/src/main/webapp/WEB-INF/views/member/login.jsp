<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
	.login {
    	height: 322px;
    	background-color: #FBFBFB;
	}
	.loginLogo {
		font-size: 35px;
		color: #397CA8;
		padding: 35px 0px;
	}
	.loginMainLogo {
		font-size: 35px;
		padding: 70px 0px;
	}
	#loginPadding {
		width: 284px;
		height: 37px;
	}
	.loginForm{
		width: 1200px;
		margin: auto;
	}
</style>

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