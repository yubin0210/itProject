<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<style>

       	.loginForm {
            padding-top: 100px;
            padding-bottom: 600px;
        }
        .loginLogo {
           font-size: 25px;
           padding-top: 50px;
           padding-bottom: 70px;
           color : #5d6a7c;
        }
        .login {
           height: 322px;
      	   display: grid;
      	   place-items: center;
        }
        #loginPadding {
           width: 300px;
           height: 36px;
           font-size: 17px;
        }

       input[type="submit"] {
			width: 85px;
			padding: 10px;
			height: 35px;
			background-color: #1E90FF;
			color: white;
			font-weight: bold;
			font-size: 17px;
		}
		.passwordReset {
			font-size: 17px;	
		}
		input {
			width: 360px;
			height: 30px;
			padding: 5px;
			font-size: 15px;
			border: 1px solid #ddd;
  			border-radius: 10px;
			color : #4E5968;
			box-sizing: content-box;
		}
		div.textTitle {
			padding-bottom: 10px;
			color : #4E5968;
			font-size: 16px;
		}
		div.inputPadding {
		padding-bottom: 50px;
		}
		div.loginSubmit {
			text-align: center;
			padding-top: 30px;
		}
		div.resetButton {
			padding-left: 120px;
			color : #4E5968;
			font-weight: bold;
			padding-top: 5px;
		}
		#naverLogin {
			width: 290px;
			height: 30px;
			padding: 5px;
			font-size: 16px;
			border: 1px solid #ddd;
			color : #4E5968;
		}
</style>





<div class="frame">
	<div class="loginForm">
	
	<div class="login">
		<h3 class="loginLogo">로그인</h3>
		<form method="POST">
			<div class="loginFormLeft">
				<div class="inputPadding">
					<div class="textTitle">아이디</div>
					<input id="loginPadding" type="text" name="userid" required autofocus>
				</div>
				<div>
					<div class="textTitle">비밀번호</div>
					<input id="loginPadding" type="password" name="userpw" required>
				</div>
			</div>
		<div class="resetButton inputPadding">
			<a href="${cpath }/member/passwordReset" class="passwordReset">비밀번호 재설정하러가기</a>
		</div>
		
			<div class="loginSubmit">
				<p><input type="submit" value="로그인"></p>
			</div>
		</form>
		
	<p>	
		<input id="naverLogin" type="button" value="네이버 아이디로 로그인/회원가입">
	</p>
		
	</div>
	</div>
</div>


<script>
	const naverLogin = document.getElementById('naverLogin')
	naverLogin.onclick = function() {
		const url = '${naverURL}'
		const name = '_blank'
		const option = 'menubar=no, toolbar=no, width=700, height=1000'
		window.open(url, name, option);
	}
	
	document.addEventListener('DOMContentLoaded', function() {
		
		const isError = location.href.includes('error')
		if(isError) {
			alert('로그인에 실패했습니다')
		}
	})
	
</script>


</body>
</html>