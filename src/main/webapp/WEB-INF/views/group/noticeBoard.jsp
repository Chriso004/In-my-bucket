<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/group/noticeBoard.css">
<script src="https://kit.fontawesome.com/a10e09fadf.js"
	crossorigin="anonymous"></script>
<script>
	function leaveGroup() {
		const isLeave = confirm("탈퇴하시겠습니까?");
		if (isLeave)
			location.href = "/inmybucket/group/member/manage/leave?groupNo=${ bucketNo }";
	}
</script>
<div class="container">
	<div class="menu-container">
		<ul class="group-menu">
			<li class="info-btn"><a
				href="/inmybucket/group/main?groupNo=${ bucketNo }">정보</a></li>
			<li class="notice-btn"><a
				href="/inmybucket/group/noticeBoard?groupNo=${ bucketNo }">공지사항</a></li>
			<li class="board-btn"><a
				href="/inmybucket/group/boardList?groupNo=${ bucketNo }">게시판</a></li>
		</ul>

		<ul class="member-menu">
			<c:if test="${ isAdmin eq true }">
				<li class="member-manage"><a
					href="/inmybucket/group/member/manage?groupNo=${ bucketNo }">멤버관리</a></li>
			</c:if>
			<c:if test="${ isAdmin eq false }">
				<li class="leave-group"><a href="javascript:leaveGroup()">탈퇴하기</a></li>
			</c:if>
		</ul>
	</div>
	<div class="notice-header">
		<div class="notice-info">
			<span class="comment-count"><i class="fa-solid fa-star"></i> 총
				게시글 수 <b>${ noticeCnt }</b></span>
		</div>
		<c:if test="${ isAdmin eq true }">
			<div class="notice-write-container">
				<a href="/inmybucket/group/noticeWrite?groupNo=${ bucketNo }"><span
					class="notice-write">글쓰기</span></a>
			</div>
		</c:if>

	</div>
	<div class="notice-container">
		<ul class="notice-list">
			<c:forEach var="notice" items="${ noticeList }">
				<li class="type"><span>[공지사항]</span></li>
				<li class="title"><a
					href="/inmybucket/group/noticeBoard/view?boardNo=${ notice.group_board_no }&groupNo=${ notice.group_no }"><span>${ notice.group_title }</span></a></li>
			</c:forEach>
		</ul>
	</div>
</div>