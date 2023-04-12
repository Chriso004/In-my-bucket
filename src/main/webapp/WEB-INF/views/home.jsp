<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<style>

.main-banner{
	width: 100%;
	height: 550px;
	margin: 40px auto;
	text-align: center;
	
	background: url("${pageContext.request.contextPath}/img/grid.jpeg");
	border: 1px solid #000;
	border-radius: 30px;
}
.main-banner p:nth-child(1){
	font-family: 'Lantinghei SC';
	font-style: normal;
	font-weight: bold;
	font-size: 64px;
	line-height: 89px;
}
.main-banner p:nth-child(2){
	position: absolute;
	width: 312px;
	height: 120px;
	left: 55%;
	top: 30%;
	
	font-family: 'Kristi';
	font-style: italic;
	font-size: 96px;
	line-height: 120px;
	/* identical to box height */
	
	text-align: center;
	color: #001AFF;
	transform: rotate(-17.3deg);
}
.sub-banner{
	width: 100%;
	height: 255px;
	margin: 40px auto;
	text-align: center;
	
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	align-items: center;
	
	color: #fff;
	background: url("${pageContext.request.contextPath}/img/bluedd.jpeg");
	background-size: cover;
	border: 1px solid #000;
	border-radius: 30px;
}
.sub-banner span{
	padding: 0 70px;
}
.sub-banner b{
	font-size: 80px;
}
</style>
<div class="container">
	<div class="main-banner">
		<p>
		Discover your<br>own<br>Bucket List
		</p>
		<p>In My Bucket</p>
		<p>
			나의 버킷리스트를 등록하고 다른 사용자들과 함께 이뤄보세요.
		</p>
		<button class="btn" onclick="location.href='/inmybucket/feed/feedList'">지금 바로 둘러보기</button>
	</div>
	<div class="sub-banner">
		<!-- b태그안에 통계자료 넣을 예정 -->
		<span>지난 한달간 등록된 버킷리스트 수<b>100</b></span>
		<span>목표 달성한 버킷리스트 수<b>100</b></span>
		<span>목표 달성한 사용자 비율<b>80%</b></span>
	</div>
</div>