<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
	.relative {
		position: relative;
	}

	.textCenter {
		text-align: center;
		margin-bottom: 100px;
		display: flex;
		justify-content: center;
	}
	
	.textCenter > div {
		margin: 0 4px;
		font-size: 30px;
	}
	
	.textCenter > div > a {
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
		width: 295px;
		height: 245px;
		margin: 0 1px;
		margin-bottom: 2px;
		border: 1px solid #DFDFDF;
		background-color: white;
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
	
	.adminButtons {
		display: flex;
		justify-content: flex-end;
		margin-bottom: 50px;
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
	
	button {
		font-size: 20px;
		width: 150px;
		height: 40px;
	}
	
</style>

<section class="frame">
	<form action="${cpath }/productAdmin/adminPage" method="GET">
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
			<div class="productBox relative">
				<a href="${cpath }/productAdmin/detailAdmin=${dto.idx }">
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
			</div>
		</c:forEach>
		<c:if test="${paging.boardCount == 0}">
			<div class="noResult">
				<img src="${cpath }/resources/image/productAdmin/no-results.png" width="500px">
<!-- 			이미지 출처 : https://www.flaticon.com/free-icons/page-not-found" Page not found icons created by Freepik - Flaticon	-->
				<p>검색 결과가 없습니다</p>
			</div>
		</c:if>
	</div>
	<div class="adminButtons">
		<a href="${cpath }/productAdmin/add"><button>상품 추가</button></a>
		<a href="${cpath }/productAdmin/deletee"><button>상품 삭제</button></a>
	</div>
	<div class="textCenter">
		<c:if test="${paging.prev }">
			<div>[<a href="${cpath }/productAdmin/adminPage?name=${param.name }&category_idx=${param.category_idx }&p=${paging.begin - 5 }">이전</a>]</div>
		</c:if>
		<c:forEach var="i" begin="${paging.begin }" end="${paging.end }">
			<div>[<a class="${paging.page == i ? 'bold' : '' }" href="${cpath }/productAdmin/adminPage?name=${param.name }&category_idx=${param.category_idx }&p=${i }">
				${i }
			</a>]</div>
		</c:forEach>
		<c:if test="${paging.next }">
			<div>[<a href="${cpath }/productAdmin/adminPage?name=${param.name }&category_idx=${param.category_idx }&p=${paging.end + 1 }">다음</a>]</div>
		</c:if>
	</div>
</section>

<script>
	function categoryFunction(event) {
		const id = event.target.id
		location.href="${cpath }/productAdmin/adminPage?name=${param.name }&category_idx=" + id
	}
	const btnList = document.querySelectorAll('#ct > label')
	btnList.forEach(btn => btn.onclick = categoryFunction)
</script>

</body>
</html>