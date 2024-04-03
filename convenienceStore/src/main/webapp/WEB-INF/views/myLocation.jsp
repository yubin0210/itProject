<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<style>
body {
	font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
	margin: 0;
	padding: 20px;
}

h1 {
	color: #333;
	text-align: center;
	margin-bottom: 30px;
}

.tit {
	font-size: 24px;
	margin: 0 auto 20px auto;
	font-weight: 500;
}

.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 500px;
}

#menu_wrap {
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	width: 250px;
	margin: 10px 0 30px 10px;
	padding: 5px;
	overflow-y: auto;
	background: rgba(255, 255, 255, 0.7);
	z-index: 1;
	font-size: 12px;
	border-radius: 10px;
}

.bg_white {
	background: #fff;
}

#menu_wrap hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 2px solid #5F5F5F;
	margin: 3px 0;
}

#menu_wrap .option {
	text-align: center;
}

#menu_wrap .option p {
	margin: 10px 0;
}

#menu_wrap .option button {
	margin-left: 5px;
}

#placesList li {
	list-style: none;
}

#placesList .item {
	position: relative;
	border-bottom: 1px solid #888;
	overflow: hidden;
	cursor: pointer;
	min-height: 65px;
}

#placesList .item span {
	display: block;
	margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

#placesList .item .info {
	padding: 10px 0 10px 55px;
}

#placesList .info .gray {
	color: #8a8a8a;
}

#placesList .info .jibun {
	padding-left: 26px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
		no-repeat;
}

#placesList .info .tel {
	color: #009900;
}

#placesList .item .markerbg {
	float: left;
	position: absolute;
	width: 36px;
	height: 37px;
	margin: 10px 0 0 10px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
		no-repeat;
}

#placesList .item .marker_1 {
	background-position: 0 -10px;
}

#placesList .item .marker_2 {
	background-position: 0 -56px;
}

#placesList .item .marker_3 {
	background-position: 0 -102px;
}

#placesList .item .marker_4 {
	background-position: 0 -148px;
}

#placesList .item .marker_5 {
	background-position: 0 -194px;
}

#placesList .item .marker_6 {
	background-position: 0 -240px;
}

#placesList .item .marker_7 {
	background-position: 0 -286px;
}

#placesList .item .marker_8 {
	background-position: 0 -332px;
}

#placesList .item .marker_9 {
	background-position: 0 -378px;
}

#placesList .item .marker_10 {
	background-position: 0 -423px;
}

#placesList .item .marker_11 {
	background-position: 0 -470px;
}

#placesList .item .marker_12 {
	background-position: 0 -516px;
}

#placesList .item .marker_13 {
	background-position: 0 -562px;
}

#placesList .item .marker_14 {
	background-position: 0 -608px;
}

#placesList .item .marker_15 {
	background-position: 0 -654px;
}

#pagination {
	margin: 10px auto;
	text-align: center;
}

#pagination a {
	display: inline-block;
	margin-right: 10px;
}

#pagination .on {
	font-weight: bold;
	cursor: default;
	color: #777;
}

#map {
	width: 100%;
	height: 100%;
	position: relative;
	overflow: hidden;
}

input[type="text"], input[type="submit"] {
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 4px;
	margin: 5px 0;
	box-sizing: border-box;
	width: calc(100% - 22px);
}

input[type="submit"] {
	background-color: #007bff;
	color: white;
	cursor: pointer;
}

input[type="submit"]:hover {
	background-color: #0056b3;
}

.search {
	background-color: #007bff; /* 테마와 일치하는 파란색 배경 */
	color: white; /* 텍스트 색상 */
	padding: 5px 10px; /* 상하, 좌우 패딩 조정으로 크기 증가 */
	border: none; /* 테두리 제거 */
	border-radius: 4px; /* 모서리 둥글게 */
	cursor: pointer; /* 마우스 오버 시 커서 변경 */
	font-size: 18px; /* 폰트 크기 조정 */
	transition: background-color 0.3s; /* 배경색 변경시 부드러운 전환 효과 */
}

.search:hover {
	background-color: #0056b3; /* 버튼 오버 시 진한 파란색으로 변경 */
}
</style>

<section class="frame" style="margin-bottom: 100px;'">

	<h1>내 위치 지정하기 페이지</h1>
	<hr>

	<div class="map_wrap">
		<div id="map"></div>

		<div id="menu_wrap" class="bg_white">
			<div class="option">
				<div>
					<form onsubmit="searchPlaces(); return false;">
						키워드 : <input type="text" id="keyword" placeholder="장소 이름을 입력..."
							size="15">
						<button type="submit" class="search">검색하기</button>
					</form>
				</div>
			</div>
			<hr>
			<ul id="placesList"></ul>
			<div id="pagination"></div>
		</div>
	</div>

	<c:if test="${dto == null}">
		<div class="tit">내 위치를 처음 등록하기</div>
		<form action="" id="myLocation" name="myLocation" method="POST">
			<div id="address"></div>
			<div id="lat"></div>
			<div id="lng"></div>
			<input type="hidden" name="member_idx" value="${login.idx }">
			<input type="hidden" name="action" value="action1"> <input
				type="submit" value="선택 후 결정">
		</form>
	</c:if>

	<c:if test="${dto != null}">
		<div class="tit">내 위치를 수정하기</div>
		<form action="" id="myLocation" name="myLocation" method="POST">
			<div id="address"></div>
			<div id="lat"></div>
			<div id="lng"></div>
			<input type="hidden" name="member_idx" value="${login.idx }">
			<input type="hidden" name="action" value="action2"> <input
				type="submit" value="선택 후 결정">
		</form>
	</c:if>

	<div id="result" style="display: none;"></div>
	<div id="thisLat" style="display: none;">${dto.lat }</div>
	<div id="thisLng" style="display: none;">${dto.lng }</div>
	<div id="thisAddress" style="display: none;">${dto.address }</div>


</section>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=29977e320f12ce1963e204057d2e6d84&libraries=services"></script>

<script>
	// HTML 내 form > input 값들 입니다
	const addressInHTML = document.getElementById('address');
	const latInHTML = document.getElementById('lat');
	const lngInHTML = document.getElementById('lng');

	// SQL데이터 값을 간단하게 옮긴 것들 입니다
	const thisLat = document.getElementById('thisLat').textContent;
	const thisLng = document.getElementById('thisLng').textContent;
	const thisAddress = document.getElementById('thisAddress').textContent;

	// 처음 등록이라면 학원 주소를 검색 하여 결과를 보여준다
	if (thisAddress == '') {
		document.getElementById("keyword").value = 'KG에듀원 아이티뱅크 부산점';
	}

	// 마커를 담을 배열 입니다
	var markers = [];

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	mapOption = {
		center : new kakao.maps.LatLng(thisLat, thisLng), // 지도의 중심 좌표
		level : 3
	// 지도의 확대 레벨
	};

	// 지도를 생성 합니다
	var map = new kakao.maps.Map(mapContainer, mapOption);

	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new kakao.maps.MapTypeControl();

	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

	// 장소 검색 객체를 생성 합니다
	var ps = new kakao.maps.services.Places();

	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합 니다
	var infowindow = new kakao.maps.InfoWindow({
		zindex : 1
	});

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	// 클릭 시 출력 할 마커와 인포 윈도우 입니다
	var markerClick = new kakao.maps.Marker(), infowindowClick = new kakao.maps.InfoWindow(
			{
				zindex : 1
			});

	// 내가 찍을 마커와 차별화를 위한 다른 마커 이미지 입니다.
	var icon = new kakao.maps.MarkerImage(
			'https://i1.daumcdn.net/dmaps/apis/n_local_blit_04.png',
			new kakao.maps.Size(31, 35),
			{
				shape : 'poly',
				coords : '16,0,20,2,24,6,26,10,26,16,23,22,17,25,14,35,13,35,9,25,6,24,2,20,0,16,0,10,2,6,6,2,10,0'
			});

	// 기존 위치를 보여 줄 마커와 인포 윈도우 입니다
	var thisMarker = new kakao.maps.Marker({
		image : icon
	}), thisInfowindow = new kakao.maps.InfoWindow({
		zindex : 1
	});

	// 기존에 설정된 위치가 있을 시 그 위치에 마커를 등록 한다
	if (thisLat != '') {
		var markerPosition = new kakao.maps.LatLng(thisLat, thisLng);

		thisMarker.setPosition(markerPosition);
		thisMarker.setMap(map);

		var thisContent = '<div style="padding: 5px; z-index:1; margin: auto;">기존에 지정 되어 있는 위치</div></div>';

		// mouseover, out 시 인포 윈도우를 출력
		(function(thisMarker, thisContent) {
			kakao.maps.event.addListener(thisMarker, 'mouseover', function() {
				thisInfowindow.setContent(thisContent);
				thisInfowindow.open(map, thisMarker);
			});

			kakao.maps.event.addListener(thisMarker, 'mouseout', function() {
				thisInfowindow.close();
			});

		})(thisMarker, thisContent);
	}

	// 키워드로 장소를 검색 합니다
	searchPlaces();

	// 키워드 검색을 요청하는 함수 입니다
	function searchPlaces() {
		var keyword = document.getElementById('keyword').value;

		// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
		ps.keywordSearch(keyword, placesSearchCB);
	}

	// 장소검색이 완료 됐을 때 호출 되는 콜백 함수 입니다
	function placesSearchCB(data, status, pagination) {
		if (status == kakao.maps.services.Status.OK) {

			// 정상적으로 검색이 완료 됐으면
			// 검색 목록과 마커를 표출 합니다
			displayPlaces(data);

			// 페이지 번호를 표출 합니다
			displayPagination(pagination);

		} else if (status == kakao.maps.services.Status.ZERO_RESULT) {

			alert('검색 결과가 존재하지 않습니다');
			return;

		} else if (status == kakao.maps.services.Status.ERROR) {

			alert('검색 결과 중 오류가 발생 했습니다')
			return;
		}
	}

	// 검색 결과 목록과 마커를 표출하는 함수 입니다
	function displayPlaces(places) {

		var listEl = document.getElementById('placesList'), menuEl = document
				.getElementById('menu_wrap'), fragment = document
				.createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';

		// 검색 결과 목록에 추가된 항목 들을 제거 합니다
		removeAllChildNods(listEl);

		// 지도에 표시 되고 있는 마커를 제거 합니다
		removeMarker();

		for (var i = 0; i < places.length; i++) {

			// 마커를 생성하고 지도에 표시 합니다
			var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x), marker = addMarker(
					placePosition, i), itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성 합니다

			// 검색된 장소 위치를 기준으로 지도 범위를 재설정 하기 위해
			// LatLngBounds 객체에 좌표를 추가 합니다
			bounds.extend(placePosition);

			// 마커와 검색 결과 항목에 mouseover 했을 때
			// 해당 장소에 인포 윈도우에 장소명을 표시 합니다
			// mouseout 했을 때는 인포윈도우를 닫습니다
			(function(marker, title) {
				kakao.maps.event.addListener(marker, 'mouseover', function() {
					displayInfowindow(marker, title);
				});

				kakao.maps.event.addListener(marker, 'mouseout', function() {
					infowindow.close();
				});

				// 				itemEl.onmouseover = function() {
				// 					displayInfowindow(marker, title);
				// 				};

				// 				itemEl.onmouseout = function() {
				// 					infowindow.close();
				// 				};

				// 				itemEl.onclick = function() {
				// 					map.setLevel(2);
				// 				    map.panTo(placePosition);
				// 				};

			})(marker, places[i].place_name);

			fragment.appendChild(itemEl);
		}

		// 검색 결과 항목 들을 검색 결과 목록 Element에 추가 합니다
		listEl.appendChild(fragment);
		menuEl.scrollTop = 0;

		// 검색된 장소 위치를 기준으로 지도 범위를 재설성 합니다
		map.setBounds(bounds);
	}

	// 검색 결과 항목을 Element로 반환 하는 함수 입니다
	function getListItem(index, places) {

		var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
				+ (index + 1)
				+ '"></span>'
				+ '<div class="info">'
				+ '	<h5>'
				+ places.place_name + '</h5>';

		var placePosition = new kakao.maps.LatLng(places.y, places.x);

		if (places.road_address_name) {
			itemStr += '	<span>' + places.road_address_name + '</span>'
					+ '	<span class="jibun gray">' + places.address_name
					+ '</span>';
		} else {
			itemStr += '	<span>' + places.address_name + '</span>';
		}

		itemStr += '	<span class="tel">' + places.phone + '</span>' + '</div>';

		el.innerHTML = itemStr;
		el.className = 'item';

		console.log(el)

		// 각 필드를 클릭하면 맵의 해당 부분으로 중심 이동 하는 기능 입니다
		el.onclick = function() {
			map.setLevel(2);
			map.panTo(placePosition);

			var resultAddress = "";

			if (places.road_address_name == null) {
				resultAddress = places.address_name;
			} else {
				resultAddress = places.road_address_name;
			}

			console.log('주소 : ' + resultAddress)
			console.log('위도 : ' + places.y)
			console.log('경도 : ' + places.x)

			addressInHTML.innerHTML = "<input type='hidden' name='address' value='" + resultAddress + "'>";
			latInHTML.innerHTML = "<input type='hidden' name='lat' value='" + places.y + "'>";
			lngInHTML.innerHTML = "<input type='hidden' name='lng' value='" + places.x + "'>";
		}

		return el;
	}

	// 마커를 생성 하고 지도 위에 마커를 표시 하는 함수 입니다
	function addMarker(position, idx, title) {
		var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
		imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
		imgOptions = {
			spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
			spriteOrigin : new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
			offset : new kakao.maps.Point(13, 37)
		// 마커 좌표에 일치 시킬 이미지 내 에서의 좌표
		}, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
				imgOptions), marker = new kakao.maps.Marker({
			position : position, // 마커의 위치
			image : markerImage
		});

		// 마커에 클릭이벤트를 등록합니다
		kakao.maps.event.addListener(marker, 'click', function() {
			// 마커를 클릭 하면 확대 수준을 변경 후 중심을 이동 시킵니다
			map.setLevel(2);
			map.panTo(position);
		});

		marker.setMap(map); // 지도 위에 마커를 표출 합니다
		markers.push(marker); // 배열에 생성된 마커를 추가 합니다

		return marker;
	}

	// 지도 위에 표시 되고 있는 마커를 모두 제거 합니다
	function removeMarker() {
		for (var i = 0; i < markers.length; i++) {
			markers[i].setMap(null);
		}
		markers = [];
	}

	// 검색 결과 목록 하단에 페이지 번호를 표시 하는 함수 입니다
	function displayPagination(pagination) {
		var paginationEl = document.getElementById('pagination'), fragment = document
				.createDocumentFragment(), i;

		// 기존에 추가된 페이지 번호를 삭제 합니다
		while (paginationEl.hasChildNodes()) {
			paginationEl.removeChild(paginationEl.lastChild);
		}

		for (i = 1; i <= pagination.last; i++) {
			var el = document.createElement('a');
			el.href = "#";
			el.innerHTML = i;

			if (i == pagination.current) {
				el.className = 'on';
			} else {
				el.onclick = (function(i) {
					return function() {
						pagination.gotoPage(i);
					}
				})(i);
			}

			fragment.appendChild(el);
		}
		paginationEl.appendChild(fragment);
	}

	// 검색 결과 목록 또는 마커를 클릭 했을 때 호출 되는 함수 입니다
	// 인포 윈도우에 장소명을 표시 합니다
	function displayInfowindow(marker, title) {
		var content = '<div style="padding: 5px; z-index:1; margin: auto;">'
				+ title + '</div>';

		infowindow.setContent(content);
		infowindow.open(map, marker);
	}

	// 검색 결과 목록의 자식 Element를 제거 하는 함수 입니다
	function removeAllChildNods(el) {
		while (el.hasChildNodes()) {
			el.removeChild(el.lastChild);
		}
	}

	// 클릭한 곳의 위도와 경도를 불러오기
	kakao.maps.event
			.addListener(
					map,
					'click',
					function(mouseEvent) {

						// 클릭한 위도, 경도 정보를 가져옵니다 		
						var latlng = mouseEvent.latLng;

						var lat = latlng.getLat();
						var lon = latlng.getLng();

						locPosition = new kakao.maps.LatLng(lat, lon);

						var detailResult;

						searchDetailAddrFromCoords(
								mouseEvent.latLng,
								function(result, status) {
									if (status == kakao.maps.services.Status.OK) {
										var detailAddr = !!result[0].road_address ? result[0].road_address.address_name
												: result[0].address.address_name;

										// 마커를 클릭한 위치에 표시합니다 
										markerClick
												.setPosition(mouseEvent.latLng);
										markerClick.setMap(map);

										var contentClick = '<div style="padding: 5px; z-index:1; margin: auto;">현재 내가 지정한 위치</div>';

										// 	    	    // 인포 윈도우를 출력
										// 	    	    infowindowClick.setContent(contentClick);
										// 	    	    infowindowClick.open(map, markerClick);

										// mouseover, out 시 인포 윈도우를 출력
										(function(markerClick, contentClick) {
											kakao.maps.event
													.addListener(
															markerClick,
															'mouseover',
															function() {
																infowindowClick
																		.setContent(contentClick);
																infowindowClick
																		.open(
																				map,
																				markerClick);
															});

											kakao.maps.event
													.addListener(
															markerClick,
															'mouseout',
															function() {
																infowindowClick
																		.close();
															});

										})(markerClick, contentClick);

										// 콘솔로 좌표, 주소 출력 하여 값 확인 후 HTML로 전송
										detailResult = detailAddr;
										console.log('주소 : ' + detailResult);
										console.log('위도 : ' + lat);
										console.log('경도 : ' + lon);

										addressInHTML.innerHTML = "<input type='hidden' name='address' value='" + detailResult + "'>";

									}
								});

						// HTML에 출력
						const result = document.getElementById('result');
						result.innerHTML = locPosition;

						latInHTML.innerHTML = "<input type='hidden' name='lat' value='" + lat + "'>";
						lngInHTML.innerHTML = "<input type='hidden' name='lng' value='" + lon + "'>";

					});

	function searchDetailAddrFromCoords(coords, callback) {
		// 좌표로 도로명 주소 정보를 요청합니다
		geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
	}
</script>

</body>
</html>