<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<script>
	const row = '${dto }'
	const cpath = '${cpath }/'
	
	if(row != 0) {
		alert('내 위치 지정이 완료 되었습니다')
		location.href = cpath
	}
	else {
		alert('오류가 발생 하였습니다')
		go.back(-1)
	}
</script>

</body>
</html>