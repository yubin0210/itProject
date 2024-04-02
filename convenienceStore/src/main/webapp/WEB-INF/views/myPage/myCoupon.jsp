<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
   .boxFrame {
      width: 1200px;
        margin: auto;
   }
   table {
      border-collapse: collapse;
      border-spacing: 0;
      width: 100%;
      text-align: center;
   }
   thead > tr {
      background-color: #f8f8f8;
      border-top: 2px solid #666666;
      border-bottom: 1px solid #FFFFFF;
      height: 65px;
   }
   thead > tr > th {
      font-size: 18px;
      font-weight: bold;
   }
   tbody > tr {
      height: 100px;
      border-bottom: 1px solid #B2B2B2;
   }
   tbody > tr > td.title {
      font-size: 20px;
      font-weight: bold;
   }
   h2 {
      margin: 20px;
   }
   .center {
      text-align: center;
      color: grey;
   }
   .bold {
      font-weight: bold;
   }
   input[type="search"] {
      width: 400px;
      height: 40px;
      border-radius: 30px;
      margin-left: 400px;
   }
   #searchBtn {
      background-color: skyblue;
      border: 0;
      height: 40px;
      border-radius: 30px;
      font-size: 17px;
      width: 70px;
   }
   .boxFrame > div.flex {
      margin-top: 50px;
      margin-bottom: 50px;
   }
   .write {
      margin-left: 200px;
   }
   
</style>
</head>
<body>

	<div class="boxFrame">
		<div class="flex couponTitle">
			<h2>보유쿠폰</h2>
		</div>

		<div class="boxList">
			<table>
				<thead>
					<tr>
						<th>쿠폰명</th>
						<th>할인</th>
						<th>발행일</th>
						<th>종료일</th>
						<th>사용여부</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="dto" items="${list }">
						<tr>
							<td>${dto.title }</td>
							<td>${dto.discvalue }</td>
							<td>${dto.issueDate }</td>
							<td>${dto.endDate }</td>
							<c:if test="${dto.usedDate != null}">
								<td>사용완료</td>
							</c:if>
							<c:if test="${dto.usedDate == null }">
								<td>미사용</td>
							</c:if>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>



	</div>

	</div>
</body>
</html>