<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
	.couponFrame{
		width: 1200px;
        margin: auto;
	}
	table{
		border-collapse: collapse;
		border-spacing: 0;
		width: 100%;
		text-align: center;
	}
	thead > tr{
		background-color: #f8f8f8;
		border-top: 2px solid #666666;
		border-bottom: 1px solid #FFFFFF;
		height: 65px;
	}
	thead > tr > th{
		font-size: 18px;
		font-weight: bold;
	}
	tbody > tr{
		height: 100px;
		border-bottom: 1px solid #B2B2B2;
	}
	tbody > tr > td.title{
		font-size: 20px;
		font-weight: bold;
	}
	h2{
		margin: 20px;
	}
	.center{
		text-align: center;
		color: grey;
	}
	.bold{
		font-weight: bold;
	}
	.pageNum{
		font-size: 25px;
		margin: 7px;
	}
	input[type="search"]{
		width: 400px;
		height: 40px;
		border-radius: 30px;
		margin-left: 400px;
	}
	#searchBtn{
		background-color: skyblue;
		border: 0;
		height: 40px;
		border-radius: 30px;
		font-size: 17px;
		width: 70px;
	}
	.couponFrame > div.flex{
		margin-top: 50px;
		margin-bottom: 50px;
	}
	.write{
		margin-left: 200px;
	}
	
</style>

<div class="couponFrame">
	<div class="flex">
		<h2><a href="${cpath }/event/list/1">진행중 이벤트</a></h2>
		<h2><a href="${cpath }/event/endList/1">종료된 이벤트</a></h2>
		<c:if test="${login.role == 1 }">
			<h2><a href="${cpath }/event/couponList/1">쿠폰 관리</a></h2>
		</c:if>
	</div>
	<div class="couponList">
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>쿠폰이름</th>
					<th>할인</th>
					<th>유효일</th>
					<c:if test="${login.role == 1 }">
						<th>기능</th>
					</c:if>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="dto" items="${list }">
					<tr>
						<td>${dto.idx}</td>
						<td class="title">${dto.title }</td>
						<td>${dto.discvalue}</td>
						<td>${dto.valid }일</td>
						<c:if test="${login.role == 1 }">
							<td>
								<a href="${cpath }/event/couponDelete/${dto.idx}"><button>삭제</button></a>
							</td>
						</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div class="center">
		<c:if test="${paging.prev }">
			<a href="${cpath }/event/couponlist/${paging.begin - 10}?search=${param.search}">이전</a>
		</c:if>
		
		<c:forEach var="i" begin="${paging.begin }" end="${paging.end }">
			<a class="${paging.page == i ? 'bold' : '' } pageNum" 
			   href="${cpath }/event/couponlist/${i}?search=${param.search}">${i }</a>
		</c:forEach>
		
		<c:if test="${paging.next }">
			<a href="${cpath }/event/couponlist/${paging.end + 1}?search=${param.search}">다음</a>
		</c:if>
	</div>
	
	<div class="flex">
		<div></div>
		<div>
			<form action="${cpath }/event/couponList/1">
				<input type="search" name="search" value="${param.search }" placeholder="검색어를 입력하세요">
				<input type="submit" id="searchBtn" value="검색">
			</form>
		</div>
		<div>
		<c:if test="${login.role == 1 }">
			<a class="write" href="${cpath }/event/couponWrite"><button>쿠폰발행</button></a>
		</c:if>
		</div>
	</div>
	
</div>

</body>
</html>