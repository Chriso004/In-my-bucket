<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/group/boardList.css">
<script src="https://kit.fontawesome.com/a10e09fadf.js"
	crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script>
	function leaveGroup() {
		const isLeave = confirm("탈퇴하시겠습니까?");
		if(isLeave)
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
	<div class="board-header">
		<div class="board-info">
			<span class="comment-count"><i class="fa-solid fa-star"></i> 총
				게시글 수 <b>${ boardCnt }</b></span>
		</div>
		<div class="board-write-container">
			<a href="/inmybucket/group//boardWrite?groupNo=${ bucketNo }"><span
				class="board-write">글쓰기</span></a>
		</div>
	</div>
	<div class="board-container">
		<ul class="board-list">
			<c:forEach var="board" items="${ boardList }">
				<li class="title"><a
					href="/inmybucket/group/boardList/view?boardNo=${ board.group_board_no }&groupNo=${ board.group_no }">${ board.group_title }</a></li>
				<li class="usernick">${ board.usernick }</li>
				<li class="writedate">${ board.group_writedate }</li>
			</c:forEach>
		</ul>
	</div>
</div>
<script src=""></script>