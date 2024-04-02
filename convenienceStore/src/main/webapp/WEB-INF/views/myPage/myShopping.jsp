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
   .boxFrame > div.flex {
      margin-top: 50px;
      margin-bottom: 50px;
   }

   
</style>

</head>
<body>

	<div class="boxFrame">
		<div class="flex">
			<h2>주문내역</h2>
		</div>
			
		<div class="boxList">
      	<table>
         <thead>
            <tr>
               	<th>매장명</th>
               	<th>픽업코드</th>
               	<th>주문일</th>
				<th>픽업일</th>
				<th>결제금액</th>
           </tr>
         </thead>
         <tbody>
           <c:forEach var="dto" items="${list }">
              <tr>
                <td>${dto.name }</td>
                <td>${dto.pickupCode }</td>
	    		<td>${dto.orderDate }</td>
	    		<td>${dto.pickupTime }</td>
	    		<td>${dto.amount }</td>		
              </tr>
           </c:forEach>
         </tbody>
      </table>
   </div>

</div>
			

</body>
</html>