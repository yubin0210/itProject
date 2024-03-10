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
		body{
			margin: 0;
			padding: 0;
		}
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
        ul > li {
           list-style: none;
           padding-left: 0px;
        }
        ul {
           padding-left: 0px;
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
        .joinForm , .loginForm, .topForm{
           width: 1200px;
            margin: auto;
        }
        .joinLogo {
           font-size: 35px;
           padding-top: 50px;
           padding-bottom: 30px;
        }
        p.joinContent {
           font-size: 18px;
           padding-bottom: 70px;
        }
        .login {
           height: 322px;
           background-color: #FBFBFB;
        }
        .loginLogo {
           font-size: 35px;
           color: #397CA8;
           padding: 35px 0px;
        }
        .loginMainLogo {
           font-size: 35px;
           padding: 70px 0px;
        }
        #loginPadding {
           width: 284px;
           height: 37px;
        }
        .topMenuBorder {
           width: 100%;
           height: 120px;
           border-top: 5px solid #0072BC;
           border-bottom: 2px solid #DFDFDF;
        }
        .topList {
           width: 1200px;
        }
        .topButton {
           padding-top: 20px;
           padding-bottom: 50px;
        }
        #logo {
           width: 130px;
           padding-left: 0px;
        }
        .menuText > li {
           flex : 1;
           display: flex;
           justify-content: center; 
          align-items: center; 
          font-size: 23px;
          padding-bottom: 5px;
        }
      
</style>
</head>
<body>

   <div class="frame">
      <div class="topButton flex sb">
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
   </div>
      <div class="topMenuBorder">
         <div class="topList frame">
            <ul class="flex menuText">
               <li><a href="${cpath }"><img id="logo" src="${cpath }/resources/image/home/GS25로고.png"></a></li>
               <li><a href="#">재고찾기</li>
               <li><a href="#">매장찾기</li>
               <li><a href="#">쿠폰</li>
               <li><a href="#">프로젝트 소개</li>
            </ul>
         
         </div>
      </div>
   


