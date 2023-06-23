<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/inmybucket/resources/css/mypage.css" type="text/css"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
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
		url : "mypage",
		method : "GET",
		data : "pageNum="+currentPage+"&userid=${profileData.userid}&bucketList=${bucketList}&listFilter=${vo.listFilter}&listSort=${vo.listSort}",
		// mypage.jsp가 data로 들어옴
		success : function(data){
			
						
			// 피드에 카드 추가
			var tags = "";
			
			tags += '<c:forEach var="fDTO" items="${list }">';
			tags += '	<div class="card" onclick="location.href=\'bucket/bucketView/${fDTO.bucket_no}\'" data-no="${fDTO.bucket_no }">';
							<!-- 카드 헤더 -->
			tags += '		<div class="card-header" style="background: url(\'/inmybucket/resources/img/img_ex.jpeg\');background-size:contain;">';
			tags += '			<c:if test="${fDTO.isgroup==true }">';
			tags += '				<div class = "card-header-is_group">';
			tags += '            	<img src="/inmybucket/resources/img/icon_group.png" width="50px">';
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
			tags += '				<i class="icon icon-comments"></i>${fDTO.comment_count }';
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

</script>
<div class="container">
	<!-- 상단 -->
	<div class="info-container">
		<!-- 프로필 -->
		
		<div class="profile-container">
				<div class="profile-title">
					<span class="title-font">나의 프로필</span>
				</div>
				<form class="profile-form" action="mypage/profileUpdate.do" method="POST" ><!-- enctype="multipart/form-data" -->
					<div class="profile-header">
						<button type="button" class="edit-profile">
							<span>프로필 편집</span>
						</button>
						<button type="submit" class="edit-submit">
							<span>편집 완료</span>
						</button>
					</div>
					<div class="image-container">
						<div class="image-wrap">
							<input type="file" name="filename"/><!-- 추후 파일업로드 기능 추가 -->
							<c:choose>
								<c:when test="${profileData.user_image_path }!=null">
									<img src="${pageContext.request.contextPath}/uploadfile/${profileData.user_image_path}">
								</c:when>
								<c:otherwise>
									<img src="${pageContext.request.contextPath}/resources/img/blank-profile.jpg">
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="message-container">
						<div class="message-wrap">
							<input type="hidden" name="userid" value=${ profileData.userid }>
							<input type="text" class="nickname" name="nickname" 
								value="${ usernick }" readonly><span 
								class="welcome-message">님 환영합니다!</span>
						</div>
					</div>
					<div class="status-container">
						<div class="status-message-container">
							<input type="text" class="status-message" name="status_message" value="${ profileData.status_message }" readonly>
						</div>
					</div>
				</form>
		</div>
	
		<!-- 활동 요약 -->
		
		<div class="summary-container">
			<div class="summary-title">
				<span class="title-font">나의 활동 분석</span>
			</div>
			<div class="summary-wrap">
				<div class="bucket-summary">
					<div class="sum-info" style="border-color: #A6AFFF">
						<span><b>${userData.bucketCountAll }</b> 개</span>
					</div>
					<span class="sum-desc">등록한 버킷리스트 수</span>
				</div>
				<div class="bucket-summary">
					<div class="sum-info" style="border-color: #794AFF">
						<span><b>${userData.bucketCountGroup }</b> 개</span>
					</div>
					<span class="sum-desc">참여중인 버킷리스트 수</span>
				</div>
				<div class="bucket-summary">
					<div class="sum-info" style="border-color: #001AFF">
						<span><b>${userData.bucketAccomplishedRate }</b> %</span>
					</div>
					<span class="sum-desc">버킷리스트 총 달성률</span>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 채린 추가 -->
	<!-- 하단 -->
	<div class="list-container">
		<!-- 필터링 -->
		<form method="get" id="filter-form">
			<!-- 나의 버킷 / 응원 버킷 -->
			<div class="select-option">
				<div class="select-title">
						<input type="radio" id="b-mine" name=bucketList value="mine" onchange="this.form.submit()" ${bucketList eq 'mine' or empty bucketList? 'checked' : ''}><label for="b-mine" class="title-font">나의 버킷리스트</label>
						<input type="radio" id="b-like" name=bucketList value="like" onchange="this.form.submit()" ${bucketList eq 'like' ? 'checked' : ''}><label for="b-like" class="title-font">응원 버킷리스트</label>
				</div>
			</div>
			<!-- 필터링 -->
			<div class="row-filter">
				<div class="select-filter">
					<select class="select-list-filter" name="listFilter" onchange="this.form.submit()">
						<option value="all" ${vo.listFilter eq 'all' ? 'selected' : ''}>모든 버킷리스트</option>
						<option value="0" ${vo.listFilter eq '0' ? 'selected' : ''}>일반 버킷리스트</option>
						<option value="1" ${vo.listFilter eq '1' ? 'selected' : ''}>그룹 버킷리스트</option>
					</select>
					<select class="select-list-sort" name="listSort" onchange="this.form.submit()">
						<option value="recent" ${vo.listSort eq 'recent' ? 'selected' : ''}>최신순</option>
						<option value="like" ${vo.listSort eq 'like' ? 'selected' : ''}>응원순</option>
					</select>
				</div>
				<!-- 버킷리스트 추가 -->
				<div class="bucket-write-button">
					<button type="button" onclick="location.href='bucketWrite'">+ 버킷리스트 추가</button>
				</div>
			</div>
			<!-- userid 정보 -->
			<input type="hidden" name="userid" value="${profileData.userid }">
		</form>
			<!--  필터링 정보 -->
			<input type="hidden" name="listFilter" value="${vo.listFilter }">
			<input type="hidden" name="listSort" value="${vo.listSort }">
			<input type="hidden" name="bucketList" value="${bucketList }">
		
		<!-- 결과있으면 피드리스트, 없으면 결과없음 문구 -->
		<c:choose>
			<c:when test="${vo.feedCount>0 }">
				<div class="feed-list">
						<!-- 피드리스트 (초기12개) -->
				</div>
			</c:when>
			<c:otherwise>
				<div class="no-result">
					<span class="material-symbols-outlined">search_off</span><br>
					<i>해당되는 버킷리스트가 없습니다.</i>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</div>
<script type="text/javascript" src="/inmybucket/resources/js/mypage.js"></script>