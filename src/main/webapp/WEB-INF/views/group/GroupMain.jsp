<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/group/groupMain.css">
<script src="https://kit.fontawesome.com/a10e09fadf.js"
	crossorigin="anonymous"></script>
<script>
	function leaveGroup() {
		const isLeave = confirm("탈퇴하시겠습니까?");
		if(isLeave)
			location.href = "/inmybucket/group/member/manage/leave?groupNo=${ bucketInfo.bucket_no }";
	}
</script>
<div class="container">
	<div class="menu-container">
		<ul class="group-menu">
			<li class="info-btn"><a
				href="/inmybucket/group/main?groupNo=${ bucketInfo.bucket_no }">정보</a></li>
			<li class="notice-btn"><a
				href="/inmybucket/group/noticeBoard?groupNo=${ bucketInfo.bucket_no }">공지사항</a></li>
			<li class="board-btn"><a
				href="/inmybucket/group/boardList?groupNo=${ bucketInfo.bucket_no }">게시판</a></li>
		</ul>
		<ul class="member-menu">
			<c:if test="${ isAdmin eq true }">
				<li class="member-manage"><a
					href="/inmybucket/group/member/manage?groupNo=${ bucketInfo.bucket_no }">멤버관리</a></li>
			</c:if>
			<c:if test="${ isAdmin eq false }">
				<li class="leave-group"><a href="javascript:leaveGroup()">탈퇴하기</a></li>
			</c:if>
		</ul>
	</div>
	<div class="bucket-container">
		<div class="board-header">
			<div class="board-title">
				<span class="title">${ bucketInfo.title }</span>
			</div>
			<div class="info-container">
				<div class="info-left">
					<span class="nickname">${ nickname }</span> <span class="writedate">${ bucketInfo.bucket_writedate }</span>
				</div>
				<div class="info-right">
					<ul class="info-list">
						<li>${ bucketInfo.category }</li>
						<c:set var="status" value="${ bucketInfo.progress_status }" />
						<c:choose>
							<c:when test="${ status eq '0'.charAt(0) }">
								<li>목표</li>
							</c:when>
							<c:when test="${ status eq '1'.charAt(0) }">
								<li>진행 중 ${ bucketInfo.progress }%</li>
							</c:when>
							<c:when test="${ status eq '2'.charAt(0) }">
								<li>완료</li>
							</c:when>
						</c:choose>
						<li><i class="fa-solid fa-heart" style="color: #ff0000;"></i>
							${ bucketInfo.like_count }</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="board-body">
			<div class="content-container">
				<span class="content">${ bucketInfo.content }</span>
			</div>
		</div>
	</div>
</div>
