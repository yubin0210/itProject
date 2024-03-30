<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.js"></script>  

<style>
.hidden {
	display: none;
}

.chatList {
    position: fixed;
    bottom: 60px; /* Adjust based on the chat frame's position */
    left: 10px;
    width: 200px; /* Adjust width as needed */
    max-height: 300px; /* Adjust height as needed */
    overflow-y: auto; /* Allows scrolling if there are many chat rooms */
    border: 1px solid #ccc;
    background-color: #FFF;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    border-radius: 5px;
    padding: 10px;
}

.chatRoom {
    background-color: #EFEFEF; /* Light grey to distinguish chat rooms */
    color: #333; /* Dark text for contrast */
    padding: 8px 12px;
    margin: 5px 0;
    border-radius: 15px;
    cursor: pointer;
    transition: background-color 0.3s, transform 0.2s;
}

.chatRoom:hover {
    background-color: #DDD; /* Slightly darker on hover */
    transform: scale(1.05); /* Slightly enlarge on hover */
}

.chatRoom:last-child {
    margin-bottom: 0; /* Remove margin from the last item */
}

/* Scrollbar Styles for chatList */
.chatList::-webkit-scrollbar {
    width: 8px;
}

.chatList::-webkit-scrollbar-track {
    background: #f1f1f1; 
}

.chatList::-webkit-scrollbar-thumb {
    background: #888; 
}

.chatList::-webkit-scrollbar-thumb:hover {
    background: #555; 
}

#chat {
    position: fixed;
    bottom: 10px;
    right: 10px;
    margin: 0;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
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
<div class="chatList">
</div>
<div id="chat">
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

const cpath = '${cpath}'
const username = '${login.nickname}'
const listFrame = document.querySelector('.chatList')
const chatArea = document.querySelector('.chatArea')
const chatFrame = document.querySelector('.chatFrame')
const send = document.querySelector('.btn-send')
const inputMsg = document.querySelector('.input-message')
const exit = document.querySelector('.btn-exit')
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

exit.onclick = onDisconnect
send.onclick = sendMsg
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
		let messageDirection = 'message-left'; // 기본적으로 왼쪽 정렬
       	if(userid == 'admin') { // 현재 사용자가 보낸 메시지인 경우 오른쪽 정렬
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
				writer: '관리자',
				content: text
			}),
			headers: {
				'Content-Type' : 'application/json; charset=utf-8'
			}
	}
	const result = await fetch(url,opt).then(resp=>resp.text())
	if(userid != ''){
		stomp.send('/app/sendMsg/' + userid, {}, JSON.stringify({
			content: text,
			writer: username
		}))
	}
}

function onReceive(chat) {
    const chatContent = JSON.parse(chat.body)
    const text = chatContent.content
    const from = chatContent.writer
	let messageDirection = 'message-left'; // 기본적으로 왼쪽 정렬
    if(from == username) { // 현재 사용자가 보낸 메시지인 경우 오른쪽 정렬
        messageDirection = 'message-right';
    }
    if(from == 'service') {
    	messageDirection = 'message-center'
    }
    let str = ''
    	str += '<div class="' + messageDirection + '">'
    	str += '<div>' + from + '</div>'
    	str += '<div class="content">' + text + '</div>'
    	str += '</div>'
	chatArea.innerHTML += str
   	chatArea.scrollTop = chatArea.scrollHeight;
   	
}

async function onDisconnect(event) {
		const url = '${cpath}/disconnect/' + userid
		const result = await fetch(url).then(resp=>resp.text())
		
	event.preventDefault()
	stomp.send('/app/disconnect/sendTo/' + userid, {}, JSON.stringify({
		userid: userid,
		writer: username,
	}))
	stomp.disconnect(function(){
		console.log('Disconnected')
	})
	chatFrame.classList.add('hidden')
	chatFrame.classList.remove('visible')
	chatIcon.classList.remove('hidden')
}

</script>


</body>
</html>