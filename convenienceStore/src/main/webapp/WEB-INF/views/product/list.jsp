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
	.title {
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
	<div><h1 class="title">상품 상세 및 재고 매장 찾기</h1></div>
	
	<div class="searchTitle flex sb">
		<div><h1><a href="${cpath }/product/list">카테고리</a></h1></div>
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
	
	
	
</main>
<footer></footer>

<script>
	const login = "${login.userid}"

	// 카테고리 검색 및 상품리스트
	const categoryList = document.querySelectorAll('.category > ul > li')
	const productList = document.querySelector('.product-list')
	const itemList = document.querySelectorAll('.product-list > .item')
	const submit = document.getElementById('searchForm')
	
	const moreBtn = document.getElementById('loadMore')
	

	
	
	let selectCategoryIdx = ''
	
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
		
		const url = '${cpath}/product/SearchList'
		const ob = { 
			search: searchName
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
	
	// 페이지 처음 바로 실행되는 함수
	async function load() {
		
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
	
	function itemClickHandler(event) {
		let targetItem = event.target
		if(targetItem.className != 'item') {
			targetItem = targetItem.parentNode
		}
		const targetIdx = targetItem.getAttribute('idx')
		location.href = "${cpath}/product/view/" + targetIdx
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
	window.addEventListener('DOMContentLoaded', load)
</script>

</body>
</html>