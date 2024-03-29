<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
	.eventFrame{
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
	.eventFrame > div.flex{
		margin-top: 50px;
		margin-bottom: 50px;
	}
	
	.write{
		margin-left: 200px;
	}
	
</style>

<div class="eventFrame">
	<div class="flex">
		<h2><a href="${cpath }/event/list/1">진행중 이벤트</a></h2>
		<h2><a href="${cpath }/event/endList/1">종료된 이벤트</a></h2>
		<c:if test="${login.role == 1 }">
			<h2><a href="${cpath }/event/couponList/1">쿠폰 관리</a></h2>
		</c:if>
	</div>
	<div class="eventList">
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>이벤트제목</th>
					<th>이벤트기간</th>
					<c:if test="${login.role == 1 }">
						<th>관리자</th>
					</c:if>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="dto" items="${list }">
					<tr>
						<td>${dto.idx}</td>
						<td class="title"><a href="${cpath}/event/view/${dto.idx}?status=${status }">${dto.title }</a></td>
						<td>${dto.writeDate} ~ ${dto.endDate}</td>
						<c:if test="${login.role == 1 }">
							<td>
								<a href="${cpath }/event/delete/${dto.idx}"><button>삭제</button></a>
								<a href="${cpath }/event/modify/${dto.idx}"><button>수정</button></a>
							</td>
						</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<c:if test="${status == 'current' }">
		<div class="center">
			<c:if test="${paging.prev }">
				<a href="${cpath}/event/list/${paging.begin - 10}?search=${param.search}">이전</a>
			</c:if>
			
			<c:forEach var="i" begin="${paging.begin }" end="${paging.end }">
				<a class="${paging.page == i ? 'bold' : '' } pageNum" 
				   href="${cpath}/event/list/${i}?search=${param.search}">${i }</a>
			</c:forEach>
			
			<c:if test="${paging.next }">
				<a href="${cpath}/event/list/${paging.end + 1}?search=${param.search}">다음</a>
			</c:if>
		</div>
		
		<div class="flex">
			<div></div>
			<div>
				<form action="${cpath}/event/list/1">
					<input type="search" name="search" value="${param.search }" placeholder="검색어를 입력하세요">
					<input type="submit" id="searchBtn" value="검색">
				</form>
			</div>
			<div>
			<c:if test="${login.role == 1 }">
				<a class="write" href="${cpath }/event/write"><button>작성</button></a>
			</c:if>
			</div>
		</div>
	</c:if>
	
	<c:if test="${status == 'end' }">
		<div class="center">
			<c:if test="${paging.prev }">
				<a href="${cpath }/event/endList/${paging.begin - 10}?search=${param.search}">이전</a>
			</c:if>
			
			<c:forEach var="i" begin="${paging.begin }" end="${paging.end }">
				<a class="${paging.page == i ? 'bold' : '' } pageNum" 
				   href="${cpath }/event/endList/${i}?search=${param.search}">${i }</a>
			</c:forEach>
			
			<c:if test="${paging.next }">
				<a href="${cpath }/event/endList/${paging.end + 1}?search=${param.search}">다음</a>
			</c:if>
		</div>
		
		<div class="flex">
			<div></div>
			<div>
				<form action="${cpath }/event/endList/1">
					<input type="search" name="search" value="${param.search }" placeholder="검색어를 입력하세요">
					<input type="submit" id="searchBtn" value="검색">
				</form>
			</div>
			<div></div>
		</div>
	</c:if>
</div>




</body>
</html>