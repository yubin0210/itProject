<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.js"></script>  
 

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

.visible {
	display: flex;
}

.chatFrame {
    width: 400px;
    height: 600px;
    border: 1px solid #ccc;
    background-color: #FFF;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
    flex-direction: column;
    overflow: hidden;
}

.chatArea {
    flex-grow: 1;
    padding: 20px;
    overflow-y: auto;
    background: #F9F9F9;
}

.message-left, .message-right {
    padding: 5px 10px;
    border-radius: 20px;
    margin: 5px;
    display: inline-block;
    clear: both;
}

.message-left {
    background-color: #e0e0e0;
    margin-left: 10px;
    text-align: left;
    float: left;
}

.message-right {
    background-color: #0084ff;
    color: white;
    margin-right: 10px;
    text-align: right;
    float: right;
}

.ipt {
    display: flex;
    background-color: #F0F0F0;
    padding: 10px;
}

.input-message {
    flex-grow: 1;
    margin-right: 10px;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 20px;
    outline: none;
}

.btn-send {
    padding: 10px 15px;
    background-color: #0084ff;
    color: white;
    border: none;
    border-radius: 20px;
    cursor: pointer;
    transition: background-color 0.2s;
}

.btn-send:hover {
    background-color: #005ecb;
}

/* Scrollbar styles for chatArea */
.chatArea::-webkit-scrollbar {
    width: 8px;
}

.chatArea::-webkit-scrollbar-track {
    background: #f1f1f1;
}

.chatArea::-webkit-scrollbar-thumb {
    background: #888;
}

.chatArea::-webkit-scrollbar-thumb:hover {
    background: #555;
}

.btn-exit, .btn-close {
	border-radius: 50px;
	width: 16px;
	height: 16px;
	text-align: center;
}
.btn-exit {
	background-color: #FA5858;
}
.btn-close {
	background-color: #2EFE64;
}

</style>

<div class="board">
	<h1>자주묻는 질문 BEST</h1>
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
	</c:forEach>
</div>

<div id="chat">
<!-- 		<p>1:1문의</p> -->
	<img id="chatIcon" src="${cpath }/resources/image/chat아이콘3.png">
	<div class="chatFrame hidden">
   		<div class="buttons">
   			<button class="btn-exit"></button>
   			<button class="btn-close"></button>
   		</div>	
		<div class="chatArea"></div>
		<div class="ipt">	
			<input type="text" name="msg" class="input-message">
   			<input type="button" value="send" class="btn-send">
    	</div>	
	</div>
</div>
	

<script>
	const questions = document.querySelectorAll('.question')
	questions.forEach(e => e.onclick = clickHandler)
	function clickHandler(event) {
		const arr = Array.from(questions)
		const idx = arr.indexOf(event.currentTarget)
		
		const answer = document.querySelectorAll('.answer')
		answer[idx].classList.toggle('hidden')
	}
</script>
<script>
const cpath = '${cpath}'
const sockJS = new SockJS(cpath + '/endpoint')
const stomp = Stomp.over(sockJS)
const username = '${login.nickname}'
const userid = '${login.userid}'


const chatFrame = document.querySelector('.chatFrame')
const chatArea = document.querySelector('.chatArea')
const inputMsg = document.querySelector('input[name="msg"]')
const send = document.querySelector('.btn-send')
const chatIcon = document.getElementById('chatIcon')
const close = document.querySelector('.btn-close')
const exit = document.querySelector('.btn-exit')
let chat_idx = null;

stomp.connect({}, onConnect)

// onclick
exit.onclick = exitChat
send.onclick = sendMsg
inputMsg.onkeyup = function(e) {
	if(e.key == 'Enter') sendMsg()
	if(e.key == 'Escape') e.target.value = ''
}

chatIcon.onclick = function() {
       chatFrame.classList.remove('hidden');
       chatFrame.classList.add('visible')
     	chatIcon.classList.add('hidden')
       onInput()
   };
   
close.onclick = function() {
	chatFrame.classList.add('hidden')
	chatFrame.classList.remove('visible')
	chatIcon.classList.remove('hidden')
}
   
async function onConnect() {
	const url = '${cpath}/create/' + userid
	const result = await fetch(url).then(resp=>resp.text())
	stomp.send('/app/enter', {}, JSON.stringify({
		writer: username
	}))
}

async function onInput() {
	const ad = '${cpath}/getRoom/' + userid
	const adResult = await fetch(ad).then(resp=>resp.json())
	const arr = Array.from(adResult)
	chat_idx = arr[0].idx
	console.log(chat_idx)
	const url = '${cpath}/getMsg/' + chat_idx
	const result = await fetch(url).then(resp=>resp.json())
	console.log(result)
	const arr2 = Array.from(result)
	if(arr2.length != 0) {
		let messageDirection = 'message-left'; // 기본적으로 왼쪽 정렬
       	if(userid != 'admin') { // 현재 사용자가 보낸 메시지인 경우 오른쪽 정렬
         	messageDirection = 'message-right';
      	 }
		arr2.forEach(e => {
		 	let str = ''
		    	str += '<div class="' + messageDirection + '">'
		    	str += '<div>' + e.nickname + '</div>'
		    	str += '<div class="content">' + e.content + '</div>'
		    	str += '</div>'
		   	chatArea.innerHTML += str
		})
	}
   	chatArea.scrollTop = chatArea.scrollHeight;
	stomp.subscribe('/sendTo/' + userid, onReceive)
	stomp.send('app/sendTo/admin/' + userid, {}, JSON.stringify({
		writer: username
	}))
}

async function sendMsg() {
	const text = document.querySelector('input[name="msg"]').value
	if(text == '') {
		return
	}
	document.querySelector('input[name="msg"]').value = ''
	console.log(chat_idx)
	const url = '${cpath}/sendMsg'
	const opt = {
			method: 'POST',
			body: JSON.stringify({
				chat_idx: chat_idx,
				writer: userid,
				content: text
			}),
			headers: {
				'Content-Type': 'application/json; charset=utf-8'
			}
	}
	const result = await fetch(url,opt).then(resp=>resp.text())
	stomp.send('/app/sendMsg/' + userid, {}, JSON.stringify({
		content: text,
		writer: username
	}))
}

async function exitChat() {
	chatFrame.classList.add('hidden')
	chatFrame.classList.remove('visible')
	chatIcon.classList.remove('hidden')
		const url = '${cpath}/exitChat/' + userid
		const result = await fetch(url).then(resp=>resp.text())
	event.preventDefault()
	stomp.send('/app/disconnect/sendTo/' + userid, {}, JSON.stringify({
		userid: userid,
		writer: username
	}))
	stomp.disconnect(function(){
		console.log('Disconnected')
	})
}


function onReceive(chat) {
    const chatContent = JSON.parse(chat.body)
    const text = chatContent.content
    const from = chatContent.writer
    let str = ''
   	let messageDirection = 'message-left'; // 기본적으로 왼쪽 정렬
   	if (chatContent.type === 'entrance') { 
        messageDirection = 'message-center';
    } else if (from === username) { // 현재 사용자가 보낸 메시지인 경우 오른쪽 정렬
        messageDirection = 'message-right';
    }
    if (chatContent.type === 'entrance') {
        str += '<div class="' + messageDirection + '"><div>' + text + '</div></div>'
    }
   	str += '<div class="' + messageDirection + '">'
   	str += '<div>' + from + '</div>'
   	str += '<div class="content">' + text + '</div>'
   	str += '</div>'
   	chatArea.innerHTML += str
   	chatArea.scrollTop = chatArea.scrollHeight;
    
}
	
</script>
</body>
</html>