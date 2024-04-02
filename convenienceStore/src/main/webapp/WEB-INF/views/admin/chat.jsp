<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.js"></script>  

<style>
body, html {
    margin: 0;
    padding: 0;
    font-family: 'Segoe UI', Arial, sans-serif;
}

.listFrame {
    position: fixed;
    bottom: 20px;
    left: 20px;
    width: 350px;
    height: 500px;
    border: 1px solid #ccc;
    background-color: #FFF;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    overflow: hidden;
    display: flex;
    flex-direction: column;
}

/* 채팅 목록 타이틀 스타일 */
.listFrame h3 {
    padding: 15px;
    margin: 0;
    background-color: #f7f7f7;
    color: #333;
    font-size: 18px;
    text-align: center;
    border-bottom: 1px solid #eee;
}

/* 채팅방 목록 스타일 */
.chatList {
    flex-grow: 1;
    overflow-y: auto;
    padding: 10px;
}

.chatRoom {
    background-color: #EFEFEF;
    color: #333;
    padding: 10px;
    margin-bottom: 8px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.2s ease-in-out;
}

.chatRoom:hover {
    background-color: #e0e0e0;
}


/* 채팅창 스타일 */
#chat .chatFrame {
    position: fixed;
    bottom: 20px;
    right: 20px;
    width: 400px;
    height: 600px;
    border: 1px solid #ccc;
    background-color: #FFF;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    flex-direction: column;
    overflow: hidden;
    transition: bottom 0.5s ease-in-out;
}

.buttons {
    padding: 10px;
    display: flex;
    justify-content: flex-end;
}

.buttons .buttons .btn-close {
    margin-left: 5px;
    cursor: pointer;
}

.btn-close {
    padding: 6px 12px;
    background-color: #d9534f; /* 버튼 배경색 */
    color: white; /* 버튼 내 텍스트 색상 */
    font-weight: bold; /* 텍스트 굵기 */
    border: none; /* 테두리 제거 */
    border-radius: 4px; /* 버튼 모서리 둥글게 */
    cursor: pointer; /* 마우스 오버 시 커서 변경 */
    transition: background-color 0.2s ease-in-out; /* 호버 애니메이션 */
    outline: none; /* 포커스 시 테두리 제거 */
    margin-left: 10px; /* 왼쪽 버튼과의 간격 */
}

.btn-close:hover {
    background-color: #c9302c; /* 호버 시 배경색 변경 */
}

.btn-close:focus {
    outline: none; /* 포커스 시 외곽선 제거 */
    box-shadow: 0 0 0 2px rgba(217, 83, 79, .5); /* 포커스 시 그림자 효과 */
}

.chatArea {
    flex-grow: 1;
    padding: 20px;
    overflow-y: auto;
    background: #F9F9F9;
}

.message-left, .message-right {
    padding: 10px 15px;
    border-radius: 20px;
    margin: 5px 0;
    word-break: break-word;
}

.message-left {
    background-color: #e0e0e0;
    align-self: flex-start;
}

.message-right {
    background-color: #0084ff;
    color: white;
    align-self: flex-end;
}

/* 입력 영역 스타일 */
.ipt {
    padding: 10px;
    background-color: #F0F0F0;
    display: flex;
}

.input-message {
    flex-grow: 1;
    margin-right: 10px;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 20px;
}

.btn-send {
    padding: 10px 15px;
    background-color: #0084ff;
    color: white;
    border: none;
    border-radius: 20px;
    cursor: pointer;
}

.btn-send:hover {
    background-color: #005ecb;
}
.chatOpenButton {
    position: fixed;
    bottom: 20px;
    right: 20px;
    background-color: #0084ff;
    color: white;
    width: 70px;
    height: 70px;
    border-radius: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
    cursor: pointer;
    font-size: 40px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.hidden {
	display: none;
}

.visible {
	display: flex;
}

</style>
<div class="listFrame">
	<h3>채팅목록</h3>
	<div class="chatList">
	</div>
</div>	
<div id="chat">
	<div class="chatFrame hidden">
		<div class="buttons">
   			<button class="btn-close">창닫기</button>
   		</div>	
		<div class="chatArea"></div>
		<div class="ipt">	
			<input type="text" name="msg" class="input-message">
			<input type="button" value="send" class="btn-send">
	   	</div>	
	</div>
	<div class="chatOpenButton hidden">⬆️</div>
</div>
<script>

const cpath = '${cpath}'
const username = '${login.nickname}'
const listFrame = document.querySelector('.chatList')
const chatArea = document.querySelector('.chatArea')
const chatFrame = document.querySelector('.chatFrame')
const send = document.querySelector('.btn-send')
const inputMsg = document.querySelector('.input-message')
const close = document.querySelector('.btn-close')
const chatOpenButton = document.querySelector('.chatOpenButton');

let chat_idx = null;
let userid = ''

const sockJS = new SockJS(cpath + '/endpoint')
const stomp = Stomp.over(sockJS)
stomp.connect({}, onConnect)
function onConnect() {
	stomp.subscribe('/sendTo/admin', onReceive)
	stomp.send('/app/enter', {}, JSON.stringify({
		writer: username
	}))
}
send.onclick = sendMsg
close.onclick = function() {
    // 채팅 창이 화살표 아이콘 쪽으로 빨려가는 효과 구현
    chatFrame.style.bottom = "-600px"; // 채팅 창의 높이만큼 아래로 이동시켜 숨김
    setTimeout(() => {
        chatFrame.classList.add('hidden');
        chatFrame.classList.remove('visible')
        chatOpenButton.classList.remove('hidden'); // 화살표 버튼 표시
    }, 500); // transition 시간과 일치시키기
}

chatOpenButton.onclick = function() {
    chatFrame.style.bottom = "-600px"
    chatFrame.classList.remove('hidden')
    chatFrame.classList.add('visible')
    setTimeout(() => {
        chatFrame.style.bottom = "20px"
    }, 10);
    chatOpenButton.classList.add('hidden'); 
}

inputMsg.onkeyup = function(e) {
	if(e.key == 'Enter') sendMsg()
	if(e.key == 'Escape') e.target.value = ''
}
chatList()

async function chatList() {
	const url = '${cpath}/chatList'
	const result = await fetch(url).then(resp=>resp.json())
	const arr = Array.from(result)
	console.log(arr)
	arr.forEach(e=> {
		let str = ''
		str += '<div class="chatRoom">' + e + '</div>'
		listFrame.innerHTML += str
	})
	const chat = document.querySelectorAll('.chatRoom')
	chat.forEach(e => e.addEventListener('click', enterChat))
}

async function enterChat(event) {
	userid = event.target.textContent
	const ad = '${cpath}/getRoom/' + userid
	const adResult = await fetch(ad).then(resp=>resp.json())
	const arr = Array.from(adResult)
	chat_idx = arr[0].idx
	console.log(chat_idx)
	const url = '${cpath}/getMsg/' + chat_idx
	const result = await fetch(url).then(resp=>resp.json())
	console.log(result)
	const arr2 = Array.from(result)
	console.log(arr2)
	if(arr2.length != 0) {
		arr2.forEach(e => {
		let messageDirection = 'message-left'; // 기본적으로 왼쪽 정렬
       	if(e.writer == 'admin') { // 현재 사용자가 보낸 메시지인 경우 오른쪽 정렬
         	messageDirection = 'message-right';
      	 }
	 	let str = ''
	    	str += '<div class="' + messageDirection + '">'
	    	str += '<div>' + e.nickname + '</div>'
	    	str += '<div class="content">' + e.content + '</div>'
	    	str += '</div>'
	   	chatArea.innerHTML += str
		})
	}
   	chatArea.scrollTop = chatArea.scrollHeight;
	chatFrame.classList.remove('hidden')
	chatFrame.classList.add('visible')
	stomp.subscribe('/sendTo/' + userid, onReceive)
}

async function sendMsg() {
	const text = document.querySelector('input[name="msg"]').value
	if(text == '') {
		return
	}
	document.querySelector('input[name="msg"]').value = ''
	const url = '${cpath}/sendMsg'
	const opt = {
			method: 'POST',
			body: JSON.stringify({
				chat_idx: chat_idx,
				writer: '${login.userid}',
				content: text
			}),
			headers: {
				'Content-Type' : 'application/json; charset=utf-8'
			}
	}
	const result = await fetch(url,opt).then(resp=>resp.text())
	stomp.send('/app/sendTo/' + userid, {}, JSON.stringify({
		content: text,
		writer: username
	}))
}

function onReceive(chat) {
    const chatContent = JSON.parse(chat.body)
    const text = chatContent.content
    const from = chatContent.writer
	let messageDirection = 'message-left'; // 기본적으로 왼쪽 정렬
    if(from == username) { // 현재 사용자가 보낸 메시지인 경우 오른쪽 정렬
        messageDirection = 'message-right';
    }
   
    let str = ''
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