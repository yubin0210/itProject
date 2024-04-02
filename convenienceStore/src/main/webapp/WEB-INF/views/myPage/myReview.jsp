<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

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
   .boxFrame > div.flex {
      margin-top: 50px;
      margin-bottom: 50px;
   }

	

</style>

</head>
<body>

	<div class="boxFrame">
		<div class="flex">
			<h2><a href="${cpath }/myPage/myReview?userid=${login.userid}">상품 리뷰</a></h2>
			<h2><a href="${cpath }/myPage/myStoreReview?userid=${login.userid }">매장 리뷰</a></h2>
		</div>
		
		<table>
         <thead>
            <tr>
               <th>번호</th>
               <th>상품명</th>
               <th>별점</th>
               <th>작성일</th>
            </tr>
         </thead>
         <tbody>
            <c:forEach var="dto" items="${list }">
               <tr>
                  <td>${dto.idx }</td>
                  <td>${dto.name }</td>
                  <td>${dto.score }</td>
                  <td>${dto.reviewDate }</td>
               </tr>
            </c:forEach>
         </tbody>
      </table>

	</div>
      
</body>
</html>