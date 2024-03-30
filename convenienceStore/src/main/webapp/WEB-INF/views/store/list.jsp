<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<style>
	main > div {
		width: 800px;
		margin: 50px auto 10px auto;
	}
	.title {
		font-size: 40px;
	}
	main > div:nth-child(2) {
		margin: 30px auto 20px auto;
	}
	.searchTitle> div > h1 {
		border: 1px solid grey;
		border-radius: 5px;
		background-color: #eee;
		padding: 10px;
	}
	.wrap {
		flex-wrap: wrap;
	}
	.search {
		align-items: center;
		justify-content: center;
	}
	input[type="search"] {
		width: 450px;
		height: 60px;
		color: grey;
		padding: 8px;
		font-size: 20px;
		border: 1px solid grey;
		border-radius: 5px;
	}
	input[type="submit"] {
		width: 80px;
		margin: 0 10px;
		font-size: 20px;
		font-weight: bold;
		color: #006fba;
		border: 1px solid #698bd1;
		border-radius: 5px;
		background-color: rgba(142, 178, 232, 0.2);
		transition-duration: 0.2s;
	}
	input[type="submit"]:hover {
		cursor: pointer;
		color: white;
		background-color: #006fba;
		transition-duration: 0.2s;
	}
	.address > div:first-child {
		width: 180px;
		font-size: 22px;
		font-weight: bold;
		border: 1px solid grey;
		padding: 8px 10px;
		text-align: center;
		border-radius: 5px;
	}
	.address > ul {
		margin: 40px auto;
	}
	.address > ul > li {
		list-style: none;
		height: 40px;
		border: 1px solid white;
		text-align: center;
		line-height: 40px;
		font-size: 23px;
		font-weight: bold;
		transition-duration: 0.2s;
		padding: 2px 20px;
		margin-top: 5px;
	}
	.address > ul > li:hover {
		cursor: pointer;
		border: 1px solid #698bd1;
		border-radius: 5px;
		background-color: rgba(142, 178, 232, 0.2);
		transition-duration: 0.2s;
	}
	.dong > ul > li {
		margin: 5px 40px;
		margin-left: 0;
		width: 75px;
	}
	#resultTable {
		width: 900px;
		border-collapse: collapse;
	}
	#resultTable tr { transition-duration: 0.2s; }
	#resultTable td {
		width: 50%;
		font-size: 20px;
		padding: 15px;
		padding-bottom: 25px;
		border-bottom: 1px solid #c4c4c4;
	}
	#resultTable td:first-child {
		font-weight: bold;
	}
	#resultTable td:nth-child(2) {
		font-size: 18px;
	}
	#resultTable tr:last-child td {
		border-bottom: none;
	}
	#resultTable tr:hover {
		background-color: #eee;
		cursor: pointer;
		transition-duration: 0.2s;
	}
	.moreBtn {
		text-align: center;
		margin: 15px auto;
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
	footer {
		height: 200px;
	}
</style>
</head>
<body>

<main class="frame">
	<div><h1 class="title">주문 매장 선택</h1></div>
	<div class="searchTitle flex sb">
		<div><h1>부산광역시</h1></div>
		<div class="search flex">
			<form id="searchForm" class="flex">
				<input class="flex" type="search" name="search" placeholder="매장명을 입력하세요">
				<input type="submit" value="검색">
			</form>
		</div>
	</div>
	<div class="address gu">
		<div>구를 선택하세요</div>
		<ul class="flex sb">
			<li>해운대구</li>
			<li>남구</li>
			<li>수영구</li>
			<li>동래구</li>
			<li>기장군</li>
		</ul>
	</div>
	
	<div class="address dong">
		<div>동을 선택하세요</div>
		<ul class="flex wrap">
		</ul>
	</div>
	
	<div class="searchResult">
		<h1>검색 결과</h1>
		
		<table id="resultTable">
			<c:forEach var="dto" items="${list }">
			<tr class="${dto.idx }">
				<td class="storeName">${dto.name }</td>
				<td class="store">${dto.address }</td>
			</tr>
			</c:forEach>
		</table>
		<div class="moreBtn">
			<button id="loadMore">더보기</button>
		</div>
	</div>
</main>

<footer></footer>

<script>
	const guList = document.querySelectorAll('.gu > ul > li')
	const dongUl = document.querySelector('.dong > ul')
	const submit = document.getElementById('searchForm')
	const moreBtn = document.getElementById('loadMore')
	const resultTable = document.getElementById('resultTable')
	
	let selectGuName = ''
	
	// url과 ob를 받아서 json 데이터로 변환하는 함수
	async function fetchResult(url, ob) {
		const opt = {
			method: 'POST',
			body: JSON.stringify(ob),
			headers: {
				'Content-Type': 'application/json; charset=utf-8'
			}
		}
		const data = await fetch(url, opt).then(resp => resp.json())
		// console.log(data)
		return data
	} 
	
	// json을 받아 '동'을 출력하는 함수
	function displayDongList(data) {
		const arr = data
		
		const uniqueDong = new Set()
		arr.forEach(dto => uniqueDong.add(dto.dong))
		
		dongUl.innerHTML = ''
		uniqueDong.forEach(dong => {
			let tag = ''
			tag += `<li>\${dong}</li>`
			dongUl.innerHTML += tag
		})
	}
	
	
	let currentData = []	// 전체 데이터 전체 목록
	const increment = 4		// 한 번에 표시할 데이터의 수 (4개씩 표시)
	let displayCount = 0	// 지금까지 화면에 출력된 목록 수
	
	// json을 받아 페이지에 검색결과를 출력하는 함수
	function displaySearchResult(data) {
		const arr = data
		
		arr.forEach(dto => {
		let tag = ''
		tag += '<tr>'
		tag += `	<td>\${dto.name}</td>`
		tag += `	<td>\${dto.address}</td>`
		tag += '</tr>'
		resultTable.innerHTML += tag
		resultTable.querySelectorAll('tr > td')
			.forEach(e => e.style.cssText="border-bottom: 1px solid #c4c4c4;")
		})
		
	}
	
	// 초기에 데이터를 보여주는 함수 (4개 출력)
	function displayInitialData(data) {
		currentData = data
		resultTable.innerHTML = ''
		if(currentData.length <= increment) {
			moreBtn.classList.add('hidden')
		}
		
		const initData = data.slice(0, increment)
		displaySearchResult(initData)
		displayCount = increment
	}
	
	// 더보기버튼 클릭 이벤트함수
	function loadMoreData(event) {
		if(displayCount >= currentData.length) {
			moreBtn.classList.add('hidden')
			return
		}
		const nextData = currentData.slice(displayCount, displayCount + increment)
		displaySearchResult(nextData)
		displayCount += increment
	}
	
	// 구 클릭 이벤트함수
	function guClickHandler(event) {
		// 검색창에 입력된 내용이 있다면 검색창을 비워줌
		document.querySelector('input[type="search"]').value = ''
		moreBtn.classList.remove('hidden')
		guList.forEach(li => {
			li.style.cssText = "border: 1px solid white; background-color: white;"
		})	// 모든 gu(ul) > li 스타일 초기화
		
		const selectGu = event.target	// 선택한 구(li)
		
		if(selectGu.innerText != selectGuName) {
			selectGu.style.cssText = " border: 1px solid #698bd1; border-radius: 5px; background-color: rgba(142, 178, 232, 0.2);"
			selectGuName = event.target.innerText	// 선택한 구 이름 변경
			const url = '${cpath}/store/listByGu'
			const ob =  { gu: selectGuName }
			
			fetchResult(url,ob).then(data => {
				displayDongList(data)
				displayInitialData(data)
			})
		}
		else {
			selectGuName = ''
			dongUl.innerHTML = ''
			const url = '${cpath}/store/listByGu'
			const ob =  { gu: selectGuName }
			fetchResult(url,ob).then(data => {
				displayInitialData(data)
			})
		}
		
	}
	
	// 동 클릭 이벤트함수
	function dongClickHandler(event) {
		const dongList = document.querySelectorAll('.dong > ul > li')
		moreBtn.classList.remove('hidden')
		
		dongList.forEach(li => {
			li.style.cssText = "border: 1px solid white; background-color: white;"
		})	// 모든 dong(ul) > li 스타일 초기화
		
		const selectDong = event.target
		selectDong.style.cssText = " border: 1px solid #698bd1; border-radius: 5px; background-color: rgba(142, 178, 232, 0.2);"
		
		const url = '${cpath}/store/listByDong'
		const ob = {
			gu: selectGuName,
			dong: selectDong.innerText
		}
		fetchResult(url, ob)
			.then(data => displayInitialData(data))
	}
	
	// 검색 검색(제출) 이벤트 함수
	async function submitHandler(event) {
		event.preventDefault()
		moreBtn.classList.remove('hidden')
		selectGuName = ''
		guList.forEach(li => {
			li.style.cssText = "border: 1px solid white; background-color: white;"
		})
		dongUl.innerHTML = ''
		
		const form = event.target
		const searchName = document.querySelector('input[type="search"]').value
		
		const url = '${cpath}/store/listBySearch'
		const ob = { search: searchName }
		
		fetchResult(url, ob)
			.then(data => displayInitialData(data))
	}
	
	// 편의점 클릭 이벤트(해당 편의점 view페이지로 이동)
	function storeClickHandler(event) {
		let tr = event.target
		if(tr.tagName != 'TR') {
			tr = tr.parentNode
		}
		
		const storeName = tr.querySelector('td').innerText
		let index = ''
		
		currentData.forEach(e => {
			if(e.name == storeName) {
				index = e.idx				
			}
		})
		console.log(index)
		location.href = `${cpath}/store/view/` + index
		
	}
	
	// 페이지 load시 작동 함수
	function load() {
		const trArr = Array.from(document.querySelectorAll('tr'))
		const dataArr = trArr.map(dto => {
			const ob = {}
			ob.idx = dto.className
			ob.name = dto.querySelector('.storeName').innerText
			ob.address = dto.querySelector('.store').innerText
			return ob
		})
		
		displayInitialData(dataArr)
	}
	
	submit.addEventListener('submit', submitHandler)
	guList.forEach(e => e.onclick = guClickHandler)
	dongUl.addEventListener('click', function(event) {
	    if (event.target.tagName == 'LI') {
	        dongClickHandler(event)
	    }
	})
	moreBtn.addEventListener('click', loadMoreData)
	resultTable.addEventListener('click', storeClickHandler)
	window.addEventListener('DOMContentLoaded', load)
</script>

</body>
</html>












