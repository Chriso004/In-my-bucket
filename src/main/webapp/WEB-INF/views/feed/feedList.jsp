<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<style>

	.category{
		padding-bottom: 30px;
	}

	.btn-line{
		padding: 10px 30px;
		margin: 0 30px 0 0;
		
		font-size: 15px;
		line-height: 15px;
		color: #000;
		background: #fff;
		border-radius: 17.5px;
		border: 1px solid #000;
	}
	.btn-line:hover {
		color: #011aff;
		border-color: #011aff;
	}

	.feed-list{
		display: flex;
		justify-content: space-between;
		flex-wrap: wrap;
	}
	.card {
		height: 410px;
		width: 300px;
		border-radius: 15px;
		display: inline-block;
		margin-top: 30px;
		/* margin-left: 30px; */
		margin-bottom: 30px;
		position: relative;
		box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
		overflow: hidden;
	}
	.card-header {
		-webkit-transition: 0.5s; /*사파리 & 크롬*/
	    -moz-transition: 0.5s;  /*파이어폭스*/
	    -ms-transition: 0.5s;	/*인터넷 익스플로러*/
	    -o-transition: 0.5s;  /*오페라*/
	    transition: 0.5s;
		width: 100%;
		height: 300px;
		border-radius: 15px 15px 0 0;
		background-size: 100% 280px;
		background-repeat: no-repeat;	
	}
	.card-header-is_group{
	    background-color: #011aff;
	    color: #fff;
	    text-align: center;
	    float: right;
	    margin: 15px 15px 0 0;
	    /* border-radius: 50%; */
	    font-weight: normal;
	    padding: 10px 10px;
	    line-height: 20px;
	    
	    display: flex;
		align-items: center;
	}
	.card-body{
		font-size: 15px;
		text-align: left;
	}
	
	.card-body-header{
		line-height: 15px;
		margin: 10px 20px 0px 20px;
	}	

	.card-body-description  {
	    opacity: 0;
	    color: #757B82;
	    line-height: 20px;
	    
	    -webkit-transition: .2s ease-in-out; /*사파리&크롬*/
	    -moz-transition: .2s ease-in-out; /*파이어폭스*/
	    -ms-transition: .2s ease-in-out; /*익스플로러*/
	    -o-transition: .2s ease-in-out; /*오페라*/
	    
	    transition : .2s ease-in-out;
	    overflow: hidden;
		height: 180px;
	
	}

	.card-body-footer {
	  	/* position: absolute; */ 
	  	margin-top: 15px;
	  	margin-bottom: 6px;
	    bottom: 0; 
	    width: 270px;
	    font-size: 12px;
	    color: #787878;
	    padding: 0 15px;
	}
	
	.card-body-footer i {
	    margin-right: 2px;
	}
	.icon-cheering{
		margin-left: 5px;
		width: 15px;
	    height: 15px;
		background: url("${pageContext.request.contextPath}/img/noun-heart.png") no-repeat;
		background-size: contain;
	}
	
	.icon-comments{
		margin-left: 5px;
		width: 15px;
	    height: 15px;
		background: url("${pageContext.request.contextPath}/img/noun-reply.png") no-repeat;
		background-size: contain;
	}
	
	.card-writedate {
		float: right;
	}
	
	
</style>
<script>
	
</script>
</head>
<body>
	<div class="container">
		<div class="category">
			<b style="color: #011aff;font-size: 20px;">Category</b>
			<div class="tags">
				<ul>
					<li class="btn-line">Travel</li>
					<li class="btn-line">Wealth</li>
					<li class="btn-line">Development</li>
					<li class="btn-line">Accomplishment</li>
					<li class="btn-line">Fun</li>
					<li class="btn-line">Eat</li>
				</ul>
			</div>
		</div>
		<div class="filter">
			<b style="color: #011aff;font-size: 20px;">Filter</b>
			<div>
				Filter1
			</div>
			<div>
				Filter2
			</div>
		</div>
		<div class="feed-list">
			<div class="card" onclick="location.href=''">
				<!-- 카드 헤더 -->
				<div class="card-header" style="background-image: "> <!-- 이미지 넣기 -->
					<div class = "card-header-is_group">
		                <img src="${pageContext.request.contextPath}/img/noun-people.png" width="40px">
		               	 2/5
		            </div>
				</div>
				<!--  카드 바디 -->
				<div class="card-body">
					<!--  카드 바디 헤더 -->
					<div class="card-body-header">
						<p>스카이다이빙하기 by 유저네임</p>
						<p class="card-body-category">여행</p>
					</div>
					<!--  카드 바디 푸터 -->
					<div class="card-body-footer">
						<hr style="margin-bottom: 8px; opacity: 0.5; border-color: #ddd">
						<i class="icon icon-cheering"></i>응원수
						<i class="icon icon-comments"></i>댓글수
						<i class="card-writedate">2018/04/12</i>
					</div>
				</div>
			</div>
			<div class="card" onclick="location.href=''">
				<!-- 카드 헤더 -->
				<div class="card-header" style="background-image: "> <!-- 이미지 넣기 -->
					<div class = "card-header-is_group">
		                <img src="${pageContext.request.contextPath}/img/noun-people.png" width="40px">
		               	 2/5
		            </div>
				</div>
				<!--  카드 바디 -->
				<div class="card-body">
					<!--  카드 바디 헤더 -->
					<div class="card-body-header">
						<p>스카이다이빙하기 by 유저네임</p>
						<p class="card-body-category">여행</p>
					</div>
					<!--  카드 바디 푸터 -->
					<div class="card-body-footer">
						<hr style="margin-bottom: 8px; opacity: 0.5; border-color: #ddd">
						<i class="icon icon-cheering"></i>응원수
						<i class="icon icon-comments"></i>댓글수
						<i class="card-writedate">2018/04/12</i>
					</div>
				</div>
			</div>
			<div class="card" onclick="location.href=''">
				<!-- 카드 헤더 -->
				<div class="card-header" style="background-image: "> <!-- 이미지 넣기 -->
					<div class = "card-header-is_group">
		                <img src="${pageContext.request.contextPath}/img/noun-people.png" width="40px">
		               	 2/5
		            </div>
				</div>
				<!--  카드 바디 -->
				<div class="card-body">
					<!--  카드 바디 헤더 -->
					<div class="card-body-header">
						<p>스카이다이빙하기 by 유저네임</p>
						<p class="card-body-category">여행</p>
					</div>
					<!--  카드 바디 푸터 -->
					<div class="card-body-footer">
						<hr style="margin-bottom: 8px; opacity: 0.5; border-color: #ddd">
						<i class="icon icon-cheering"></i>응원수
						<i class="icon icon-comments"></i>댓글수
						<i class="card-writedate">2018/04/12</i>
					</div>
				</div>
			</div>
			<div class="card" onclick="location.href=''">
				<!-- 카드 헤더 -->
				<div class="card-header" style="background-image: "> <!-- 이미지 넣기 -->
					<div class = "card-header-is_group">
		                <img src="${pageContext.request.contextPath}/img/noun-people.png" width="40px">
		               	 2/5
		            </div>
				</div>
				<!--  카드 바디 -->
				<div class="card-body">
					<!--  카드 바디 헤더 -->
					<div class="card-body-header">
						<p>스카이다이빙하기 by 유저네임</p>
						<p class="card-body-category">여행</p>
					</div>
					<!--  카드 바디 푸터 -->
					<div class="card-body-footer">
						<hr style="margin-bottom: 8px; opacity: 0.5; border-color: #ddd">
						<i class="icon icon-cheering"></i>응원수
						<i class="icon icon-comments"></i>댓글수
						<i class="card-writedate">2018/04/12</i>
					</div>
				</div>
			</div>
			<div class="card" onclick="location.href=''">
				<!-- 카드 헤더 -->
				<div class="card-header" style="background-image: "> <!-- 이미지 넣기 -->
					<div class = "card-header-is_group">
		                <img src="${pageContext.request.contextPath}/img/noun-people.png" width="40px">
		               	 2/5
		            </div>
				</div>
				<!--  카드 바디 -->
				<div class="card-body">
					<!--  카드 바디 헤더 -->
					<div class="card-body-header">
						<p>스카이다이빙하기 by 유저네임</p>
						<p class="card-body-category">여행</p>
					</div>
					<!--  카드 바디 푸터 -->
					<div class="card-body-footer">
						<hr style="margin-bottom: 8px; opacity: 0.5; border-color: #ddd">
						<i class="icon icon-cheering"></i>응원수
						<i class="icon icon-comments"></i>댓글수
						<i class="card-writedate">2018/04/12</i>
					</div>
				</div>
			</div>
			<div class="card" onclick="location.href=''">
				<!-- 카드 헤더 -->
				<div class="card-header" style="background-image: "> <!-- 이미지 넣기 -->
					<div class = "card-header-is_group">
		                <img src="${pageContext.request.contextPath}/img/noun-people.png" width="40px">
		               	 2/5
		            </div>
				</div>
				<!--  카드 바디 -->
				<div class="card-body">
					<!--  카드 바디 헤더 -->
					<div class="card-body-header">
						<p>스카이다이빙하기 by 유저네임</p>
						<p class="card-body-category">여행</p>
					</div>
					<!--  카드 바디 푸터 -->
					<div class="card-body-footer">
						<hr style="margin-bottom: 8px; opacity: 0.5; border-color: #ddd">
						<i class="icon icon-cheering"></i>응원수
						<i class="icon icon-comments"></i>댓글수
						<i class="card-writedate">2018/04/12</i>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>