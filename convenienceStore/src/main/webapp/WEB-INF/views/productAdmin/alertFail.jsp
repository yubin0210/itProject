<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<script>
	const row1 = '${row1 }'
	const row2 = '${row2 }'
	const url = '${url }'
	const cpath = '${cpath }'
	
	if(row1 != 0 && row2 != 0) {
		location.href = cpath + url
	}
	else {
		alert('처리에 실패 하였습니다')
		history.go(-1)
	}
</script>

</body>
</html>