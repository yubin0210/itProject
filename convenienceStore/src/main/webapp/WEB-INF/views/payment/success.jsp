<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
	.cartFrame{
		width: 1200px;
		margin: 30px auto;
		border: 1px solid #DFE3E8;
		background-color: #F2F2F2;
	}
	div.cart1 > div:first-child {
		font-size: 40px;
		margin-left: 80px;
		margin-top: 40px;
	}
	div.cart1 > div.flex{
		margin-right: 20px;
	}
	div.cart1 > div.flex > div{
		margin: 20px;
		font-size: 20px;
		color: grey;
		margin-top: 50px;
	}
	div.guidance{
		margin: 100px;
		font-size: 25px;
	}
</style>

<div class="cartFrame">
	<div class="flex sb cart1">
		<div>주문완료</div>
		<div class="flex">
			<div>장바구니</div>
			<div><b>주문완료</b></div>
		</div>
	</div>
	<div class="guidance">주문내역은 마이페이지에서 확인 가능합니다.</div>
	
	
</div>

<script>
	function load() {
		const cartCount = document.querySelector('.header-cart > div')
		cartCount.classList.remove('.header-cart-count')
		cartCount.innerText = ''
	}
	window.addEventListener('DOMContentLoaded', load)
</script>

</body>
</html>