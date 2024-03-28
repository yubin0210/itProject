<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<script>
	const row = '${row }'
	const url = '${url }'
	const cpath = '${cpath }'
	
	if(row != 0) {
		location.href = cpath + url
	}
	else {
		alert('접근 권한이 없습니다')
		location.href = cpath
	}
</script>

</body>
</html>