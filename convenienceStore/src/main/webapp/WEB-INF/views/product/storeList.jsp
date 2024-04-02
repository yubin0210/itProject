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
		width: 800px;
		margin: 50px auto;
	}
	.hidden {
		display: none !important;
	}
	.store_name {
		font-size: 40px;
	}
	.searchTitle > div > h1 > a {
		border: 1px solid grey;
		border-radius: 5px;
		background-color: #eee;
		padding: 10px;
	}
	.searchTitle > div > h1 > a:hover {
		cursor: pointer;
		text-decoration: none;
		background: #dadada;
	}
	.wrap {
		flex-wrap: wrap;
	}
	.search {
		align-items: center;
		justify-content: center;
	}
	#searchForm > input[type="search"] {
		width: 450px;
		height: 60px;
		color: grey;
		padding: 8px;
		font-size: 20px;
		border: 1px solid grey;
		border-radius: 5px;
	}
	#searchForm > input[type="submit"] {
		width: 80px;
		margin: 0 10px;
		margin-right: 0;
		font-size: 20px;
		font-weight: bold;
		color: #006fba;
		border: 1px solid #698bd1;
		border-radius: 5px;
		background-color: rgba(142, 178, 232, 0.2);
		transition-duration: 0.2s;
	}
	#searchForm > input[type="submit"]:hover {
		cursor: pointer;
		color: white;
		background-color: #006fba;
		transition-duration: 0.2s;
	}
	.category > ul {
		margin: 40px auto;
	}
	.category > ul > li {
		list-style: none;
		height: 40px;
		border: 1px solid white;
		text-align: center;
		line-height: 40px;
		font-size: 23px;
		font-weight: bold;
		transition-duration: 0.2s;
		padding: 2px 20px;
		margin-top: 5px
	}
	.category > ul > li:hover {
		cursor: pointer;
		border: 1px solid #698bd1;
		border-radius: 5px;
		background-color: rgba(142, 178, 232, 0.2);
		transition-duration: 0.2s;
	}
	.product-list {
		margin-bottom: 10px;
	}
	.product-list > .item {
		width: 190px;
		height: 280px;
		/* border: 1px solid #eee; */
		margin: 5px;
		position: relative;
		display: inline-block;
	}
	.product-list > .item:first-child,
	.product-list > .item:nth-child(4n+1) { margin-left: 0; }
	.product-list > .item:nth-child(4n) { margin-right: 0; }
	.product-list > .item::after {
		content: "";
		position: absolute;
		top: 0;
		left: 0;
		right: 0;
		bottom: 0;
		background-color: rgba(142, 178, 232, 0.2);
		opacity: 0;
		border-radius: 5px;
		transition-duration: 0.1s;
	}
	.product-list > .item:hover::after {
		cursor: pointer;
		opacity: 1;
	}
	.product-list-image {
		width: 190px;
		height: 193px;
		text-align: center;
	}
	.product-list-image > img {
		width: 100%;
		height: 100%;
		object-fit: contain;
	}
	.product-list-name {
		font-size: 15px;
		text-align: center;
	}
	.product-list-price {
		font-size: 20px;
		text-align: center;
		font-weight: bold;
		margin: 3px 0;
	}
	.product-list-event {
		width: 60px;
		height: 60px;
	}
	.event-text {
		position: absolute;
		top: 10px;
		left: 10px;
		background-color: #e84735;
		color: white;
		border: none;
		border-radius: 40px;
		font-weight: bold;
		font-size: 22px;
		text-align: center;
		line-height: 55px;
	}
	.moreBtn {
		text-align: center;
		margin: 0 auto;
	}
	#loadMore {
		width: 100px;
		border: none;
		font-size: 25px;
		padding: 10px;
		background-color: #eee;
		border-radius: 20px;
	}
	#loadMore:hover {
		cursor: pointer;
		background-color: rgba(142, 178, 232, 0.2);
	}
	#modal {
		position: fixed;
		width: 750px;
		height: 550px;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		border: 1px solid #eee;
		border-radius: 20px;
		/* background-color: rgba(280, 280, 280, 0.9); */
		background-color: white;
		
		z-index: 10;
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
	.modal-img {
		margin: 10px;
		height: 300px;
		width: 350px;
		overflow: hidden;
		text-align: center;
	}
	.modal-img > img {
		width: 100%;
		height: 100%;
		object-fit: contain;
	}
	.modal-item > div:nth-child(2) {
		margin: 20px;
		padding-top: 40px;
	}
	.modal-name {
		font-size: 30px;
		font-weight: bold;
		margin: 10px 0;
	}
	.modal-price {
		margin: 10px 0;
		margin-bottom: 20px;
		font-weight: bold;
		font-size: 25px;
	}
	.modal-event {
		color: #e84735;
		font-weight: bolder;
		line-height: 26px;
		font-size: 26px;
	}
	.modal-inventoryCnt {
		font-size: 16px;
		color: grey;
		margin: 7px 0;
	}
	.modal-content {
		font-size: 18px;
		margin: 5px 20px 5px 0;
		height: 120px;
		overflow: auto;
	}
	.modal-button {
		position: absolute;
		bottom: 0;
		left: 0;
		width: 750px;
		height: 200px;
		flex-direction: column;
	}
	.modal-button > div {
		text-align: center;
	}
	.modal-button button {
		margin: 20px 30px;
		height: 65px;
		width: 400px;
		font-size: 25px;
		background-color: #006fba;
		color: white;
		border: none;
		border-radius: 20px;
	}
	.modal-button button:hover {
		background-color: #03538a;
		cursor: pointer;
	}
	.cart {
		margin: 0 auto;
	}
	.cart > div,
	.cart > button {
		margin: 5px 30px;
	}
	.cart > div > button {
		width: 40px;
		height: 40px;
		border-radius: 50px;
		background-color: #2ABADA;
	}
	.productCnt {
		width: 40px;
		height: 40px;
		line-height: 40px;
		font-size: 20px;
		border: none;
		padding-left: 27px;
		margin-top: 18px;
	}
	.productCnt:focus {
		border: none;
		outline: none;
	}
	.cart > .cartBtn {
		width: 250px;
	}
	footer {
		height: 300px;
	}
	
</style>
</head>
<body>

<main class="frame">
	
	<div><h1 class="store_name" store="${storeDTO.idx }">${storeDTO.name }</h1></div>
	
	<div class="searchTitle flex sb">
		<div><h1><a href="${cpath }/product/storeList/${storeDTO.idx}">카테고리</a></h1></div>
		<div class="search flex">
			<form id="searchForm" class="flex">
				<input class="flex" type="search" name="search" placeholder="상품명을 입력하세요">
				<input type="submit" value="검색">
			</form>
		</div>
	</div>
	
	<div class="category">
		<ul class="flex sb">
			<li idx="1">간편식품</li>
			<li idx="2">과자류</li>
			<li idx="3">아이스크림</li>
			<li idx="4">식품</li>
			<li idx="5">음료</li>
		</ul>
	</div>
	
	<div class="product-list flex wrap">
		<c:forEach var="dto" items="${list }">
			<div class="item" category="${dto.category_idx }" idx="${dto.idx }">
				<div class="product-list-image"><img src="${dto.image }"></div>
				<div class="product-list-name">${dto.name }</div>
				<div class="product-list-price">${dto.price }</div>
				<div class="product-list-event ${dto.event != '행사없음' ? 'event-text' : '' }">${dto.event != '행사없음' ? dto.event : ''}</div>
			</div>
		</c:forEach>
	</div>
	<div class="moreBtn">
		<button id="loadMore">더보기</button>
	</div>
	
	<div id="overlay" class="hidden"></div>
	<div id="modal" class="hidden">
		<div class="modal-item flex sb"></div>
		<div class="modal-button flex">
			<div class="cart flex">
				<div class="flex"></div>
				<button class="cartBtn">장바구니 담기</button>
			</div>
			<div class="cancel"><button>닫기</button></div>
		</div>
	</div>
	
</main>
<footer></footer>

<script>
	const login = "${login.userid}"

	// 카테고리 검색 및 상품리스트
	const categoryList = document.querySelectorAll('.category > ul > li')
	const productList = document.querySelector('.product-list')
	const itemList = document.querySelectorAll('.product-list > .item')
	const submit = document.getElementById('searchForm')
	const storeIdx = document.querySelector('.store_name').getAttribute('store')
	
	const moreBtn = document.getElementById('loadMore')
	
	// 모달 관련
	const modal = document.getElementById('modal')
	const modalItem = modal.querySelector('.modal-item')
	const overlay = document.getElementById('overlay')
	
	
	let selectCategoryIdx = ''
	let pickupStore = ''
	
	
	// url과 ob를 받아서 json데이터를 반환하는 함수
	async function fetchResult(url, ob) {
		const opt = {
			method: 'POST',
			body: JSON.stringify(ob),
			headers: {
				'Content-Type': 'application/json; charset=utf-8'
			}
		}
		const data = await fetch(url, opt).then(resp => resp.json())
		return data
	}
	
	let saveData = []
	let currentDate = []	// 전체 데이터 목록
	const increment = 12	// 한 번에 표시할 데이터의 수 (12개씩 표시)
	let displayCount = 0	// 지금까지 화면에 출력된 목록 수 
	
	// json을 받아 페이지에 검색 결과를 출력하는 함수
	function displaySearchResult(data) {
		const arr = data
		
		arr.forEach(dto => {
			let tag = ''
			tag += `<div class="item" category="\${dto.category_idx }" idx="\${dto.idx }">`
			tag += `<div class="product-list-image"><img src="\${dto.image }" height="180"></div>`
			tag += `<div class="product-list-name">\${dto.name }</div>`
			tag += `<div class="product-list-price">\${dto.price }원</div>`
			tag += `<div class="product-list-event \${dto.event != '행사없음' ? 'event-text' : '' }">\${dto.event != '행사없음' ? dto.event : ''}</div>`
			tag += `</div>`
			productList.innerHTML += tag
		})
		// categoryFilter()
		
	}
	
	// 초기에 데이터를 보여주는 함수 (12개 출력)
	function displayInitialData(data) {
		currentData = data
		saveData = data
		productList.innerHTML = ''
		
		// 초기데이터가 12개보다 적다면 더보기 버튼 숨기기
		if(currentData.length <= increment) {	
			moreBtn.classList.add('hidden')
		}
		// 12개 잘라서 데이터 반환
		const initData = data.slice(0, increment)
		
		displayCount = increment
		displaySearchResult(initData)
	}
	
	// 더보기 버튼 클릭 함수
	function loadMoreData(event) {
	    // 선택된 카테고리가 있을 경우, saveData에서 해당 카테고리에 맞는 상품만 필터링
	    const filteredData = selectCategoryIdx ? 
	                         saveData.filter(item => item.category_idx == selectCategoryIdx) : 
	                         saveData
	    
	    // displayCount 위치에서 시작하여, increment 만큼의 상품을 추가로 표시
	    const nextData = filteredData.slice(displayCount, displayCount + increment)

	    // 화면에 표시할 상품이 더 이상 없을 경우 더보기 버튼 숨기기
	    if(nextData.length === 0 || displayCount + increment >= filteredData.length) {
	        moreBtn.classList.add('hidden')
	    } else {
	        moreBtn.classList.remove('hidden')
	    }

	    // 검색 결과를 화면에 추가
	    displaySearchResult(nextData)
	    displayCount += nextData.length // 실제 추가된 데이터의 수만큼 displayCount 업데이트
	}
	
	// 카테고리 클릭 함수
	function categoryClickHandler(event) {
		categoryList.forEach(li => {
			li.style.cssText = "border: 1px solid white; background-color: white;"
		})
		
		if(selectCategoryIdx == event.target.getAttribute('idx')) {
			selectCategoryIdx = ''
			// currentData = saveData
			
		}
		else {
			selectCategoryIdx = event.target.getAttribute('idx')
			event.target.style.cssText = "border: 1px solid #698bd1; border-radius: 5px; background-color: rgba(142, 178, 232, 0.2);"
		}
		categoryFilter()
	}
	
	// 검색시 실행되는 함수
	function searchSubmitHandler(event) {
		event.preventDefault()
		selectCategoryIdx = ''
		categoryList.forEach(li => {
			li.style.cssText = "border: 1px solid white; background-color: white;"
		})
		const form = event.target
		const searchName = document.querySelector('input[type="search"]').value
		
		const url = '${cpath}/product/searchListByStore'
		const ob = { 
			search: searchName,
			store_idx: storeIdx
		}
		
		fetchResult(url,ob)
			.then(data => displayInitialData(data))
	}
	
	// 카테고리 필터 함수
	function categoryFilter() {
		// 선택한 카테고리가 없으면 filterData = currentData(현재 목록)
		// 선택한 카테고리가 있으면 filterData = currentData의 category_idx와 선택한 카테고리idx가 일치하는 데이터
		const filterData = selectCategoryIdx ? 
					currentData.filter(item => item.category_idx == selectCategoryIdx) : currentData
		
		//!!
		productList.innerHTML = ''
		
		if(filterData.length <= increment) {
			moreBtn.classList.add('hidden')
		} else {
			moreBtn.classList.remove('hidden')
		}
		const initData = filterData.slice(0, increment)
		displayCount = increment
		
		displaySearchResult(initData)
		
	}
	
	// 모달창에 단일요소 내용을 넣는 함수
	function modalItemResult(data) {
		modalItem.innerHTML = ''
		document.querySelector('.cart > div:first-child').innerHTML = ''
		const dto = data
		
		let tag = ''
		tag += `<div>`
		tag += `	<div class="modal-img"><img src="\${dto.image}"></div>`
		tag += `</div>`
		tag += `<div>`
		tag += `	<div class="modal-name" idx="\${dto.idx}">\${dto.name}</div>`
		tag += `	<div class="modal-price">\${dto.price}원 <span class="modal-event">\${dto.event == '행사없음' ? '' : '['+dto.event+']'}</span></div>`
		tag += `	<div class="modal-inventoryCnt">남은 수량 : \${dto.inventoryCnt}</div>`
		tag += `	<div class="modal-content">\${dto.content}</div>`
		tag += `</div>`
		modalItem.innerHTML += tag
		
		let tag2 = ''
		tag2 += `<button class="minus">-</button>`
		tag2 += `<input type="number" class="productCnt" value="0" min="0" max="\${dto.inventoryCnt}" readonly>`
		tag2 += `<button class="plus">+</button>`
		document.querySelector('.cart > div:first-child').innerHTML += tag2
	
	}
	
	// 상품 단일요소 클릭시 모달창이 열리는 함수
	function itemClickHandler(event) {
		modal.classList.remove('hidden')
		overlay.classList.remove('hidden')
		
		const url = "${cpath}/product/selectOne"
		const ob = {
			store_idx: storeIdx,
			product_idx: event.target.getAttribute('idx')
		}
		fetchResult(url, ob)
			.then(data => modalItemResult(data))
	}
	
	// 모달창에서 닫기 버튼을 눌렀을 때 모달창을 닫는 함수
	function modalCancelClickHandler(event) {
		modal.classList.add('hidden')
		overlay.classList.add('hidden')
	}
	
	// 모달창의 장바구니에 담는 버튼(+, -)
	modal.addEventListener('click', function(event) {
	    if(event.target.classList.contains('minus') || event.target.classList.contains('plus')) {
		    // 이벤트가 발생한 요소가 minus 또는 plus 버튼인지 확인
	        const isMinus = event.target.classList.contains('minus')
	        const input = isMinus ? event.target.nextElementSibling : event.target.previousElementSibling
	        let currentValue = Number(input.value) // 현재값을 숫자로 변환
	        const maxCount = Number(input.getAttribute('max')) // 최대값을 숫자로 변환
	        
	        if(isMinus && currentValue > 0) {
	            currentValue -= 1
	        } else if(!isMinus && currentValue < maxCount) {
	            currentValue += 1
	        }
	        input.value = currentValue // 변경된 값을 input에 설정
	   }
	    
	})
	
	// 장바구니에 등록된 매장과 현재 매장 비교 함수
	async function registerStore(event) {
		
		// 만약 등록된 매장이 없다면
		if(pickupStore == '0') {	
			pickupStore = storeIdx
			console.log('장바구니등록매장이 없어서 등록 직후 :'+pickupStore)
		}
		// 현재 등록된 매장과 현재 위치의 매장 idx가 다른 경우
		else if(pickupStore != storeIdx) {
			const isChangeStore = confirm('이미 선택된 매장이 있습니다. 장바구니를 비우고 현재 매장으로 변경하시겠습니까?')
			// 1) 현재 매장으로 변경등록
			if(isChangeStore) {
				pickupStore = storeIdx
				console.log('다른 매장으로 등록되어있던 장바구니의 등록 매장을 변경 : ' + pickupStore)
				// 매장을 변경했으므로 기존의 장바구니에 있는 상품 모두 삭제
				const deleteUrl = "${cpath}/product/deleteAllCart"
				const deleteOpt = {method: 'DELETE'}
				const deleteResult = await fetch(deleteUrl, deleteOpt).then(data => data.text())
				const storeName = document.querySelector('.store_name').innerText
				console.log(storeName)
				if(deleteResult != '0') {
					document.querySelector('.header-cart-count').innerText = ''
					document.querySelector('.header-cart > div').classList.remove('header-cart-count')
					alert(storeName + ' 매장이 선택되었습니다')
				}
			}
			// 2) 현재 매장으로 변경등록 X
			else {
				alert('선택된 매장 링크로 이동합니다')
				location.href = "${cpath}/product/storeList/" + pickupStore
			 }
		 }
	}
	
	// 장바구니에 담기 버튼을 클릭했을 때 실행되는 함수
	document.querySelector('.cartBtn').addEventListener('click', async function(event) {
		 const registerStoreResult = await registerStore()
		 console.log(registerStoreResult)
		 const inputValue = document.querySelector('.productCnt').value
		 const productIdx = modal.querySelector('.modal-name').getAttribute('idx')
		 const url = "${cpath}/product/addCart"
		 
		 // 선택한 수량이 0개일 경우
		 if(inputValue == '0') {
			 alert('선택된 수량이 없습니다')
			 return
		 }
		 
		 const ob ={
			store_idx: storeIdx,
			product_idx: productIdx,
			cnt: inputValue
		 }
		 const opt = {
				method: 'POST',
				body: JSON.stringify(ob),
				headers: {
					'Content-Type': 'application/json; charset=utf-8'
				}
		 }
		 const result = await fetch(url, opt).then(data => data.text())
		 
		 if(result != '0') {
			 const url2 = "${cpath}/product/selectCount"
			 const opt2 = { method: 'POST' }
			 const count = await fetch(url2, opt).then(resp => resp.text())
			 
			 const countDIV = document.querySelector('.header-cart > div')
			 countDIV.innerText = count
		     
			 if(countDIV.classList.contains('header-cart-count')==false) {
				 countDIV.classList.add('header-cart-count')
			 }
			 
			 modal.classList.add('hidden')
			 overlay.classList.add('hidden')
			 alert('상품이 장바구니에 담겼습니다')
		 }
	})
	
	
	// 페이지 처음 바로 실행되는 함수
	async function load() {
		const url = "${cpath}/product/selectCartStore"
		const data = await fetch(url).then(resp => resp.text())
		pickupStore = data
		console.log('load직후 등록된pickupStore 불러오기 : ' + pickupStore)
		registerStore()
		
		const itemArr = Array.from(itemList)
		const dataArr = itemArr.map(dto => {
			const ob = {}
			ob.idx = dto.getAttribute('idx')
			ob.category_idx = dto.getAttribute('category')
			ob.image = dto.querySelector('.product-list-image > img').getAttribute('src')
			ob.name = dto.querySelector('.product-list-name').innerText
			ob.price = dto.querySelector('.product-list-price').innerText
			ob.event = dto.querySelector('.product-list-event').innerText == '' ? '행사없음' : dto.querySelector('.product-list-event').innerText
			return ob
		})
		displayInitialData(dataArr)
		
	}
	
	
	document.querySelector('.category > ul').addEventListener('click', function(event) {
		if(event.target.tagName == 'LI') {
			categoryClickHandler(event)
		}
	})
	
	submit.addEventListener('submit', searchSubmitHandler)
	moreBtn.addEventListener('click', loadMoreData)
	
	productList.addEventListener('click', function(event) {
	    if(event.target.closest('.item')) {
	    	itemClickHandler(event)
	    }
	})
	modal.querySelector('.cancel > button').addEventListener('click', modalCancelClickHandler)
	overlay.addEventListener('click', modalCancelClickHandler)
	
	window.addEventListener('DOMContentLoaded', load)
</script>

</body>
</html>