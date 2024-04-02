<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
		.joinForm {
 			padding-left: 30%;
            padding-bottom: 300px;
            padding-top: 100px;
        }
		.joinLogo {
           font-size: 32px;
           padding-top: 50px;
           padding-bottom: 70px;
           color : #5d6a7c;
        }
     	p.joinContent {
           font-size: 22px;
           padding-bottom: 100px;
        }	
		div.submitPadding {
			padding: 40px 0px;
		}
		input[type="submit"] {
			width: 150px;
			padding: 10px;
			height: 45px;
			background-color: #1E90FF;
			color: white;
			font-weight: bold;
			font-size: 15px;
		}
		input {
			width: 300px;
			height: 30px;
			padding: 5px;
			font-size: 15px;
			border: 1px solid #ddd;
  			border-radius: 10px;
		}
		select {
			width: 300px;
			height: 30px;
			padding: 5px;
			font-size: 16px;
			border-radius: 10px;
		}
		div.storePadding {
			padding-bottom: 30px;
		}
		div.title {
			font-size: 15px;
			color : #4E5968;
			padding-top: 30px;
			font-weight: bold;
		}

</style>

</head>
<body>

<div class="frame">
	<div class="joinForm">

	<h2 class="joinLogo">매장 점주 회원가입</h2>

	<form method="POST" class="joinInput">
      <div class="storePadding">
      	매장 선택 : <select name="store_idx">
        			<c:forEach var="item" items="${list}">
            		<option value="${item.idx}">${item.name}</option>
            		<div>${item.idx }</div>
        			</c:forEach>
      			  </select>
      </div>
      <div class="title">아이디</div>
	  <p><input type="text" name="userid" value="${dto.userid }"><p>
	  <div class="title">이름</div>
      <p><input type="text" name="name" required></p>
      
      <div class="submitPadding">
      	<p><input type="submit" value="점주 가입완료"></p>
      </div>
	</form>
</div>
</div>
</body>
</html>