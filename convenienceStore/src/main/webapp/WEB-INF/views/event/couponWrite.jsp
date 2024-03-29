<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
	h1{
		color: grey;
	}
	input[type="text"],
	input[type="number"]{
		width: 250px;
	}
	input{
		padding: 10px;
	}
</style>
<div class="frame">
	<form method="POST">
		<h1>쿠폰생성</h1>
		<p><input type="text" name="title" placeholder="쿠폰이름" required autofocus></p>
		<p><input type="text" name="discvalue" placeholder="할인" required></p>
		<p><input type="number" name="valid" placeholder="유효일" required></p>
		<p><input type="submit" value="생성"></p>
	</form>
</div>

</body>
</html>