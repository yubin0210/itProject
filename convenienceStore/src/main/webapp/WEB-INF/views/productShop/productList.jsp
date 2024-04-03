<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
.flexCenterInStock {
	display: flex;
	justify-content: center;
	margin: 10px 0;
}
	
.textCenter {
    display: flex;
    justify-content: center;
    flex-wrap: wrap;
    gap: 10px; 
    padding: 20px 0;
}

.textCenter > div {
    display: inline-flex;
}

.textCenter > div > a {
    background-color: #ffffff; 
    color: #007bff; 
    padding: 8px 16px; 
    border-radius: 5px;
    border: 1px solid #007bff;
    text-decoration: none; 
    transition: all 0.2s ease-in-out;
    font-weight: 500; 
    font-size: 16px; 
}

.textCenter > div > a:hover, .textCenter > div > a.bold {
    background-color: #007bff;
    color: #ffffff; 
    transform: translateY(-2px);
    box-shadow: 0 4px 8px rgba(0, 123, 255, 0.5); 
}

.textCenter > div > a:not(.bold) {
    background-color: #f8f9fa; 
    color: #6c757d; 
    border: 1px solid #ced4da; /* 테두리 색상 */
}

.categoryPreHead {
	height: 80px;
	margin-top: 20px;
	margin-right: 20px;"
}

.categoryHead {
	width: 200px;
	height: 60px;
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 30px;
	font-weight: bold;
	border: 2px solid black;
	border-radius: 18px;
	border-bottom: 0px;
	border-bottom-left-radius: 0;
	border-bottom-right-radius: 0;
	padding: 10px;
	margin: 20px;
	margin-top: 0;
}

.categorySearch {
	width: 900px;
}

.categoryBody {
	width: 1160px;
	height: 80px;
	border: 2px solid black;
	border-radius: 18px;
	border-top-left-radius: 0;
	margin: 20px;
	margin-top: 0;
	position: relative;
	display: flex;
	justify-content: space-around;
	align-items: center;
}

.categoryBodyBlock {
	position: absolute;
	top: -20px;
	left: 0px;
	width: 220px;
	height: 21px;
	border: 0;
	background-color: white;
}

input[type=search] {
	width: 800px;
	height: 60px;
	padding: 0 10px;
	border: 0.5px solid #dadada;
	border-radius: 18px;
	font-size: 20px;
}

input[type=submit] {
	width: 80px;
	height: 60px;
	border: 0.5px solid #dadada;
	border-radius: 18px;
	font-size: 18px;
}

.listBox {
	width: 1196px;
	height: fit-content;
	border: 2px solid #DFDFDF;
	display: flex;
	flex-flow: wrap;
}

.noResult {
	width: 500px;
	margin: 0 auto;
}

.noResult > img {
	margin-top: 50px;
}

.noResult > p {
	font-size: 50px;
	font-weight: bold;
	font-style: italic;
	color: red;
}

.productBox {
	position: relative;
	width: 295px;
	height: 245px;
	margin: 0 1px;
	margin-bottom: 2px;
	border: 1px solid #DFDFDF;
	background-color: white;
	z-index: 1;
}

.hiddenPbs {
	z-index: -100;
	opacity: 0;
}
	
.productBoxStock {
    display: flex;
    justify-content: center;
    align-items: center;
    background-color: rgba(255, 255, 255, 0.85); /* 배경을 흰색 투명으로 설정 */
    color: #dc3545; /* 글자 색상을 빨간색으로 설정 */
    font-size: 18px; /* 글자 크기 조정 */
    font-weight: bold; /* 글자 두께 조정 */
    text-align: center;
    width: 100%; /* 너비를 상품 칸에 맞춤 */
    height: 100%; /* 높이를 상품 칸에 맞춤 */
    position: absolute;
    top: 0;
    left: 0;
    border-radius: 8px; /* 모서리 둥글게 처리 */
    box-shadow: 0 1px 3px rgba(0,0,0,0.1); /* 박스 그림자 효과 추가 */
    z-index: 2; /* 다른 요소 위에 표시 */
    transition: background-color 0.3s ease-in-out; /* 배경색 변경시 부드러운 전환 효과 */
}

.productBoxStock > .pbsVar {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
}


.submit, .detailView {
    display: inline-block;
    padding: 10px 20px;
    margin: 5px;
    background-color: #17a2b8; /* 재고 수정 버튼은 부트스트랩의 info 색상을 사용 */
    color: #fff;
    font-size: 14px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s, transform 0.2s;
}

.submit:hover {
    background-color: #138496; /* 호버 시 색상을 어둡게 변경 */
    transform: translateY(-2px); /* 버튼을 약간 위로 이동 */
}

/* 상세보기 버튼 스타일 */
.detailView {
    background-color: #28a745; /* 상세보기 버튼은 부트스트랩의 success 색상을 사용 */
}

.detailView:hover {
    background-color: #218838; /* 호버 시 색상을 어둡게 변경 */
    transform: translateY(-2px); /* 버튼을 약간 위로 이동 */
}

.productBox > a > img {
	display: block;
	margin: 10px auto;
}

.productName {
	display: flex;
	justify-content: center;
	margin: 10px 0;
}

#ct {
	width: 1160px;
	display: flex;
	justify-content: space-around;
	align-items: center;
}

#ct > input {
	display: none;
}

#ct > label {
	background-color: white;
	font-size: 25px;
	border: 0 solid #DFDFDF;
	border-radius: 18px;
	padding: 15px 40px;
	transition-duration: 0.3s;
	cursor: pointer;
}

#ct > input:checked + label {
	background-color: gainsboro;
	font-size: 25px;
	border: 0.5 solid #DFDFDF;
	border-radius: 18px;
	padding: 15px 40px;
	transition-duration: 0.3s;
}
	
</style>

<section class="frame">
	<h1 style="text-align: center; display: flex; justify-content: center;">${login.nickname } 님 재고 관리 페이지</h1>
	<form action="${cpath }/productShop/productList" method="GET">
		<div class="flex sb categoryPreHead">
			<div class="categoryHead">카테고리</div>
			<div class="flex sb categorySearch">
				<input type="search" name="name" value="${param.name }" placeholder="검색어를 입력 하세요.">
				<input type="submit" value="검색">
			</div>
		</div>
		<div class="categoryBody">
			<div class="categoryBodyBlock"></div>
			<div id = ct>
				<input type="radio" id="ct1" name="category_idx" value="1" ${param.category_idx == 1 ? 'checked' : '' }>
				<label for="ct1" id="1">간편식품</label>
				<input type="radio" id="ct2" name="category_idx" value="2" ${param.category_idx == 2 ? 'checked' : '' }>
				<label for="ct2" id="2">과자류</label>
				<input type="radio" id="ct3" name="category_idx" value="3" ${param.category_idx == 3 ? 'checked' : '' }>
				<label for="ct3" id="3">아이스크림</label>
				<input type="radio" id="ct4" name="category_idx" value="4" ${param.category_idx == 4 ? 'checked' : '' }>
				<label for="ct4" id="4">식품</label>
				<input type="radio" id="ct5" name="category_idx" value="5" ${param.category_idx == 5 ? 'checked' : '' }>
				<label for="ct5" id="5">음료</label>
				<input type="radio" id="ct6" name="category_idx" value="" ${param.category_idx == null ? 'checked' : '' }>
			</div>
		</div>
	</form>
	<h1></h1>
	<div class="listBox">
		<c:forEach var="dto" items="${list }">
			<div class="productBox">
				<a>
					<c:choose>
						<c:when test="${fn:contains(dto.image, 'http') == true}">
							<img src="${dto.image }" onerror="this.src='${cpath }/resources/image/productAdmin/no-image.png';" height="195px">	
						</c:when>
						<c:otherwise>
							<img src="${cpath }/upload/${dto.image }" onerror="this.src='${cpath }/resources/image/productAdmin/no-image.png';" height="195px">	
						</c:otherwise>
					</c:choose>
					<c:if test="${dto.name.length() <= 15 }">
						<span class="productName">${dto.name }</span>
					</c:if>
					<c:if test="${dto.name.length() > 15 }">
						<span class="productName">${dto.name.substring(0, 13) }...</span>
					</c:if>
				</a>
				<div class="productBoxStock hiddenPbs">
					<div class="pbsVar">
						<div class="flexCenterInStock">
							<div>현재 재고 :&nbsp;</div><div class="cnt">${dto.cnt }</div>
						</div>
						<div class="flexCenterInStock">
							<div>추가할 재고 수 :&nbsp;</div>
							<form method="POST" class="formStock">
								<input type="number" name="cnt" inputmode="none">
								<input type="hidden" name="idx" value="${dto.iidx }">
								<input type="hidden" name="store_idx" value="${dto.sidx }">
								<input type="hidden" name="product_idx" value="${dto.idx }">
							</form>
						</div>
						<div style="margin-top: 50px;">
							<button class="submit">재고 수정</button>
							<a href="${cpath }/productShop/detailShop=${dto.idx }"><button class="detailView">상세보기</button></a>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
		<c:if test="${paging.boardCount == 0}">
			<div class="noResult">
				<img src="${cpath }/resources/image/productAdmin/no-results.png" width="500px">
				<p>검색 결과가 없습니다</p>
			</div>
		</c:if>
	</div>
	<div class="textCenter">
		<c:if test="${paging.prev }">
			<div><a href="${cpath }/productShop/productList?name=${param.name }&category_idx=${param.category_idx }&p=${paging.begin - 5 }">이전</a></div>
		</c:if>
		<c:forEach var="i" begin="${paging.begin }" end="${paging.end }">
			<div><a class="${paging.page == i ? 'bold' : '' }" href="${cpath }/productShop/productList?name=${param.name }&category_idx=${param.category_idx }&p=${i }">
				${i }
			</a></div>
		</c:forEach>
		<c:if test="${paging.next }">
			<div><a href="${cpath }/productShop/productList?name=${param.name }&category_idx=${param.category_idx }&p=${paging.end + 1 }">다음</a></div>
		</c:if>
	</div>
</section>

<script>
	function categoryFunction(event) {
		const id = event.target.id
		location.href="${cpath }/productShop/productList?name=${param.name }&category_idx=" + id
	}
	const btnList = document.querySelectorAll('#ct > label')
	btnList.forEach(btn => btn.onclick = categoryFunction)
</script>

<script>
	const pbox = document.querySelectorAll('.productBox')
	const pboxstock = document.querySelectorAll('.productBoxStock')
	const cnt = document.querySelectorAll('.cnt')
	
	for(let i = 0; i < pbox.length; i++) {
		const cnt1 = cnt[i].innerText;
		if(cnt1 == 0) {
			pboxstock[i].classList.remove('hiddenPbs');
			pboxstock[i].style.backgroundColor = 'rgba(255, 0, 0, 0.6)';
			pboxstock[i].style.color = 'white';
		}
		else {
			pbox[i].addEventListener('mouseover', function() {
				pboxstock[i].classList.remove('hiddenPbs');
			});
		}
	}
	
	for(let i = 0; i < pbox.length; i++) {
		const cnt1 = cnt[i].innerText;
		if(cnt1 == 0) {
			pboxstock[i].classList.remove('hiddenPbs');
			pboxstock[i].style.backgroundColor = 'rgba(255, 0, 0, 0.6)';
			pboxstock[i].style.color = 'white';
		}
		else {
			pbox[i].addEventListener('mouseout', function() {
				pboxstock[i].classList.add('hiddenPbs');
			});
		}
	}

</script>

<script>
	document.querySelectorAll('.submit').forEach(button => {
	    button.addEventListener('click', function(event) {
	        var form = button.closest('.productBox').querySelector('.formStock');
	        if (form) {
	            form.submit();
	        }
	    });
	});
</script>

</body>
</html>