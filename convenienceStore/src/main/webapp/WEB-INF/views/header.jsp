<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리 동네 편의점</title>
<style>
	    .frame {
            width: 1200px;
            margin: auto;
        }
        .flex {
            display: flex;
        }
        .sb {
            justify-content: space-between;
        }
        a {
            color: inherit;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        .hidden {
            display: none;
        }
        .headerMenu > div{
        	margin-left: 20px;
        }
        .headerMenu > div > a ,
        div.locationSelect > a{
        	font-size: 17px;
        }
</style>
</head>
<body>

	<div class="frame flex sb">
		<div class="locationSelect">
			<a href="${cpath }/myLocation">현재 위치 지정하러 가기</a>
		</div>
		<div class="headerMenu flex">
			<c:if test="${empty login }">
				<div><a href="${cpath }/member/login">로그인</a></div>
				<div><a href="${cpath }/member/join">회원가입</a></div>
			</c:if>
			<c:if test="${not empty login }">
				<div>${login.nickname } 님</div>
				<div><a href="${cpath }/member/logout">로그아웃</a></div>
				<div><a href="${cpath }/myPage">마이페이지</a></div>
				<div><a href="${cpath }/inquiry">1:1 문의</a></div>
			</c:if>
		</div>
	</div>

