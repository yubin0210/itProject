<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.js"></script>
<style>
/* 전체 채팅방 컨테이너 스타일링 */
#chat {
    width: 90%;
    max-width: 600px;
    margin: 20px auto;
    border: 1px solid #ddd;
    border-radius: 5px;
    overflow: hidden;
    background: #f9f9f9;
}

/* 채팅 프레임 스타일 */
.chatFrame {
    display: flex;
    flex-direction: column;
    height: 500px;
}

/* 상단 버튼 영역 */
.buttons {
    display: flex;
    justify-content: flex-end;
    padding: 10px;
    background: #f1f1f1;
}

/* 종료 및 닫기 버튼 스타일 */
.btn-exit, .btn-close {
    cursor: pointer;
    border: none;
    background: #ff4545;
    color: white;
    padding: 5px 10px;
    margin-left: 5px;
    border-radius: 5px;
}

/* 채팅 내용 영역 */
.chatArea {
    flex-grow: 1;
    padding: 15px;
    overflow-y: auto;
    background: #fff;
}

/* 입력 영역 스타일링 */
.ipt {
    display: flex;
    padding: 10px;
    background: #f1f1f1;
}

/* 입력 필드 스타일 */
.input-message {
    flex-grow: 1;
    margin-right: 10px;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

/* 전송 버튼 스타일 */
.btn-send {
    padding: 10px 20px;
    border: none;
    background: #007bff;
    color: white;
    border-radius: 5px;
    cursor: pointer;
}

/* 메시지 방향에 따른 스타일링 */
.message-left, .message-right {
    margin-bottom: 10px;
    display: flex;
    flex-direction: column;
}

.message-right {
    align-items: flex-end;
}

.message-left .content, .message-right .content {
    max-width: 60%;
    padding: 10px;
    border-radius: 12px;
    color: #333;
}

.message-left .content {
    background: #e0e0e0;
}

.message-right .content {
    background: #007bff;
    color: #fff;
}

</style>

<div class="buttons">
	<input type="button" value="상담종료" class="btn-exit">
</div>	
<div id="chat">
	<div class="chatFrame">
		<div class="chatArea"></div>
		<div class="ipt">	
			<input type="text" name="msg" class="input-message">
   			<input type="button" value="send" class="btn-send">
    	</div>	
	</div>
</div>
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
const exit = document.querySelector('.buttons > .btn-exit')
let chat_idx = null;

stomp.connect({}, onConnect)

// onclick
exit.onclick = exitChat
send.onclick = sendMsg
inputMsg.onkeyup = function(e) {
	if(e.key == 'Enter') sendMsg()
	if(e.key == 'Escape') e.target.value = ''
}
   
async function onConnect() {
	stomp.subscribe('/sendTo/' + userid)
	stomp.send('/app/enter/' + userid, {}, JSON.stringify({
		writer: username
	}))
	onInput()
}

async function onInput() {
	const ad = '${cpath}/getRoom/' + userid
	const adResult = await fetch(ad).then(resp=>resp.json())
	const arr = Array.from(adResult)
	console.log(arr)
	chat_idx = arr[0].idx
	console.log(chat_idx)
	const url = '${cpath}/getMsg/' + chat_idx
	const result = await fetch(url).then(resp=>resp.json())
	console.log(result)
	const arr2 = Array.from(result)
	if(arr2.length != 0) {
		arr2.forEach(e => {
		let messageDirection = 'message-left'; // 기본적으로 왼쪽 정렬
       	if(e.writer != 'admin') { // 현재 사용자가 보낸 메시지인 경우 오른쪽 정렬
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
	stomp.send('/app/sendTo/' + userid, {}, JSON.stringify({
		content: text,
		writer: username
	}))
}

async function exitChat() {
	 const url = '${cpath}/exitChat';
	 try {
	     await fetch(url).then(resp => resp.text());
	     
	     stomp.send('/app/disconnect', {}, JSON.stringify({
	         writer: username,
	     }));
	     stomp.disconnect(function() {
	         console.log('Disconnected');
	     });
	     
	     window.location.href = '${cpath}/inquiry/list';
	 } catch (error) {
	     console.error('에러:', error);
	 }
}


function onReceive(chat) {
    const chatContent = JSON.parse(chat.body)
    const text = chatContent.content
    const from = chatContent.writer
   	let messageDirection = 'message-left'; // 기본적으로 왼쪽 정렬
 	if (from === username) { // 현재 사용자가 보낸 메시지인 경우 오른쪽 정렬
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