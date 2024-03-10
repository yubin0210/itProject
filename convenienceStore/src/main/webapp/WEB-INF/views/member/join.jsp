<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div class="frame">
	<h2>회원가입</h2>
	<form method="POST">
		<p><input type="text" name="userid" placeholder="아이디" required autofocus></p>
		<p><input type="password" name="userpw" placeholder="비밀번호" required></p>
		<p><input type="email" name="email" placeholder="이메일" required></p>
		<p><input type="text" name="nickname" placeholder="닉네임" required></p>
		<p><input type="submit" value="회원가입"></p>
	</form>
</div>

</body>
</html>