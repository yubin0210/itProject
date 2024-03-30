<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<style>
        p.joinContent {
           font-size: 18px;
           padding-bottom: 100px;
           color : #4E5968;
        }
 		.joinForm {
          	padding-left: 60px;
            padding-bottom: 300px;
        }
        .joinLogo {
           font-size: 25px;
           padding-top: 100px;
           padding-bottom: 30px;
        }
        .joinLeft , .joinRight {
			width: 960px;
			height: 250px;
			border-radius: 10px;
			justify-content: center;
			text-align: center;
		}
		h2.joinButtonContent {
			font-size: 21px;
			padding-bottom: 80px;
			color : #4E5968;
		}
		button.joinB {
			padding: 10px;
			font-size: 17px;
			border-radius: 10px;
			border: 1px solid #ddd;
		}
		button.joinB:hover {
			background-color: #1E90FF;
			color: white;
			border: none;
		}



</style>

<div class="frame">
	<div class="joinForm">
	<h2 class="joinLogo">회원가입</h2>
	
	<p class="joinContent">고객과 함께 내일을 꿈꾸며, 새로운 삶의 가치를 창조하는 GS리테일 회원가입을 환영합니다.</p>
	
	<div class="joinButton flex">
		<div class="joinLeft">
		<img src="${cpath }/resources/image/join/개인.png" width="115px">
			<h2 class="joinButtonContent">개인 가입자</h2>
			<a href="${cpath }/member/joinBasicMember"><button class="joinB">가입하러 가기</button></a>
		</div>
		
		
		<div class="joinRight">
			<img src="${cpath }/resources/image/join/매장점주.png" width="120px">
			<h2 class="joinButtonContent">점주 가입자</h2>
			<a href="${cpath }/member/joinStoreMember"><button class="joinB">가입하러 가기</button></a>
		</div>
			
	</div>

	</div>
</div>



</body>
</html>