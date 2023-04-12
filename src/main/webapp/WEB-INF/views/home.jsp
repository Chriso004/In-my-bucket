<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
	<title>Home</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  한글 깨짐 테스트 </P>

<div>
		<ul>
			<c:if test="${logStatus!='Y' }">
				<li><a href="loginForm">로그인</a></li>
				<li><a href="/inmybucket/join">회원가입</a></li>
			</c:if>
			<c:if test="${logStatus=='Y' }">	
				<li>${logNick }<a href="/inmybucket/logout">로그아웃</a></li>
				<li><a href="/inmybucket/joinEdit">회원정보수정</a></li>
			</c:if>
			<c:if test="${logPermission =='9' }">
			<li><a href="/inmybucket">관리자 화면</a></li>
			</c:if>
			<li><a href="">게시판</a></li>
			
		</ul>
	</div>
</body>
</html>
