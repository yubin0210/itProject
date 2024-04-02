<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<script>
	const row = '${row }'
	const pidx = '${pidx }'
	const cpath = '${cpath }/'
	
	if(row != 0) {
		alert('재고 수정에 성공 하셨습니다')
		location.href = cpath + 'productShop/detailShop=' + pidx
	}
	else {
		alert('오류가 발생 하였습니다')
		location.href = cpath + 'productShop/productList'
	}
</script>

</body>
</html>