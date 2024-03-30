<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	main {position: relative;}
	main > div {
		width: 900px;
		margin: 30px auto;
	}
	
	.product-main-img {
		width: 400px;
		height: 400px;
		overflow: hidden;
		text-align: center;
		margin: 10px;
	}
	.product-main-img > img {
		width: 100%;
		height: 100%;
		object-fit: contain;
	}
	.product-main-like {margin: 10px;}
	.product-main-like > div {
		text-align: center;
		line-height: 30px;
	}
	.product-main-like > div:first-child {
		margin-right: 15px; 
		font-size: 15px;
		padding-top: 3px;
		font-weight: bold;
	}
	.product-main-like > div:nth-child(2) {
		margin: 0;
		width: 30px;
		height: 30px;
		padding: 0;
		font-size: 28px;
		transition-duration: 0.2s;
	}
	.product-main-like > div:nth-child(3) {margin-left: 5px;}
	.product-main-like > .red {
		color: #fc4c6c;
	}
	.product-main-like > .grey {
		color: lightgrey;
	}
	.product-main-like > div:nth-child(2):hover {
		cursor: pointer;
		font-size: 32px;
		transition-duration: 0.1s;
	}
	.product-main-name {
		font-size: 30px;
		font-weight: bold;
		margin: 30px 10px 8px 10px;
	}
	.product-main-event {
		font-size: 18px;
		font-weight: bold;
		margin: 0 13px;
	}
	.product-main-event > span {
		font-size: 25px;
	}
	span.red {color: red;}
	span.grey {color: lightgrey;}
	
	.product-main-price {
		margin: 20px 10px;
		font-size: 30px;
		font-weight: bold;
	}
	.product-main-content {
		margin: 20px 10px;
		width: 350px;
	}
	.review {
		height: 250px;
		background-color: #f5f5f5;
		border-radius: 10px;
	}
	.review-main1 {
		flex-direction: column;
		justify-content: center;
		align-items: center;
		flex: 1;
	}
	.review-main2 {
		padding: 20px;
		flex: 2;
	}
	.review-main2 > div:first-child {
		width: 600px;
		padding: 10px;
		margin: 5px;
		background-color: white;
		border-radius: 10px;
		align-items: center;
	}
	.review-myReview + div,
	.review-myReview > div {margin: 0 3px; text-align: center; line-height: 18px;}
	.myReview-title {
		font-size: 17px;
		font-weight: bold;
		padding-top: 3px;
	}
	.myReview-score {margin-right: 5px;}
	.myReview-score > span {
		font-size: 17px;
	}
	.myReview-reviewDate {font-size: 12px; color: grey;}
	.review-avgStar,
	.review-avgScore {
		user-select: none;
	}
	.review-avgStar > span {
		font-size: 30px;
	}
	.review-avgScore {
		font-size: 25px;
		font-weight: bold;
		text-align: center;
	}
	.reviewBtn {
		margin: 20px auto 0 auto;
	}
	.reviewBtn > button {
		width: 200px;
		height: 40px;
		border: none;
		border-radius: 5px;
		background-color: #006fba;
		color: #eee;
		padding: 5px;
		font-size: 18px;
	}
	.reviewBtn > button:hover {
		cursor: pointer;
		background-color: #5497c4;
	}
	span.starRed {color: red;}
	span.starGrey {color: lightgrey;}
	#reviewTable {
		border-collapse: collapse;
		width: 600px;
		margin: auto;
	}
	#reviewTable tbody > tr {
		border-bottom: 1px solid rgba(128, 128, 128, 0.3);
	}
	#reviewTable tr > td {
		padding: 5px;
	}
	#reviewTable tr > td:nth-child(4) {
		text-align: right;
		font-size: 12px;
	}
	#paging {
		margin-top: 15px;
		justify-content: center;
	}
	#paging > div {
		margin: 0 5px;
		font-size: 14px;
		color: grey;
	}
	#paging > div:hover {
		cursor: pointer;
		color: black;
	}
	#map {
		width: 350px;
		height: 400px;
		background-color: lightgrey;
		position: sticky;
		top: 20px;
	}
	.store-list > h3 {margin-top: 0;}
	#store-list-table {
		width: 510px;
		border-collapse: collapse;
	}
	#store-list-table tr {
		transition-duration: 0.2s;
	}
	#store-list-table td {
		font-size: 14px;
		padding: 10px;
		border-bottom: 1px solid #c4c4c4;
	}
	#store-list-table tr > td:nth-child(2) {font-size: 12px;}
	#store-list-table tr:last-child td {
		border-bottom: none;
	}
	#store-list-table tr:hover {
		background-color: #eee;
		cursor: pointer;
		transition-duration: 0.2s;
	}
	#store-list-table td > a > button {
		border: none;
		border-radius: 5px;
		background-color: #dadada;
		font-size: 12px;
		padding: 4px 7px;
		transition-duration: 0.1s;
	}
	#store-list-table td > a > button:hover {
		cursor: pointer;
		background-color: #698bd1;
		color: #eee;
		transition-duration: 0.1s;
	}
	#review-modal {
		position: fixed;
		width: 600px;
		height: 450px;
		border-radius: 10px;
		background-color: white;
		top: 50%;
		left: 50%;
		padding: 10px 20px;
		transform: translate(-50%, -50%);
		z-index: 10;
	}
	
	#review-modal > div {
		margin: 10px auto;
		text-align: center;
	}
	#overlay {
		margin: 0;
		z-index: 5;
		position: fixed;
		top: 0;
	  	left: 0;
	  	width: 100vw; 
	  	height: 100vh;
	  	background-color: rgba(50, 50, 50, 0.2);
	}
	#score {
 		margin: auto;
		height: 90px;
	}
	#score > span {
		color: lightgrey;
		font-size: 50px;
		text-align: center;
		line-height: 55px;
	}
	#score > span:hover {
		cursor: pointer;
	}
	#score > div {
		margin: 10px auto;
	}
	.review-write > textarea {
		resize: none;
		border: 1px solid grey;
		border-radius: 5px;
		padding: 18px;
		font-size: 20px;
		width: 500px;
		height: 70px;
	}
	.review-write > textarea:focus {
		outline: none;
	}
	.review-write input[type="button"],
	.cancel > button {
		width: 350px;
		height: 45px;
		font-size: 20px;
		border: none;
		background-color: #006fba;
		color: white;
		border-radius: 10px;
	}
	.review-write input[type="button"]:hover,
	.cancel > button:hover {
		background-color: #065991;
		cursor: pointer;
	}
	.moreBtn {
		text-align: center;
		margin: 15px auto;
	}
	#loadMore {
		width: 80px;
		border: none;
		font-size: 17px;
		padding: 7px;
		background-color: #eee;
		border-radius: 10px;
	}
	#loadMore:hover {
		cursor: pointer;
		background-color: rgba(142, 178, 232, 0.2);
	}
	
	footer {
		height: 300px;
	}
	
</style>
</head>
<body>

<main class="frame">

	<!-- 상품 상세 정보 -->
	<div class="product" index="${productDTO.idx }">
		<div class="flex">
			<div class="product-main1">
				<div class="product-main-img"><img src="${productDTO.image }"></div>
			</div>
			<div class="product-main2">
				<div class="flex">
					<div class="product-main-name">${productDTO.name }</div>
				</div>
				<div class="product-main-event">
					<span class="${productDTO.event == '행사없음' ? 'grey': 'red'}">[${productDTO.event}]</span> ${productDTO.event == '행사없음' ? '': ' 행사중'}
				</div>
				<div class="product-main-price">${productDTO.price }원</div>
				<div class="product-main-like flex" title="좋아요">
						<div>상품 찜</div>
					<c:if test="${not empty login }">
						<div class="product-main-likeBtn ${liked ? 'red':'grey' }">♥</div>
					</c:if>
					<c:if test="${empty login }">
						<div title="로그인 후 이용 가능합니다">♥</div>
					</c:if>
						<div>( <span class="product-main-likeCount">${productDTO.likeCount }</span> )</div>
				</div>
				<div class="product-main-content">${productDTO.content }</div>
			</div>
		</div>
	</div>
	
	
	<!-- 상품 리뷰 -->
	<div class="review flex">
		<div class="review-main1 flex">
			<!-- 상품 평균 별점 -->
			<div class="review-avgStar flex">
				<c:forEach var="num" begin="1" end="5">
						<span class="${productDTO.scoreAvg >= num ? 'starRed' : 'starGrey' }">★</span>
				</c:forEach>
			</div>
			<div class="review-avgScore">
				<c:if test="${productDTO.scoreAvg != 0}">
					<fmt:formatNumber value="${productDTO.scoreAvg}" maxFractionDigits="1" minFractionDigits="1" /> 점
				</c:if>
			</div>
			<div class="reviewBtn">
			<c:if test="${not empty login }">
				<button class="${empty myReview ? '' : 'hidden'}">상품 리뷰 남기기</button>
				<button class="${not empty myReview ? '' : 'hidden'}">리뷰 삭제</button>
			</c:if>
			</div>
		</div>
		
		<div class="review-main2">
			<div class="flex sb">
				
				<!-- 나의 리뷰 -->
				<c:if test="${not empty login && not empty myReview }">
				<div class="review-myReview flex">
					<div class="myReview-title">나의 리뷰 </div>
					<div class="myReview-score">💡
						<c:forEach var="num" begin="1" end="5"><span class="${myReview.score >= num ? 'starRed' : 'starGrey' }">★</span></c:forEach>
					</div>
					
					<div class="myReview-content">${myReview.content }</div>
				</div>
				<div class="myReview-reviewDate">
					<fmt:formatDate value="${myReview.reviewDate }" pattern="yyyy.MM.dd"/>
				</div>
				</c:if>
				<c:if test="${empty login || empty myReview }">
					<div style="font-weight: bold;">리뷰를 등록해주세요 ^__^</div>
				</c:if>
			</div>
			
			<!-- 다른사람의 리뷰 -->
			<table id="reviewTable"></table>
			<div id="paging" class="flex"></div>
			
		</div>
	</div>
	
	
	<!-- 상품의 재고가 있는 편의점 목록 -->
	<div class="store flex sb">
	
		<div id="map"></div>
		
		<div id="thisLat" style="display: none;">${mylocDTO.lat }</div>
		<div id="thisLng" style="display: none;">${mylocDTO.lng }</div>
		
		<div class="store-list">
			<c:if test="${not empty login }">
				<h3>구매 가능한 가까운 매장</h3>
			</c:if>
			<c:if test="${empty login }">
				<h3>구매 가능한 매장</h3>
				<button class="loginLink">가까운 순으로 보기</button>
			</c:if>
			<hr>
			
			<table id="store-list-table"></table>
			
			<div class="moreBtn"><button id="loadMore">더보기</button></div>
		</div>
	</div>
	
	<div id="overlay" class="hidden"></div>
	<div id="review-modal" class="hidden">
		<div><h2>상품 리뷰 작성</h2></div>
		<hr>
		<div id="score">
			<span>★</span>
			<span>★</span>
			<span>★</span>
			<span>★</span>
			<span>★</span>
			<div></div>
		</div>
		
		<div class="review-write">
			<textarea rows="10" cols="80" placeholder="리뷰를 작성해 주세요"></textarea>
			<p><input type="button" value="리뷰 작성"></p>
		</div>
		
		<div class="cancel"><button>닫기</button></div>
	</div>
	
</main>
<footer></footer>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=29977e320f12ce1963e204057d2e6d84&libraries=services"></script>
<script>
	const login = "${login.userid}"
	const productIdx = document.querySelector('.product').getAttribute('index')
	console.log(productIdx)

	const likeBtn = document.querySelector('.product-main-likeBtn')
// 	const storeTable = document.getElementById('store-list-table')
	
	// 모달관련
	const modal = document.getElementById('review-modal')
	const overlay = document.getElementById('overlay')
	
	// 별점
	const score = document.getElementById('score')
	const stars = score.querySelectorAll('span')
	const starArr = Array.from(stars)
	let myScore = ''
	
	// 리뷰
	const reviewBtn = document.querySelector('.review-write > p > input[type="button"]')
	
	
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
	
	// 리뷰 목록 받아오는 함수
	async function selectReviewFunction() {
		const url = "${cpath}/product/view/review/" + productIdx
		let result = await fetch(url).then(resp => resp.json())
		result = result.filter(dto => dto.userid !== login)			
		return result
	}
	
	// 추가 함수
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
	
	// 삭제 함수
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
	
	// 상품 찜 버튼 클릭했을 때
	async function likeClickHandler(event) {
		
		const likeAllCount = +document.querySelector('.product-main-likeCount').innerText
		const url = "${cpath}/product/view/like"
		const ob = {
			userid: login,
			product_idx: productIdx
		}
		let result = ''
		if(event.target.classList.contains('grey')) {
			result = await addFunction(url, ob)
		}else {
			result = await deleteFunction(url, ob)
		}
		if(result != '0') {
			if(event.target.classList.contains('grey')) {
				document.querySelector('.product-main-likeCount').innerText=likeAllCount+1
			}else {
				document.querySelector('.product-main-likeCount').innerText=likeAllCount-1
			}
			event.target.classList.toggle('grey')
			event.target.classList.toggle('red')
			
		}
	}
	
	// 모달 닫기
	function modalCancelClickHandler() {
		modal.classList.add('hidden')
		overlay.classList.add('hidden')
	}
	// 모달 열기
	function reviewModalClickHandler() {
		modal.classList.remove('hidden')
		overlay.classList.remove('hidden')
	}
	
	// 별에 마우스 올렸을 때
	function starMouseOverHandler(event) {
		const index = starArr.indexOf(event.target)
		starArr.forEach(e => e.style.color="lightgrey")
		for(let i=0; i<=index; i++) {
			starArr[i].style.color="coral"
		}
		score.querySelector('div').innerHTML = myScoreToText(index+1)
	}
	// 별에 마우스 뗐을 때
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
	// 별을 클릭했을 때
	function starClickHandler(event) {
		const index = starArr.indexOf(event.target)
		for(let i=0; i<=index; i++) {
			starArr[i].style.color="red"
		}
		myScore = index+1
	}
	
	// 리뷰작성 버튼 클릭 함수
	async function reviewBtnClickHandler(event) {
		const reviewContent = document.querySelector('.review-write > textarea').value
		if(myScore == '') alert('별점을 입력해주세요')
		else if(reviewContent == '') alert('리뷰내용을 작성해주세요')
		else {
			const url = "${cpath}/product/view/review"
			const ob = {
				product_idx: productIdx,
				insertScore: myScore,
				content: reviewContent,
				userid: login
			}
			const result = await addFunction(url, ob)
			if(result != '0') {
				alert('리뷰가 등록되었습니다')
				location.href = "${cpath}/product/view/" + productIdx
			}
		}
	}
	// 리뷰삭제
	async function reviewDeleteBtnClickHandler() {
		const url = "${cpath}/product/view/review"
		const ob = {
			product_idx: productIdx,
			userid: login
		}
		const result = await deleteFunction(url, ob)
		if(result != '0') {
			alert('리뷰가 삭제되었습니다')
			location.href = "${cpath}/product/view/" + productIdx
		}
	}
	
	function getTime(inputDate) {
		const date = new Date(inputDate)
		const yyyy = date.getFullYear()
		let MM = date.getMonth() + 1
		let dd = date.getDate()
		
		MM = MM < 10 ? '0' + MM : MM
		dd = dd < 10 ? '0' + dd : dd
		
		return yyyy + '.' + MM + '.' + dd
	}
	
	let reviewList = {}	// 리뷰 전체 목록
	let currentPage = 1	// 현제 페이지
	const pageSize = 4	// 4개씩 한 페이지에 출력
	
	function displayReviews(pageNumber) {
		// 요청한 페이지의 데이터 목록 불러오기
		
		const pagingItem = getPagingItem(reviewList, pageNumber, pageSize)
		const reviewTable = document.getElementById('reviewTable')
		
		reviewTable.innerHTML = ''
		pagingItem.forEach(dto => {
			let reviewStar = ''
			for(let i=1; i<=5; i++) {
				if(dto.score>=i) {
					reviewStar += '<span class="starRed">★</span>'
				}else {
					reviewStar += '<span class="starGrey">★</span>'
				} 
			}
			const date = getTime(dto.reviewDate)
			
			let tag = ''
			tag += `<tr>`
			tag += `	<td>\${dto.userid}</td>`
			tag += '	<td>'+ reviewStar +'</td>'
			tag += `	<td>\${dto.content}</td>`
			tag += '	<td>'+ date + '</td>'
			tag += `</tr>`
			reviewTable.innerHTML += tag
		})
		
	}
	
	function getPagingItem(items, pageNumber, pageSize) {
		// 시작 인덱스
		const startIndex = (pageNumber - 1) * pageSize
		// 시작부터 pageSize만큼 잘라서 반환
		return items.slice(startIndex, startIndex+pageSize)
	}
	
	async function load() {
		const pagingDiv = document.getElementById('paging')
		
		reviewList = await selectReviewFunction()
 		reviewList.forEach(dto => console.log(dto)) // 매우 잘 출력
		reviewSize = Math.ceil((reviewList.length)/pageSize)
		// Math.ceil : 값 올림
		
		pagingDiv.innerHTML = ''
		
		for(let i=1; i<= reviewSize; i++) {
			const btn = document.createElement('div')
			let tag = '[' + i + ']'
			btn.innerText = tag
			btn.addEventListener('click', function(event) {
				currentPage = i
				displayReviews(i)
			})
			pagingDiv.appendChild(btn)
		}
		displayReviews(currentPage)
	}
	
	
	
	if(login != '') {
		likeBtn.addEventListener('click', likeClickHandler)
		document.querySelector('.reviewBtn > button:first-child').addEventListener('click', reviewModalClickHandler)
		reviewBtn.addEventListener('click', reviewBtnClickHandler)
		document.querySelector('.reviewBtn > button:nth-child(2)').addEventListener('click', reviewDeleteBtnClickHandler)
	}
	
	// 모달
	document.querySelector('.cancel > button').addEventListener('click', modalCancelClickHandler)
	overlay.addEventListener('click', modalCancelClickHandler)
	
	// 별점
	starArr.forEach(star => {
		star.onmouseover = starMouseOverHandler
		star.onmouseout = starMouseOutHandler
		star.onclick = starClickHandler
	})
	
	
	if(login == '') {
		document.querySelector('.store-list > button.loginLink').addEventListener('click', function(event){
			const loginLink = confirm('로그인 및 현재 위치 설정 후 가능합니다. 이동하시겠습니까?')
			if(loginLink) {
				location.href = "${cpath}/member/login"
			}
		})
	}
	
// 	

	
	//SQL데이터 값을 간단하게 옮긴 것들 입니다
	// 현재 나의 위치 위도, 경도
	const thisLat = document.getElementById('thisLat').textContent
	const thisLng = document.getElementById('thisLng').textContent
	
	// storeList관련
	const moreBtn = document.getElementById('loadMore')
	const storeTable = document.getElementById('store-list-table')
	
	var mapContainer = document.getElementById('map'),	// 지도를 표시할 div
	mapOption = {
		center: new kakao.maps.LatLng(thisLat, thisLng),	// 지도의 중심 좌표
		level: 6	// 지도의 확대 레벨
	};

	// 지도를 생성 합니다
	var map = new kakao.maps.Map(mapContainer, mapOption)
	
	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new kakao.maps.MapTypeControl()
	
	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT)

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl()
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT)
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder()
	
	// 마커가 표시될 위치 입니다
	var markerPosition = new kakao.maps.LatLng(thisLat, thisLng)
	
	// 편의점들의 마커와 차별화를 위한 다른 마커 이미지 입니다.
	var icon = new kakao.maps.MarkerImage(
		'https://i1.daumcdn.net/dmaps/apis/n_local_blit_04.png',
		new kakao.maps.Size(31, 35),
	    	{
	        	shape: 'poly',
	            coords: '16,0,20,2,24,6,26,10,26,16,23,22,17,25,14,35,13,35,9,25,6,24,2,20,0,16,0,10,2,6,6,2,10,0'        
	        })
	
	// 마커를 생성 합니다
	var thisMarker = new kakao.maps.Marker({
		position: markerPosition,
		image: icon
	})
	
	// 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합 니다
	var infowindow = new kakao.maps.InfoWindow({zindex:1})
	var thisInfowindow = new kakao.maps.InfoWindow({zindex:1})
	
	// 마커가 지도 위에 표시되도록 설정 합니다
	thisMarker.setMap(map)
	
	// 내 위치 인포윈도우를 출력 합니다
	var content = '<div style="padding: 5px; z-index:1; text-align: center;">현재 내가 있는 위치</div>';
	
	// mouseover, out 시 인포 윈도우를 출력
   	(function(thisMarker, content) {
		kakao.maps.event.addListener(thisMarker, 'mouseover', function() {
			thisInfowindow.setContent(content)
			thisInfowindow.open(map, thisMarker)
		})
				
		kakao.maps.event.addListener(thisMarker, 'mouseout', function() {
			thisInfowindow.close()
		})
				
	})(thisMarker, content)
	
	// store데이터를 반환하는 함수
	async function fetchResult() {
		// 로그인 되어있으면 거리순 정렬 로그인 되어있지 않을 때에는 idx 정렬 목록 출력
		const url = "${cpath}/product/storeList/myLoc" + productIdx
		const data = await fetch(url).then(resp => resp.json())
		return data
	}
	
	let currentData = []	// 현재 데이터 전체 목록
	const increment = 5		// 한 번에 표시할 데이터의 수 (5개씩 표시)
	let displayCount = 0	// 지금까지 화면에 출력된 목록 수
	
	// json을 받아서 페이지에 검색 결과를 출력하는 함수
 	function displaySearchResult(data, append = false) {
    if (!append) {
        storeTable.innerHTML = '' // 새로 데이터를 표시할 때 기존 내용을 지웁니다.
    }
    data.forEach((item, i) => {
    	const url = "${cpath}/store/view/" + item.idx;
    	const placeName = item.name;
    	const placePosition = new kakao.maps.LatLng(item.lat, item.lng);
    	marker = addMarker(placePosition, placeName); // 마커를 지도에 표시합니다.
    	itemEl = getListItem(i, item, marker);

        storeTable.appendChild(itemEl); // 새로운 데이터 행을 테이블에 추가합니다.
    })
}	
	
	// 초기에 데이터를 보여주는 함수 (5개 출력)
	function displayInitialData(data) {
		currentData = data
		storeTable.innerHTML = ''
		if(currentData.length <= increment) {
			moreBtn.classList.add('hidden')
		}
		const initData = data.slice(0, increment)
		displaySearchResult(initData)
		displayCount = increment
	}
	// 더보기 클릭 이벤트 함수
	function loadMoreData(event) {
	    if (displayCount >= currentData.length) {
	        moreBtn.classList.add('hidden'); // 더 이상 표시할 데이터가 없으면 더보기 버튼을 숨깁니다.
	        return
	    }
	    const nextData = currentData.slice(displayCount, displayCount + increment) // 다음에 표시할 데이터를 가져옵니다.
	    displaySearchResult(nextData, true) // 새로운 데이터를 테이블에 추가합니다.
	    displayCount += increment // 표시된 데이터의 개수를 업데이트합니다.
	
	    if (displayCount >= currentData.length) {
	        moreBtn.classList.add('hidden') // 모든 데이터를 표시한 후 더보기 버튼을 숨깁니다.
	    }
	}
	
	// 데이터를 가져와서 처리하는 함수
	async function fecthData() {
	    try {
	    	
// 	    	const url = "${cpath}/product/storeList/myLoc/" + productIDX
	        const response = await fetch('${cpath}/product/storeList/myLoc/' + document.querySelector('.product').getAttribute('index'))
	        const data = await response.json()
	        currentData = data // 전체 데이터를 currentData 배열에 저장합니다.
	        
	        displayInitialData(currentData) // 처음 5개의 데이터를 화면에 표시합니다.
	    } catch (error) {
	        console.error('Error:', error)
	    }
	}
	
	function displayPlaces(data) {}
	
	// 마커를 생성하고 지도 위에 마커를 표시 하는 함수
	function addMarker(placePosition, placeName) {
		
		var marker = new kakao.maps.Marker({
			position: placePosition
		})
		// 마커에 클릭이벤트를 등록합니다
		kakao.maps.event.addListener(marker, 'click', function() {
	      // 마커를 클릭 하면 확대 수준을 변경 후 중심을 이동 시킵니다
		     map.setLevel(2)
		     map.panTo(placePosition)
		})
		
		kakao.maps.event.addListener(marker, 'mouseover', function() {
			infowindow.setContent(placeName)
			infowindow.open(map, marker)
		});
		
		kakao.maps.event.addListener(marker, 'mouseout', function() {
			infowindow.close()
		});
		
		marker.setMap(map)
		
		return marker;
	}
	
	function getListItem(index, data, marker) {
		var url = "${cpath}/store/view/"
		var el = document.createElement('tr'),
			itemStr = '<td>' + data.name + '</td>' +
					  '<td>' + data.address + '</td>' +
					  '<td><a href="'+ url + data.idx + '"><button>이동</button></a></td>'
		
		var placePosition = new kakao.maps.LatLng(data.lat, data.lng)
		
		el.innerHTML = itemStr
		
		// 각 필드를 클릭하면 맵의 해당 부분으로 중심 이동 하는 기능 입니다
		
		el.addEventListener('click', function(event) {
	        // '이동' 버튼 클릭 시 이벤트가 테이블 행 클릭 이벤트로 전파되지 않도록 합니다.
	        if (event.target.tagName === 'BUTTON' || event.target.tagName ==='A') {
        		return // '이동' 링크 또는 버튼 클릭 시 추가 작업을 수행하지 않습니다.
    		}
	        infowindow.close()
	        map.setLevel(2)
	        map.panTo(new kakao.maps.LatLng(data.lat, data.lng))
	        infowindow.setContent(data.name)
	        infowindow.open(map, marker)
	    })
	    return el
	}
	
	moreBtn.addEventListener('click', loadMoreData)
	window.addEventListener('DOMContentLoaded', function(event) {
		
		load()
		fecthData()
	})
	
</script>

</body>
</html>