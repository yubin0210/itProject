<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<script>
	const cpath = '${cpath }'

		alert('회원만 접근 가능한 페이지 입니다')
		location.href = cpath + '/member/login'
		
</script>

</body>
</html>