<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
	.center {
		display: flex;
		justify-content: center;
	}
	
	.addBox {
		width: 1196px;
		height: fit-content;
		margin-top: 20px;
		border: 2px solid #DFDFDF;
	}

	.addTitle {
		font-weight: bold;
		font-size: 36px;
		margin-top: 10px;
		margin-bottom: 20px;
	}
	
	select {
		width: 200px;
		height: 52px;
		border: 0;
		border-bottom: 2px solid #DFDFDF;
		border-right: 2px solid #DFDFDF;
		font-size: 20px;
	}
	
	
	input[name=name] {
		width: 996px;
		height: 50px;
		border: 0;
		border-bottom: 2px solid #DFDFDF;
		padding: 0;
		font-size: 20px;
	}
	
	textarea {
		width: 1196px;
		height: 300px;
		border: 0px;
		border-bottom: 2px solid #DFDFDF;
		padding: 0;
		font-size: 16px;
	}
	
	.addLittleBox {
		display: flex;
	}
	
	input[name=price] {
		width: 400px;
		height: 30px;
		border: 0px;
		border-right: 2px solid #DFDFDF;
		padding: 0;
		font-size: 16px;
	}
	
	input[name=price]::-webkit-outer-spin-button,
	input[name=price]::-webkit-inner-spin-button {
		-webkit-appearance: none;
	}
	
	input[name=event] {
		width: 400px;
		height: 30px;
		border: 0px;
		border-right: 2px solid #DFDFDF;
		padding: 0;
		font-size: 16px;
	}
	
	input[name=image] {
		height: 30px;
		padding: 0;
		font-size: 16px;
	}
	
	.addFileBox {
		width: 400px;
		height: 30px;
		border: 0px;
	}
	
	input[type=submit] {
		font-size: 20px;
		width: 150px;
		height: 40px;
	}
	
	
</style>

<section class="frame">
	<form action="" method="POST" enctype="multipart/form-data">
		<div class="addTitle">상품 수정을 해보아요</div>
		<div class="addBox">
			<div class="flex sb">
				<select name="category_idx" required>
					<optgroup label="카테고리">
						<option value="">카테고리</option>
						<option value="1" ${dto.category_idx == '1' ? 'selected' : '' }>간편식품</option>
						<option value="2" ${dto.category_idx == '2' ? 'selected' : '' }>과자류</option>
						<option value="3" ${dto.category_idx == '3' ? 'selected' : '' }>아이스크림</option>
						<option value="4" ${dto.category_idx == '4' ? 'selected' : '' }>식품</option>
						<option value="5" ${dto.category_idx == '5' ? 'selected' : '' }>음료</option>
					</optgroup>
				</select>
				<input type="text" name="name" placeholder="여기에 상품 이름 입력" value="${dto.name }" required autofocus>
			</div>
			<div style="height: 301.6px;"><textarea rows="" cols="" name="content" placeholder="여기에 상품 설명 입력" style="resize: none;">${dto.content }</textarea></div>
			<div class="addLittleBox">
				<div><input type="number" name="price" placeholder="여기에 상품 가격 입력" value="${dto.price }" required></div>
				<div><input type="text" name="event" placeholder="진행되는 행사가 있다면 여기에 입력" value="${dto.event }"></div>
				<div class="addFileBox"><input type="file" name="upload" value="null"></div>
			</div>
		</div>
		<input type="hidden" name="image" value="${dto.image }">
		<input type="hidden" name="idx" value="${dto.idx }">
		<div class="flex sb">
			<div></div>
			<div><input type="submit" value="상품 등록"></div>
		</div>
		
	</form>
	</section>
</body>
</html>