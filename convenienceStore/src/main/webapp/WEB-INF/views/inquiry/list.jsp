<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
  
 

<style>
.board {
    width: 1000px;
    margin: auto;
    background-color: #f9f9f9;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.board h1 {
    text-align: center;
    color: #333;
    margin-bottom: 20px;
}

.question {
    background-color: #ffffff;
    padding: 15px;
    margin-bottom: 10px;
    border-radius: 5px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    cursor: pointer;
    transition: all 0.3s ease;
}

.question:hover {
    background-color: #f0f0f0;
}

.question .h, .answer .h {
    font-weight: bold;
    color: #007bff;
    margin-right: 10px;
}

.answer {
    background-color: #f8f8f8;
    margin-left: 30px;
    padding: 10px;
    border-left: 3px solid #007bff;
}

#chat {
    position: fixed;
    bottom: 10px;
    right: 10px;
    margin: 0;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

#chatIcon {
    width: 60px;
    height: 60px;
    transition: transform 0.3s ease;
}

#chatIcon:hover {
    transform: scale(1.1);
}

.hidden {
	display: none;
}

.write-button, .delete-button {
    display: inline-block;
    margin: 10px 0;
    padding: 8px 15px;
    background-color: #4CAF50; 
    color: white; 
    text-align: center;
    text-decoration: none;
    font-size: 16px;
    border-radius: 5px;
    border: none; 
}

.delete-button {
    background-color: #f44336;
}

</style>

<div class="board">
	<h1>자주묻는 질문 BEST</h1>
	<c:if test="${login.userid == 'admin'}">
		<a href="${cpath }/inquiry/write" class="write-button">글쓰기</a>
	</c:if>
	<c:forEach var="dto" items="${list }">
		<div class="question">
			<span class="h">Q</span>
			<span class="title">${dto.title }</span>
		</div>
		<div class="answer hidden">	
			<span class="h">A</span>
			<div>
				<p>${dto.answer }</p>
			</div>
		</div>
		<c:if test="${login.userid == 'admin'}">
			<a href="${cpath }/inquiry/delete?idx=${dto.idx}" class="delete-button">삭제</a>
		</c:if>
	</c:forEach>
</div>

<div id="chat">
	<a href="${cpath }/inquiry/userChat">
		<img id="chatIcon" src="${cpath }/resources/image/chat아이콘3.png">
	</a>
</div>
	


<script>
	const chat = document.getElementById('chatIcon')
	const questions = document.querySelectorAll('.question')
	const userid = '${login.userid}'
	questions.forEach(e => e.onclick = clickHandler)
	
	function clickHandler(event) {
		const arr = Array.from(questions)
		const idx = arr.indexOf(event.currentTarget)
		
		const answer = document.querySelectorAll('.answer')
		answer[idx].classList.toggle('hidden')
	}
	
	chat.onclick = async function() {
		const url = '${cpath}/create/' + userid
		const result = await fetch(url).then(resp=>resp.text())
	}
</script>

</body>
</html>