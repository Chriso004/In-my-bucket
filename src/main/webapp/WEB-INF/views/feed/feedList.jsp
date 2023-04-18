<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>

	/* 사용자 검색 결과 */
	.user-list{
		display:inline-block;
		padding: 20px 50px;
		margin:20px 0;
		
	}
	.mini-profile{
		/* display: inline-block; */
		float:left;
		width:160px;
		height:200px;
		padding:20px;
		background-color: #fff;
		text-align: center;
		
		border: 1px solid #000;
		border-radius: 20px;
	}
	
	.mini-profile-img{
		width: 160px;
		height: 160px;
		border-radius:80px;
		background-repeat: no-repeat;
		text-align: center;
	}
	.mini-profile-usernick{
		margin-top:20px;
	}
	
	/* 카테고리 */
	.select-category{
		padding-bottom: 30px;
	}
	.select-category input[type=radio]{
		display: none;
	}
	.select-category input[type=radio]+label{
		display: inline-block;
		padding: 10px 30px;
		margin: 0 20px 0 0;
		
		font-size: 15px;
		line-height: 15px;
		color: #000;
		background: #fff;
		border-radius: 17.5px;
		border: 1px solid #000;
	}
	.select-category input[type=radio]+label:hover{
		color: #011aff;
		border-color: #011aff;
	}
	.select-category input[type=radio]:checked+label{
		color: #011aff;
		font-weight:bold;
		border-width: 2px;
		border-color: #011aff;
	}

	/* 버킷리스트 피드 */
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
	    border-radius:30px;
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
	
	
	.card-body-header>.card-body-title{
	 	overflow: hidden; /* 제목길면 말줄임표 붙이기 */
	  	text-overflow: ellipsis;
	  	white-space: nowrap;
  	}
  	
  	.card-body-header .card-body-category{
  		margin-left: 10px;
  		padding:2px 5px;
	 	border: 1px solid blue;
	 	border-radius:10px;
	 	color: blue;
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
	
	/* 결과 없음 문구 */
	.no-result{
		margin:80px auto;
		text-align: center;
		font-size: 15px;
		color:gray;
	}
	
</style>
<script>
	// --------------------------------------< 무한 스크롤
	let currentPage = 1; // 현재페이지
	let isLoading = false; // 로딩중 여부
	
	// 스크롤시 호출되는 함수
	$(window).on("scroll",function(){
		let scrollTop = $(window).scrollTop(); // 위로 스크롤된 길이
		let windowHeight = $(window).height(); // 윈도우 창 높이
		let documentHeight = $(document).height(); // 도큐먼트 창 높이
		let isBottom = scrollTop + windowHeight + 10 >= documentHeight; // 바닥까지 스크롤되었는지 여부
		
		if(isBottom){
			// 현재페이지가 마지막페이지이면
			if(currentPage == ${vo.totalPageCount} || isLoading){ 
				return; // 함수끝
			}
			// 아니면
			isLoading = true; // 로딩중
			currentPage++; // 페이지번호 1 증가
			console.log("inscroll"+currentPage); // 콘솔 -> 몇 페이지로 스크롤했다.
			GetList(currentPage); // 리스트 추가
		}
		
	});
	
	// 리스트 추가 함수
	const GetList = function(currentPage){
		console.log("inGetList"+currentPage); // 콘솔 -> 몇 페이지를 불러왔다.
		
		// 받아올 ajax페이지 요청
		$.ajax({
			url : "feedList",
			method : "GET",
			data : "pageNum="+currentPage+"&category=${category}&listFilter=${listFilter}&listSort=${listSort}&searchWord=${searchWord}",
			// feedList.jsp가 data로 들어옴
			success : function(data){
				
							
				// 피드에 카드 추가
				var tags = "";
				
				tags += '<c:forEach var="fDTO" items="${list }">';
				tags += '	<div class="card" onclick="location.href=\'\'" data-no="${fDTO.no }">';
								<!-- 카드 헤더 -->
				tags += '		<div class="card-header" style="background: url(\'${pageContext.request.contextPath}/img/img_ex.jpeg\');background-size:contain;">';
				tags += '			<c:if test="${fDTO.isgroup==1 }">';
				tags += '				<div class = "card-header-is_group">';
				tags += '            	<img src="${pageContext.request.contextPath}/img/noun-people.png" width="40px">';
				tags += '        		</div>';
				tags += '       	</c:if>';
				tags += '		</div>';
								<!--  카드 바디 -->
				tags += '		<div class="card-body">';
									<!--  카드 바디 헤더 -->
				tags += '			<div class="card-body-header">';
				tags += '				<p class="card-body-title">${fDTO.title }</p>';
				tags += '				<p>@${fDTO.userid }<span class="card-body-category">${fDTO.category }</span></p>';
				tags += '			</div>';
									<!--  카드 바디 푸터 -->
				tags += '			<div class="card-body-footer">';
				tags += '				<hr style="margin-bottom: 8px; opacity: 0.5; border-color: #ddd">';
				tags += '				<i class="icon icon-cheering"></i>${fDTO.like_count }';
				tags += '				<i class="icon icon-comments"></i>댓글수';
				tags += '				<i class="card-writedate">${fDTO.writedate }</i>';
				tags += '			</div>';
				tags += '		</div>';
				tags += '	</div>';
				tags += '</c:forEach>';
				
				$(".feed-list").append(tags); // .feed-list안에 html 추가
				

				isLoading = false; // 로딩중 아님
				console.log("ajax");
			},
			error : function(e){
				console.log(e.responseText);
			}
		}); // ajax
		
	} // GetList
	
	$(document).ready(function(){
		GetList(1);
	});
	
	// --------------------------------------< 무한 스크롤
	// --------------------------------------< 클릭시 유저페이지 연결
	/* var moveUserPage = function(userid){
		location.href="userPage?userid="+userid;
	}; */
	// --------------------------------------< 클릭시 유저페이지 연결
	$(function(){
		
	});
	
	
</script>

	<div class="container">
		<!-- 검색어가 있을 때(유저검색) -->
		<c:if test="${not empty vo.searchWord}">
			<p style="margin:20px auto;text-align: center;">검색어 <span style="color:blue">"${vo.searchWord }"</span>를 포함한 <span style="color:blue">${vo.userCount }명</span>의 사용자가 검색되었습니다.</p>
			<div class="user-list">
				<c:forEach var="uDTO" items="${userList }">
					<div class="mini-profile">
						<div class="mini-profile-img" style="background:blue"></div>
						<div class="mini-profile-usernick">@${uDTO.usernick }</div>
					</div>
				</c:forEach>
			</div>
			<hr>
			<p style="margin:20px auto;text-align: center;">검색어 <span style="color:blue">"${vo.searchWord }"</span>를 포함한 <span style="color:blue">${vo.feedCount }개</span>의 버킷리스트가 검색되었습니다.</p>
		</c:if>
		
		<!-- 필터링 -->
		<form method="get" id="filter-form">
			<!-- 카테고리 -->
			<div class="select-category">
				<b style="color: #011aff;font-size: 20px;">Category</b>
				<div class="tags">
						<input type="radio" id="cat" name=category value="all" onchange="this.form.submit()" ${vo.category eq 'all' ? 'checked' : ''}><label for="cat">All</label>
						<input type="radio" id="cat1" name=category value="travel" onchange="this.form.submit()" ${vo.category eq 'travel' ? 'checked' : ''}><label for="cat1">Travel</label>
						<input type="radio" id="cat2" name=category value="wealth" onchange="this.form.submit()" ${vo.category eq 'wealth' ? 'checked' : ''}><label for="cat2">Wealth</label>
						<input type="radio" id="cat3" name=category value="development" onchange="this.form.submit()" ${vo.category eq'development' ? 'checked' : ''}><label for="cat3">Development</label>
						<input type="radio" id="cat4" name=category value="accomplishment" onchange="this.form.submit()" ${vo.category eq 'accomplishment' ? 'checked' : ''}><label for="cat4">Accomplishment</label>
						<input type="radio" id="cat5" name=category value="fun" onchange="this.form.submit()" ${vo.category eq 'fun' ? 'checked' : ''}><label for="cat5">Fun</label>
						<input type="radio" id="cat6" name=category value="eat" onchange="this.form.submit()" ${vo.category eq 'eat' ? 'checked' : ''}><label for="cat6">Eat</label>
				</div>
			</div>
			<!-- 필터링 -->
			<b style="color: #011aff;font-size: 20px;">Filter</b>
			<div class="row-filter" style="display:flex;justify-content: space-between;">
				<div class="selet-filter">
					<select name="listFilter" onchange="this.form.submit()">
						<option value="all" ${vo.listFilter eq 'all' ? 'selected' : ''}>모든 버킷리스트</option>
						<option value="0" ${vo.listFilter eq '0' ? 'selected' : ''}>일반 버킷리스트</option>
						<option value="1" ${vo.listFilter eq '1' ? 'selected' : ''}>그룹 버킷리스트</option>
					</select>
					<select name="listSort" onchange="this.form.submit()">
						<option value="recent" ${vo.listSort eq 'recent' ? 'selected' : ''}>최신순</option>
						<option value="like" ${vo.listSort eq 'like' ? 'selected' : ''}>응원순</option>
					</select>
				</div>
				<!-- 보여지는 총 게시물 수 -->
				<div class="total-record">
					총 <b style="color:blue">${vo.feedCount }</b> 개의 버킷리스트
				</div>
			</div>
			<!-- 검색 정보 -->
			<input type="hidden" name="searchWord" value="${vo.searchWord }">
		</form>
			<!--  필터링 정보 -->
			<input type="hidden" name="category" value="${vo.category }">
			<input type="hidden" name="listFilter" value="${vo.listFilter }">
			<input type="hidden" name="listSort" value="${vo.listSort }">
		
		
		<!-- 피드 결과 없음 문구 -->
		<c:if test="${vo.feedCount==0 }">
			<div class="no-result">
				<img src="${pageContext.request.contextPath}/img/no_result.png" width="150px"><br>
				<i>해당되는 버킷리스트가 없습니다.</i>
			</div>
		</c:if>
		
		<!-- 피드리스트 (초기12개) -->
		<div class="feed-list" onload="">
				<!-- 카드 예시 -->
				<c:forEach var="fDTO" items="${list }">
					<div class="card" onclick="location.href=''" data-no="${fDTO.no }" style="border:3px solid red">
						<!-- 카드 헤더 -->
						<div class="card-header" style="background: url('${pageContext.request.contextPath}/img/img_ex.jpeg');background-size:contain;"> <!-- 이미지 넣기 -->
							<c:if test="${fDTO.isgroup==1 }">
								<div class = "card-header-is_group">
					                <img src="${pageContext.request.contextPath}/img/noun-people.png" width="40px">
					            </div>
					           </c:if>
						</div>
						<!--  카드 바디 -->
						<div class="card-body">
							<!--  카드 바디 헤더 -->
							<div class="card-body-header">
								<p class="card-body-title">${fDTO.title }</p>
								<p>@${fDTO.userid }<span class="card-body-category">${fDTO.category }</span></p>
							</div>
							<!--  카드 바디 푸터 -->
							<div class="card-body-footer">
								<hr style="margin-bottom: 8px; opacity: 0.5; border-color: #ddd">
								<i class="icon icon-cheering"></i>${fDTO.like_count }
								<i class="icon icon-comments"></i>0 <!-- ! 댓글수 넣어야함 -->
								<i class="card-writedate">${fDTO.writedate }</i>
							</div>
						</div>
					</div>
				</c:forEach>
		</div>
	</div>
	