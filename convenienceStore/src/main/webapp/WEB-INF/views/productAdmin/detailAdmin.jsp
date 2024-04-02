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
	
	.boxText > div.boxTextName {
		font-weight: bold;
		font-size: 36px;
		margin-bottom: 20px;
	}
	
	.boxText > boxTextCategory {
		font-size: 18px;
	}
	
	.boxText > div.price {
		display: flex;
		justify-content: flex-end;
		font-size: 25px;
		text-align: right;
		margin-bottom: 10px;
	}
	
	.boxText > div.boxTextEvent {
		font-size: 18px;
		margin-bottom: 10px;
		
	}
	
	.boxText > div.boxTextContent {
		font-size: 18px;
	}
	
	button {
		font-size: 20px;
		width: 150px;
		height: 40px;
	}

</style>

<section class="frame">
	<div id="pricee" style="display: none;">${dto.price }</div>
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
			<div class="boxTextName">${dto.name }</div>
			<div class="boxTextCategory">
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
			<div class="price">
				<div>권장소비자가격 :&nbsp;</div>
				<div id="output"></div>
				<div>&nbsp;원</div>
			</div>
			<div class="boxTextEvent">${dto.event } 제품</div>
			<div class="boxTextContent">${dto.content }</div>
			<div>${dto.upload }</div>
		</div>
	</div>
	<div class="flex sb">
		<div></div>
		<div>
			<a href="${cpath }/productAdmin/modify=${dto.idx }"><button>상품 수정</button></a>
			<a href="${cpath }/productAdmin/delete=${dto.idx }"><button>상품 삭제</button></a>
		</div>
	</div>
</section>

<script>
	const price = document.getElementById('pricee')
	// 천 단위로 쉼표를 추가하는 함수
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	// 페이지가 로드될 때 실행되는 함수
	window.onload = function() {
	    // 자동으로 실행될 코드
	    var inputValue = price.innerText;
	    var formattedValue = numberWithCommas(inputValue);
	    var outputElement = document.getElementById('output');
	    outputElement.textContent = formattedValue;
	};
</script>

</body>
</html>