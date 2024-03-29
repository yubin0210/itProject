<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
	.eventViewFrame{
		width: 960px;
		margin: 0 auto;
	}
	.eventViewFrame > div.flex{
		margin-top: 50px;
		margin-bottom: 50px;
	}
	h2{
		margin: 20px;
	}
	div.title{
		border-top: 2px solid #666666;
		margin: 0 0 30px;
		padding: 40px 0 0 25px;
		height: 70px;
		font-size: 25px;
		font-weight: bold;
	}
	div.date{
		border-top: 1px solid #FFFFFF;
		border-bottom: 1px solid #B2B2B2;
		padding: 20px 0 0 25px;
		height: 70px;
	}
	div.image{
		margin-top: 40px;
	}
	button.listBtn{
		border: 0;
		background-color: #397CA8;
		width: 70px;
		height: 40px;
		color: white;
		font-size: 17px;
	}
	div.couponBtn{
		width: 1200px;
	}
	div.couponBtn > div{
		margin: 50px 33% 50px 33%;
	}
	button.couponBtn{
		width: 200px;
		height: 70px;
		border: 0;
		background-color: #666666;
		color: white;
		font-size: 22px;
	}
</style>

<div class="eventViewFrame">
	<div class="flex">
		<h2><a href="${cpath }/event/list/1">진행중 이벤트</a></h2>
		<h2><a href="${cpath }/event/endList/1">종료된 이벤트</a></h2>
		<c:if test="${login.role == 1 }">
			<h2><a href="${cpath }/event/couponList/1">쿠폰 관리</a></h2>
		</c:if>
	</div>
	<div class="title">
		${dto.title }
	</div>
	<div class="date">
		이벤트 기간 : ${dto.writeDate } ~ ${dto.endDate }
	</div>
	<div class="image">
		<c:forTokens var="image" items="${dto.image }" delims=":">
			<img src='${cpath }/upload/${image}'>
		</c:forTokens>
	</div>
	<div class="couponBtn">
		<div>
		<c:if test="${status == 'current' }">
			<c:if test="${able == 'ok' }">
				<a href="${cpath }/event/userCoupon/${dto.coupon_idx}"><button class="couponBtn">쿠폰 받기</button></a>
			</c:if>
			<c:if test="${able == 'not' }">
				<a href="${cpath }/event/userCoupon/${dto.coupon_idx}"><button class="couponBtn" disabled>받기 완료</button></a>
			</c:if>
		</c:if>
		</div>
	</div>
	<hr>
	<div class="flex sb">
		<div></div>
		<div>
			<c:if test="${status == 'current' }">
				<a href="${cpath }/event/list/1"><button class="listBtn">목록</button></a>
			</c:if>
			<c:if test="${status == 'end' }">
				<a href="${cpath }/event/endList/1"><button class="listBtn">목록</button></a>
			</c:if>
		</div>
	</div>
</div>

</body>
</html>