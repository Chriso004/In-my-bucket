<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css"
	href="resources/css/mypage/mypage.css">
<div class="container">
	<div class="container-info-wrap">
		<!-- 		<div class="profile-info info">
			<span>나의 프로필</span>
		</div>
		<div class="summary-info info">
			<span>나의 활동 분석</span>
		</div> -->
	</div>
	<div class="info-container">
		<div class="profile-container">
			<form class="profile-form" action="mypage/profileUpdate.do" method="POST" enctype="multipart/form-data">
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
						<input type="file" name="filename" /> 
						<img src="resources/img/${ profileData.user_image_path }">
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
						<input type="text" class="status-message" name="status_message"
							value="${ profileData.status_message }" readonly>
					</div>
				</div>
			</form>
		</div>

		<div class="summary-container">
			<div class="summary-wrap">
				<div class="archieve-bucket bucket-summary">
					<div class="summary">
						<span><b>25</b>개</span>
					</div>
				</div>
				<div class="participate-bucket bucket-summary">
					<div class="summary">
						<span><b>5</b> / 100개</span>
					</div>

				</div>
				<div class="total-bucket bucket-summary">
					<div class="summary">
						<span><b>16</b>%</span>
					</div>
				</div>
			</div>
			<div class="description-wrap">
				<span class="description">달성한 버킷리스트 수</span> <span
					class="description">참여중인 버킷리스트 수</span> <span class="description">버킷리스트
					총 달성률</span>
			</div>
		</div>
	</div>
</div>
<script src="resources/js/mypage.js"></script>