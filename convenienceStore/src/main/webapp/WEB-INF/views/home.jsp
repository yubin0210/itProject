<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
	<style>
        body {
            overflow-x: hidden;
        }
        .main1 {
            width: 1200px;
            height: 400px;
            position: relative;
            margin: 50px auto;
        }
        .mainImg {
            position: relative;
            height: 400px;
            overflow: hidden;
        }
        .mainImg > .item {
            box-sizing: border-box;
            position: absolute;
            width: 1200px;
            height: 400px;
            transition-duration: 1s;
        }
        .mainImg > .item > img {
        	border-radius: 20px;
        }

        .arrow {
            width: 1200px;
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            font-size: 60px;
            color: rgba(165, 164, 164, 0.4);
        }
        .arrow > div:hover {
            color: grey;
            cursor: pointer;
            transition-duration: 0.3s;
        }
        .main2 {
            margin: 50px auto;
        }
        .main2 > div {
            position: relative;
            width: 550px;
            height: 380px;
            padding: 5px;
            border: 5px solid lightgrey;
            border-radius: 20px;
            z-index: 10;
        }
        .product-top10 > div:first-child,
        .storeLikeTop > div:first-child {
            position: absolute;
            width: 100%;
            top: 10px;
            text-align: center;
            font-size: 37px;
            font-weight: bold;
            z-index: 10;
        }
        .product-top10 > div:first-child > span {
        	color: #014b7d;
        }
        .product-top10-item {
        	width: 550px;
        	height: 350px;
        	position: relative;
        }
        .product-top10-item > div {
        	text-align: center;
        }
        .product-top10-text {
        	position: absolute;
        	top: 50%;
        	left: 10%;
        	font-size: 150px;
        	font-weight: bolder;
        	color: #014b7d;
        	z-index: 10;
        }
        .product-top10-img {
        	position: absolute;
    		top: 68%;
    		left: 50%;
   			transform: translate(-50%, -50%)
        }
        .product-top10-img > a > img {
        	height: 300px;
        	z-index: -1;
        }
        .product-top10-item > .name {
        	position: absolute;
        	width: 80%;
        	top: 25%;
        	left: 50%;
        	transform: translate(-50%, -50%);
        	background-color: rgba(142, 178, 232, 0.2);
        	padding: 10px 20px;
        	border: none;
        	border-radius: 10px;
        	font-size: 20px;
        	font-weight: bold;
        	z-index: 10;
        }
        
        .storeLikeTop-content {
        	position: relative;
        	width: 100%;
        	height: 100%;
        }
        .storeLikeTop-content > .storeLikeTop-img {
         	position: absolute;
        	width: 550px;
        	height: 450px;
         	top: 70%;
         	left: 50%;
           	transform: translate(-50%, -50%);	 
			text-align: center; 
        }
        .storeLikeTop-content > .storeLikeTop-name {
        	position: absolute;
        	top: 74%;
        	left: 0;
        	font-size: 27px;
        	font-weight: bold;
        	width: 100%;
        	text-align: center;
        }
        .storeLikeTop-content > .storeLikeTop-likecount {
        	position: absolute;
        	top: 85%;
        	left: 0;
        	font-size: 27px;
        	font-weight: bold;
        	width: 100%;
        	text-align: center;
        }
        .event-title > h1 {font-size: 40px;}
        .main3 > div {
            width: 550px;
            height: 500px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .main3 > div > div > img {
        	border-radius: 10px;
        }
        .event-sub { position: relative; }
        .event-sub > div {
            height: 150px;
            width: 550px;
        }
        .event-sub > div > img {
        	width: 550px;
        	border-radius: 10px;
        }
        .event-sub > div:hover {
            cursor: pointer;
        }
        
        footer {height: 200px;}
    </style>
</head>
<body>

    <main class="frame">

        <div class="main1">
            <div class="mainImg">
                <div class="item"><img src="${cpath }/resources/image/home/home_main3.png" width="1200"></div>
                <div class="item"><img src="${cpath }/resources/image/home/home_main4.png" width="1200"></div>
                <div class="item"><img src="${cpath }/resources/image/home/home_main5.png" width="1200"></div>
                <div class="item"><img src="${cpath }/resources/image/home/home_main1.png" width="1200"></div>
                <div class="item"><img src="${cpath }/resources/image/home/home_main2.png" width="1200"></div>
            </div>
            <div class="arrow flex sb">
                <div direction="-1">&nbsp; &#10096;</div>
                <div direction="1">&#10097; &nbsp;</div>
            </div>
        </div>
        
        <div class="main2 flex sb">
            <div class="product-top10">
                <div class="product-top10-title">오늘의 상품 <span>TOP 10</span></div>
                <div class="product-top10-content flex">
                	<c:forEach var="likedto" items="${list }" varStatus="status">
                		<div class="product-top10-item">
	                		<div class="product-top10-text">${status.index +1}</div>
                			<div class="name">${likedto.name }</div>
	                		<div class="product-top10-img"><a href="${cpath }/product/view/${likedto.idx}"><img src="${likedto.image }"></a></div>

                		</div>
                	</c:forEach>
                </div>
            </div>
            <div class="storeLikeTop">
                <div class="storeLikeTop-title">인기 가맹점</div>
                <div class="storeLikeTop-content">
                	<div class="storeLikeTop-img"><a href="${cpath }/store/view/${storeDTO.idx}"><img src="${cpath }/resources/image/home/storeImage.png" height="250"></a></div>
					<div class="storeLikeTop-name">${storeDTO.name }</div>
					<div class="storeLikeTop-likecount">즐겨찾기 <span style="color: #006fba; ">${storeDTO.likeCount }명</span> 등록</div>
				</div>
            </div>
        </div>
        <div class="event-title"><h1> 이달의 행사 </h1></div>
        <div class="main3 flex sb">
            <div class="event-main">
                <div class="event-main-img">
                    <a href="${cpath }/event/view/103"><img src="${cpath }/resources/image/home/home_main3_1.png" width="550px" height="500px"></a>
                </div>
                <div class="event-main-img hidden">
                    <a href="${cpath }/event/view/101"><img src="${cpath }/resources/image/home/home_main3_2.png" width="550px" height="500px"></a>
                </div>
                <div class="event-main-img hidden">
                    <a href="${cpath }/event/view/102"><img src="${cpath }/resources/image/home/home_main3_3.png" width="550px" height="500px"></a>
                </div>
            </div>
            <div class="event-sub">
                <div class="event-sub-img"><img src="${cpath }/resources/image/home/home_sub1.png"></div>
                <div class="event-sub-img"><img src="${cpath }/resources/image/home/home_sub2.png"></div>
                <div class="event-sub-img"><img src="${cpath }/resources/image/home/home_sub3.png"></div>
            </div>
        </div>
    </main>
	<footer></footer>
<script>
 	// main1

    const MainImgArr = Array.from(document.querySelectorAll('.mainImg > .item'))
    let isAnimating1 = false
    
    // 메인슬라이더 함수
    function mainSlider(event) {
        if(isAnimating1) return
        
        isAnimating1 = true
        const unit = 1200
        const mid = Math.trunc(MainImgArr.length / 2)
        const direction = +event.target.getAttribute('direction')

        if (direction == 1) MainImgArr.push(MainImgArr.shift())
        else MainImgArr.splice(0, 0, MainImgArr.pop())

        MainImgArr.forEach((e, index) => {
            e.style.opacity = 0.2
            e.style.left = -(unit * (mid-index)) + 'px'
        })

        MainImgArr[mid].style.opacity = 1
        MainImgArr[0].style.opacity = 0
        MainImgArr[MainImgArr.length-1].style.opacity = 0

        setTimeout(() => {
            isAnimating1 = false
        }, 500)
        
    }

	
 	// 자동으로 슬라이더 넘어가기
    document.querySelectorAll('.arrow > div').forEach(e => e.onclick = mainSlider)
	for(let i = 0; i < 5; i++) {
	    document.querySelector('.arrow > div:last-child').dispatchEvent(new Event('click'))
	}
    setInterval(() =>
        document.querySelector('.arrow > div:last-child').dispatchEvent(new Event('click'))
    , 4000)
    
    
    // main2
    // productLike슬라이더
    const productLikeArr = Array.from(document.querySelectorAll('.product-top10-content > .product-top10-item'))
    productLikeArr.unshift(productLikeArr.pop())
    let isAnimating2 = false
    
    function productLikeSlider() {
        if(isAnimating2) return
        
        isAnimating2 = true
        const unit = 1200
        const mid = Math.trunc(MainImgArr.length / 2)
		
        productLikeArr.push(productLikeArr.shift())
		
		for(let i=0; i<productLikeArr.length; i++) {
			if(i==0) { productLikeArr[i].classList.remove('hidden') }
			else { productLikeArr[i].classList.add('hidden') }
		}

        setTimeout(() => {
            isAnimating2 = false
        }, 500)
    }
    
    for(let i = 0; i < 3; i++) {productLikeSlider()}
    
    setInterval(() => productLikeSlider()
    , 3000)
    


    // main3
    const subArr = Array.from(document.querySelectorAll('.event-sub > div > img'))

    function mainEventClick(event) {
        const mainArr = Array.from(document.querySelectorAll('.event-main > div'))
        const index = subArr.findIndex(e => e == event.target)

        mainArr.forEach((e, idx) => {
            if(idx === index) {
                e.classList.remove('hidden');
            } else {
                e.classList.add('hidden')
            }
        })
    }
    
    document.querySelectorAll('.event-sub > div').forEach(e => e.onclick = mainEventClick)
	

    </script>

</body>
</html>