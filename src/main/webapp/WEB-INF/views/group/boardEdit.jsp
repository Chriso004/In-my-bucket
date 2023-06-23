<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/group/boardEdit.css">
<script>
	function leaveGroup() {
		const isLeave = confirm("탈퇴하시겠습니까?");
		if (isLeave)
			location.href = "/inmybucket/group/member/manage/leave?groupNo=${ groupNo }";
	}
</script>
<div class="container">
	<div class="menu-container">
		<ul class="group-menu">
			<li class="info-btn"><a
				href="/inmybucket/group/main?groupNo=${ groupNo }">정보</a></li>
			<li class="notice-btn"><a
				href="/inmybucket/group/noticeBoard?groupNo=${ groupNo }">공지사항</a></li>
			<li class="board-btn"><a
				href="/inmybucket/group/boardList?groupNo=${ groupNo }">게시판</a></li>
		</ul>

		<ul class="member-menu">
			<c:if test="${ isAdmin eq true }">
				<li class="member-manage"><a
					href="/inmybucket/group/member/manage?groupNo=${ groupNo }">멤버관리</a></li>
			</c:if>
			<c:if test="${ isAdmin eq false }">
				<li class="leave-group"><a href="javascript:leaveGroup()">탈퇴하기</a></li>
			</c:if>
		</ul>
	</div>
	<form action="/inmybucket/group/postBoard?groupNo=${ groupNo }"
		method="post">
		<input type="text" name="isnotice" value="${ isNotice }"
			style="display: none">
		<div class="title-container">
			<h5 class="title-h">제목</h5>
			<input type="text" id="group_title" name="group_title"
				placeholder="제목을 입력하세요.">
		</div>
		<div class="content-container">
			<h5 class="content-h">내용</h5>
			<textarea id="group_content" name="group_content"></textarea>
		</div>
		<div class="btn-container">
			<input type="submit" value="작성">
		</div>
	</form>
</div>