<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
	.detailBox {
		width: 1176px;
		height: fit-content;
		margin-top: 20px;
		border: 2px solid #DFDFDF;
		padding: 10px;
	}
	
	.boxImage {
		width: 648px;
		display: flex;
		justify-content: center;
	}
	
	.boxText {
		width: 518px;
		padding-left: 10px;
		display: flex;
		flex-flow: column;
	}
	
	.boxText > div:nth-child(1) {
		font-weight: bold;
		font-size: 36px;
		margin-bottom: 20px;
	}
	
	.boxText > div:nth-child(2) {
		font-size: 18px;
	}
	
	.boxText > div:nth-child(3) {
		font-size: 25px;
		text-align: right;
		margin-bottom: 10px;
	}
	
	.boxText > div:nth-child(4) {
		font-size: 18px;
		margin-bottom: 50px;
	}
	
	.boxText > div:nth-child(5) {
		font-size: 18px;
	}

</style>

<section class="frame">
	<div class="detailBox flex sb">
		<div class="boxImage">
			<c:choose>
				<c:when test="${fn:contains(dto.image, 'http') == true}">
					<img src="${dto.image }" onerror="this.src='${cpath }/resources/image/productAdmin/no-image.png';" height="548px">	
				</c:when>
				<c:otherwise>
					<img src="${cpath }/upload/${dto.image }" onerror="this.src='${cpath }/resources/image/productAdmin/no-image.png';" width="100%" height="548px">	
				</c:otherwise>
			</c:choose>
		</div>
		<div class="boxText">
			<div>${dto.name }</div>
			<div>
				카테고리 : 
				<c:if test="${dto.category_idx == 1}">
					간편식품
				</c:if>
				<c:if test="${dto.category_idx == 2}">
					과자류
				</c:if>
				<c:if test="${dto.category_idx == 3}">
					아이스크림
				</c:if>
				<c:if test="${dto.category_idx == 4}">
					식품
				</c:if>
				<c:if test="${dto.category_idx == 5}">
					음료
				</c:if>
			</div>
			<div>권장소비자가격 : ${dto.price } 원</div>
			<div>${dto.event } 제품</div>
			<div>${dto.content }</div>
			<div>${dto.upload }</div>
			
		</div>
	</div>
</section>

<script>

	const numb = document.getElementById('price')
	const roo = document.getElementById('roo')

	function numberWithCommas(num) {
    	return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
//     	return num.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	}
	
	function comma(num){
	    var len, point, str; 
	       
	    num = num + ""; 
	    point = num.length % 3 ;
	    len = num.length; 
	   
	    str = num.substring(0, point); 
	    while (point < len) { 
	        if (str != "") str += ","; 
	        str += num.substring(point, point + 3); 
	        point += 3; 
	    }
	    return str;
	    
	const result = numberWithCommas(numb);
	roo.innerHTML += result;
	 
</script>

</body>
</html>