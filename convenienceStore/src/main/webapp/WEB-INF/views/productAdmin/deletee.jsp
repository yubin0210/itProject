<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<c:if test="${login.role != 1 }">
	<script>
		alert('잘못된 접근 입니다')
		location.href = '${cpath }/'
	</script>	
</c:if>

<section class="frame">
	<h1>상품 삭제(액션) 임시 페이지 입니다</h1>
	<hr>
</section>

</body>
</html>