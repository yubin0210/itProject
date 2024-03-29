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
	#couponList{
		width: 250px;
		padding: 10px;
	}
</style>
<div class="frame">
	<form method="POST" enctype="multipart/form-data">
		<h1>이벤트게시판 작성</h1>
		<input type="hidden" name="writer" value="${login.userid }">
		<p>
			<select name="coupon_idx" id="couponList">
				<c:forEach var="dto" items="${list }">
					<option value="${dto.idx }">${dto.title }</option>
				</c:forEach>
			</select>
		</p>
		<p><input type="text" name="title" placeholder="이벤트 제목" required autofocus></p>
		<p><input type="date" name="endDate" required></p>
		<p><input type="file" name="upload" multiple required></p>
		<p><input type="submit" value="작성"></p>
	</form>
</div>

</body>
</html>