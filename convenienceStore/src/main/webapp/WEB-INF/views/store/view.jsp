<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<style>
	main > div {
		width: 900px;
		margin: 30px auto;
		position: relative;
	}
	#map {
		height: 400px;
		background-color: #eee;
		text-align: center;
	}
	.storeName > div > h1 {
		margin: 15px auto;
		margin-bottom: 0;
	}
	.avgScore {user-select: none;}
	.avgScore > span {
		color: lightgrey;
		font-size: 20px;
	}
	.avgScore > div {
		text-align: center;
		margin: auto 2px;
		margin-top: 5px;
		width: 50px;
		text-align: 16px;
	}
	.star {
		color: red;
	}
	
	.like {
		margin: auto 20px;
		margin-top: 15px;
	}
	.like > p{
		margin: 0;
		margin-bottom: 10px;
		width: 50px;
		height: 50px;
		padding: 0;
		text-align: center;
		line-height: 48px;
		font-size: 38px;
		background-color: #ffbfcb;
		border-radius: 45px;
		transition-duration: 0.2s;
	}
	.like > .red {
		color: #fc4c6c;
	}
	.like > .white {
		color: white;
	}
	.like > p:hover {
		cursor: pointer;
		font-size: 46px;
		transition-duration: 0.3s;
	}
	.storeName,
	.address {
		margin: 40px auto;
	}
	.order {
		text-align: center;
	}
	#orderBtn {
		width: 400px;
		padding: 15px;
		background-color: #eee;
		font-size: 25px;
		font-weight: bold;
		border: 1px solid grey;
		border-radius: 10px;
	}
	#orderBtn:hover {
		cursor: pointer;
		background-color: rgba(142, 178, 232, 0.2);
	}
	.review {
		margin: 50px auto;
		margin-top: 100px;
	}
	.review > h2 {
		color: #3b3b3b;
	}
	#score {
		margin: 0 auto 15px auto;
		text-align: center;
		height: 55px;
	}
	.review-modify > div > span,
	#score > span {
		color: lightgrey;
		font-size: 50px;
		text-align: center;
		line-height: 55px;
	}
	.review-modify > div:first-child > div,
	#score > div {
		font-size: 20px;
		line-height: 50px;
		text-align: center;
		padding-top: 10px;
		margin: auto 10px;
	}
	.review-modify > div > textarea,
	.review-write > textarea {
		width: 900px;
		resize: none;
		border: none;
		border-bottom: 1px solid lightgrey;
		padding: 10px 5px;
		font-size: 19px;
	}
	.review-modify > div > textarea,
	.review-write > textarea:focus {
		outline: none;
		border-bottom: 1px solid lightgrey;
	}
	.review-write > p {
		text-align: center;
	}
	.review-modify > div > p > button,
	input[type="button"] {
		width: 400px;
		height: 55px;
		font-size: 22px;
		background-color: #006fba;
		color: white;
		border: none;
		border-radius: 10px;
	}
	.review-modify > div > p > button:hover,
	input[type="button"]:hover {
		background-color: #065991;
		cursor: pointer;
	}
	.reviewList {
		padding: 15px 0;
	}
	.reviewList span {
		color: black;
		font-size: 22px;
	}
	.avgScore > div {margin-top: 3px;}
	.avgScore span.red,
	.reviewList span.red {
		color: red;
	}
	.avgScore span.grey,
	.reviewList span.grey {
		color: lightgrey;
	}
	.review-modify > div > span,
	#score > span:hover {
		cursor: pointer;
	}
	.userid > span{
		font-size: 26px;
		font-weight: bold;
		margin-right: 10px;
	}
	.myReview > userid > span {
		margin: 0 10px;
	}
	.myReviewButton {
		margin-top: 20px;
	}
	.myReviewButton > button {
		width: 70px;
		font-size: 16px;
		padding: 5px;
		background-color: rgba(142, 178, 232, 0.2);
		border-radius: 10px;
		border: none;
		transition-duration: 0.1s;
	}
	.myReviewButton > button:hover {
		cursor: pointer;
		background-color: lightgrey;
		transition-duration: 0.1s;
	}
	.reviewDate {
		color: grey;
		font-size: 15px;
		margin: 5px 0;
	}
	.reviewContent {
		font-size: 23px;
	}
	.review-modify > div:first-child {
		height: 50px;
	}
	.review-modify > div > textarea {
		margin-top: 25px;
	}
	.review-modify > div > p > button,
	.review-modify > div > p > input[type="button"] {
		width: 200px;
		height: 50px;
	}
	footer {
		height: 300px;
	}
</style>
</head>
<body>

<main class="frame">
	
	<!-- 지도 표시 -->
	<div id="map"></div>
	
	<div id="thisLat" style="display: none;">${dto.lat }</div>
	<div id="thisLng" style="display: none;">${dto.lng }</div>
	<div id="thisName" style="display: none;">${dto.name }</div>
	
	
	<div class="storeName flex">
		<div>
			<h1>${dto.name }</h1>
			<!-- 매장 평균 별점 -->
			<div class="avgScore flex">
				<c:forEach var="num" begin="1" end="5">
						<span class="reviewScore ${dto.scoreAvg >= num ? 'red' : 'grey' }">★</span>
				</c:forEach>
				
				<div>
					<c:if test="${dto.scoreAvg != 0}">
						<fmt:formatNumber value="${dto.scoreAvg}" maxFractionDigits="1" minFractionDigits="1" />
					</c:if>
				</div>
			</div>
		</div>
		<!-- 매장 즐겨찾기 -->
		<c:if test="${not empty login }">
			<div class="like" index="${dto.idx }" title="즐겨찾기">
				<p class=${liked ? 'red':'white' }>♥</p>
			</div>
		</c:if>
	</div>
	<!-- 매장 상세 -->
	<div class="address">
		<h3>${dto.address }</h3>
	</div>
	<div class="order">
		<a href="${cpath }/product/storeList/${dto.idx}"><button id="orderBtn">주문하러 가기</button></a>
	</div>
	
	<!-- 편의점 리뷰 -->
	<div class="review">	
		<h2>편의점 리뷰</h2>
		<hr>
		<!-- 리뷰 작성 DIV -->
		<c:if test="${not empty login }">
			<div id="score" class="flex ${not empty myReview ? 'hidden':'' }" 
				 num="${not empty myReview ? '-1' : myReview.score }">
				<span>★</span>
				<span>★</span>
				<span>★</span>
				<span>★</span>
				<span>★</span>
				<div></div>
			</div>
			
			<div class="review-write ${not empty myReview ? 'hidden':'' }">
				<textarea rows="1" placeholder="리뷰를 작성해 주세요" required></textarea>
				<p><input type="button" value="리뷰 작성"></p>
			</div>
			
			<!-- 리뷰 수정 DIV -->
			<div class="review-modify hidden">
				<div class="flex">
					<span>★</span>
					<span>★</span>
					<span>★</span>
					<span>★</span>
					<span>★</span>
					<div></div>
				</div>
				
				<div>
					<textarea rows="1" placeholder="리뷰를 작성해 주세요">${myReview.content }</textarea>
					<p class="review-modify-realBtn">
						<input type="button" value="리뷰 수정">
						<button>리뷰 수정 취소</button>
					</p>
					
				</div>
			</div>
			
			<!-- 내가 쓴 매장 리뷰 -->
			<div id="review" class="myReview reviewList">
				<c:if test="${not empty myReview }">   
					<div class="flex">
						<div class="userid"><span>📌 ${myReview.userid }</span></div>
						
						<c:forEach var="num" begin="1" end="5">
							<span class="reviewScore ${myReview.score >= num ? 'red' : 'grey' }">★</span>
						</c:forEach>
						
					</div>
					<div class="reviewDate">
						<fmt:formatDate value="${myReview.reviewDate }" pattern="yyyy-MM-dd  HH:mm"/>
					</div>
					<div class="reviewContent">${myReview.content }</div>
					<div class="myReviewButton">
						<button class="modify">수정</button>
						<button class="delete">삭제</button>
					</div>
				</c:if>
			</div>
			<hr>
		</c:if>
		<!-- 매장 리뷰 목록 -->
		<div>
			<c:forEach var="reivewDTO" items="${reviewList }">
			<c:if test="${reivewDTO.userid != login.userid }">
				<div class="reviewList">
					<div class="flex">
						<div class="userid"><span>${reivewDTO.userid }</span></div>
						
						<c:forEach var="num" begin="1" end="5">
							<span class="reviewScore ${reivewDTO.score >= num ? 'red' : 'grey' }">★</span>
						</c:forEach>
						
					</div>
					<div class="reviewDate">
						<fmt:formatDate value="${reivewDTO.reviewDate }" pattern="yyyy-MM-dd  HH:mm"/>
					</div>
					<div class="reviewContent">${reivewDTO.content }</div>
				</div>
				<hr>
			</c:if>
			</c:forEach>
		</div>
	</div>
	
	
</main>
<footer></footer>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=29977e320f12ce1963e204057d2e6d84&libraries=services"></script>
			  
<script>
	//SQL데이터 값을 간단하게 옮긴 것들 입니다
	const thisLat = document.getElementById('thisLat').textContent
	const thisLng = document.getElementById('thisLng').textContent
	const thisName = document.getElementById('thisName').textContent
	
	var mapContainer = document.getElementById('map'),	// 지도를 표시할 div
	mapOption = {
		center: new kakao.maps.LatLng(thisLat, thisLng),	// 지도의 중심 좌표
		level: 2	// 지도의 확대 레벨
	}
	
	//지도를 생성 합니다
	var map = new kakao.maps.Map(mapContainer, mapOption)
	
	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl()
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT)
	
	//마커가 표시될 위치 입니다
	var markerPosition = new kakao.maps.LatLng(thisLat, thisLng)
	
	//마커를 생성 합니다
	var marker = new kakao.maps.Marker({
		position: markerPosition,
	});
	
	// 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합 니다
	var infowindow = new kakao.maps.InfoWindow({zindex:1})
	
	// 마커가 지도 위에 표시되도록 설정 합니다
	marker.setMap(map)
	
	// 내 위치 인포윈도우를 출력 합니다
	var content = '<div style="padding: 5px; z-index:1; text-align: center;">' + thisName + '</div>';
	infowindow.setContent(content)
	infowindow.open(map, marker)
</script>
<script>
	const likeBtn = document.querySelector('.like > p')
	const idx = document.querySelector('.like').getAttribute('index')
	const login = "${login.userid}"
	const score = document.getElementById('score')
	const stars = score.querySelectorAll('span')
	const starArr = Array.from(stars)
	const textarea = document.querySelector('.review-write > textarea')
	const reviewBtn = document.querySelector('.review-write > p > input[type="button"]')
	const myReview = document.querySelector('.myReview')
	const reviewModify = document.querySelector('.review-modify')
	const reviewModifyStars = reviewModify.querySelectorAll('div > span')
	const modifyStarArr = Array.from(reviewModifyStars)
	const reviewDeleteBtn = document.querySelector('.myReviewButton > .delete')
	const reviewModifyBtn = document.querySelector('.myReviewButton > .modify')
	const reviewModifyInput = document.querySelector('.review-modify-realBtn > input')
	const reviewModifyCancel = document.querySelector('.review-modify-realBtn > button')
	
	
	let myScore = ''
	let saveScore = ''
	
	// 로그인이 되어있지 않을 경우에는 즐겨찾기 버튼 hidden처리
	if(login == '') {
		document.querySelector('.like').classList.add('hidden')
	} else {
		document.querySelector('.like').classList.remove('hidden')
	}
	
	function myScoreToText(num) {
		let scoreText = ''
		switch(num) {
		case 1:
			scoreText='<span style="color:red; font-weight:bold;">1점</span> (최악이에요)'
			break
		case 2:
			scoreText='<span style="color:red; font-weight:bold;">2점</span> (아쉬워요)'
			break
		case 3:
			scoreText='<span style="color:red; font-weight:bold;">3점</span> (보통이에요)'
			break
		case 4:
			scoreText='<span style="color:red; font-weight:bold;">4점</span> (좋아요)'
			break
		case 5:
			scoreText='<span style="color:red; font-weight:bold;">5점</span> (최고예요)'
			break
		}
		return scoreText
	}
	// 리뷰 수정
	async function modifyFunction(url, ob) {
		const opt = {
			method: 'PUT',
			body: JSON.stringify(ob),
			headers: {
				'Content-Type': 'application/json; charset=utf-8'
			}
		}
		const r1 = await fetch(url, opt).then(resp => resp.text())
		return r1
	}
	
	// 즐겨찾기/리뷰 추가
	async function addFunction(url, ob) {
		const opt = {
			method: 'POST',
			body: JSON.stringify(ob),
			headers: {
				'Content-Type': 'application/json; charset=utf-8'
			}
		}
		const r1 = await fetch(url, opt).then(resp => resp.text())
		return r1
	}
	
	// 즐겨찾기/리뷰 삭제
	async function deleteFunction(url, ob) {
		const opt = {
			method: 'DELETE',
			body: JSON.stringify(ob),
			headers: {
				'Content-Type': 'application/json; charset=utf-8'
			}
		}
		return await fetch(url, opt).then(resp => resp.text())
	}
	
	// 편의점 즐겨찾기 버튼 클릭했을 때
	async function likeClickHandler(event) {
		const target = event.target
		
		const url = "${cpath}/store/view/like"
		const ob = {
			userid: login,
			store_idx: idx
		}
		let result = ''
		if(target.className == 'white') {
			result = await addFunction(url, ob)
		}else {
			result = await deleteFunction(url, ob)
		}
		
		if(result == '1') {
			target.classList.toggle('white')
			target.classList.toggle('red')
		}
		
	}
	
	// 별에 마우스를 올렸을 때
	function starMouseOverHandler(event) {
		const index = starArr.indexOf(event.target)
		starArr.forEach(e => e.style.color="lightgrey")
		for(let i=0; i<=index; i++) {
			starArr[i].style.color="coral"
		} 
		score.querySelector('div').innerHTML = myScoreToText(index+1)
	}
	function ModifystarMouseOverHandler(event) {
		const index = modifyStarArr.indexOf(event.target)
		modifyStarArr.forEach(e => e.style.color="lightgre")
		for(let i=0; i<=index; i++) {
			modifyStarArr[i].style.color="coral"
			reviewModify.querySelector('div:first-child > div').innerHTML = myScoreToText(index+1)
		}
	}
	
	// 별에 마우스를 뗐을 때
	function starMouseOutHandler(event) {
		score.querySelector('div').innerText = ''
		starArr.forEach(e => e.style.color="lightgrey")
		if(myScore != '') {
			for(let i=0; i<myScore; i++) {
				starArr[i].style.color="red"
			}
			score.querySelector('div').innerHTML = myScoreToText(myScore)
		}
	}
	function ModifystarMouseOutHandler(event) {
		reviewModify.querySelector('div:first-child > div').innerHTML = ''
		modifyStarArr.forEach(e => e.style.color="lightgrey")
		if(myScore != '') {
			for(let i=0; i<myScore; i++) {
				modifyStarArr[i].style.color="red"
			}
			reviewModify.querySelector('div:first-child > div').innerHTML = myScoreToText(myScore)
		}	
	}
	
	// 별을 클릭했을 때
	function starClickHandler(event) {
		
		const index = starArr.indexOf(event.target)
		for(let i=0; i<=index; i++) {
			starArr[i].style.color="red"
		}
		myScore = index+1
	}
	function ModifystarClickHandler(event) {
		const index = modifyStarArr.indexOf(event.target)
		for(let i=0; i<=index; i++) {
			modifyStarArr[i].style.color="red"
		}
		myScore = index+1
		console.log('수정된 별점 : ' +myScore)
	}
	
	// 리뷰 작성창(textarea) 높이 조절 함수
	function textareaHeight(textarea) {
	    textarea.style.height = 'auto' // 높이를 자동으로 재조정
	    textarea.style.height = textarea.scrollHeight + 'px' // scrollHeight 값을 사용하여 새 높이 설정
	}
	textarea.addEventListener('input', function() {
		textareaHeight(this)
	})
	
	// 리뷰작성 버튼 클릭 함수
	async function reviewBtnClickHandler(event) {
		const reviewContent = textarea.value
		if(myScore == '') alert('별점을 입력해주세요')
		else if(reviewContent == '') alert('리뷰내용을 작성해주세요')
		else {
			const url = "${cpath}/store/view/review"
			const ob = {
				store_idx: idx,
				insertScore: myScore,
				content: reviewContent,
				userid: login
			}
			const result = await addFunction(url, ob)
			if(result != '0') {
				alert('리뷰가 등록되었습니다')
				location.href = "${cpath}/store/view/" + idx
			}
		}
	}
	
	async function reviewDeleteBtnClickHandler(event) {
		const deleteConfirm = confirm('정말로 삭제하시겠습니까?')
		if(deleteConfirm) {
			const url = "${cpath}/store/view/review"
			const ob = {
				userid: login,
				store_idx: idx
			}
			const result = await deleteFunction(url, ob)
			if(result != '0') {
				alert('삭제되었습니다')
				location.href = "${cpath}/store/view/" + idx
			}
		}
	}
	
	function reviewModifyBtnClickHandler(event) {
		saveScore = myScore
		myScore=''
		reviewModify.querySelector('div > textarea').innerText=''
		myReview.classList.add('hidden')
		reviewModify.classList.remove('hidden')
	}
	
	function reviewModifyCancelHandler(event) {
		myScore = saveScore
		myReview.classList.remove('hidden')
		reviewModify.classList.add('hidden')	
	}
	
	async function reviewModifyAjaxHandler(event) {
		
		const reviewContent = reviewModify.querySelector('div > textarea').value
		if(myScore == '') alert('별점을 입력해주세요')
		else if(reviewContent == '') alert('리뷰내용을 작성해주세요')
		else {
			myReview.classList.remove('hidden')
			reviewModify.classList.add('hidden')
			
			const url = "${cpath}/store/view/review"
			const ob = {
				store_idx: idx,
				insertScore: myScore,
				content: reviewContent,
				userid: login
			}
			
			const result = await modifyFunction(url, ob)
			if(result != '0') {
				alert('리뷰가 수정되었습니다')
				location.href = "${cpath}/store/view/" + idx
			}
		}
		
	}
	
	likeBtn.onclick = likeClickHandler
	starArr.forEach(star => {
		star.onmouseover = starMouseOverHandler
		star.onmouseout = starMouseOutHandler
		star.onclick = starClickHandler
	})
	reviewModifyStars.forEach(star => {
		star.onmouseover = ModifystarMouseOverHandler
		star.onmouseout = ModifystarMouseOutHandler
		star.onclick = ModifystarClickHandler
	})
	textareaHeight(textarea)
	reviewBtn.onclick = reviewBtnClickHandler
// 	reviewDeleteBtn.onclick = reviewDeleteBtnClickHandler
// 	reviewDeleteBtn.addEventListener('click', reviewDeleteBtnClickHandler)
	myReview.addEventListener('click', function(event) {
		if(event.target === reviewDeleteBtn) {reviewDeleteBtnClickHandler()}
		if(event.target === reviewModifyBtn) {reviewModifyBtnClickHandler()}
	})
	
// 	reviewModifyBtn.onclick = reviewModifyBtnClickHandler
	reviewModifyInput.onclick = reviewModifyAjaxHandler
	reviewModifyCancel.onclick = reviewModifyCancelHandler

</script>




</body>
</html>