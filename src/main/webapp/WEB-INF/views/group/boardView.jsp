<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/group/boardView.css">
<script src="https://kit.fontawesome.com/a10e09fadf.js"
	crossorigin="anonymous"></script>
<script>
	function leaveGroup() {
		const isLeave = confirm("탈퇴하시겠습니까?");
		if (isLeave)
			location.href = "/inmybucket/group/member/manage/leave?groupNo=${ boardInfo.group_no }";
	}

	function updateComment() {
		const updateForm = document.querySelector(".form-container");
		const commentBody = document.querySelector(".comment-body");

		if (updateForm.style.display == "none") {
			updateForm.style.display = "block";
			commentBody.style.display = "none";
		} else {
			updateForm.style.display = "none";
			commentBody.style.display = "block";
		}

	}
</script>
<div class="container">
	<div class="menu-container">
		<ul class="group-menu">
			<li class="info-btn"><a
				href="/inmybucket/group/main?groupNo=${ boardInfo.group_no }">정보</a></li>
			<li class="notice-btn"><a
				href="/inmybucket/group/noticeBoard?groupNo=${ boardInfo.group_no }">공지사항</a></li>
			<li class="board-btn"><a
				href="/inmybucket/group/boardList?groupNo=${ boardInfo.group_no }">게시판</a></li>
		</ul>
		<ul class="member-menu">
			<c:if test="${ isAdmin eq true }">
				<li class="member-manage"><a
					href="/inmybucket/group/member/manage?groupNo=${ boardInfo.group_no }">멤버관리</a></li>
			</c:if>
			<c:if test="${ isAdmin eq false }">
				<li class="leave-group"><a href="javascript:leaveGroup()">탈퇴하기</a></li>
			</c:if>
		</ul>
	</div>
	<div class="board-container">
		<div class="board-header">
			<div class="board-title">
				<span class="title">${ boardInfo.group_title }</span>
			</div>
			<div class="info-container">
				<div class="info-left">
					<span class="nickname">${ boardInfo.usernick }</span> <span
						class="writedate">${ boardInfo.group_writedate }</span>
				</div>
				<c:if test="${ isAdmin eq true or isAuthor eq true}">
					<div class="board-manage-container">
						<a
							href="/inmybucket/group/updateBoard?boardNo=${ boardInfo.group_board_no }&groupNo=${ boardInfo.group_no }"><span
							class="board-update">수정</span></a> <a
							href="/inmybucket/group/deleteBoard?boardNo=${ boardInfo.group_board_no }&groupNo=${ boardInfo.group_no }"><span
							class="board-delete">삭제</span></a>
					</div>
				</c:if>
			</div>
		</div>
		<div class="board-body">
			<div class="content-container">
				<span class="content">${ boardInfo.group_content }</span>
			</div>
		</div>
	</div>
	<div class="board-comment-input">
		<form
			action="/inmybucket/group/board/comment/post?boardNo=${ boardInfo.group_board_no }&groupNo=${ boardInfo.group_no }"
			method="post">
			<input type="text" name="group_no" value="${ boardInfo.group_no }"
				style="display: none"> <input type="text"
				name="group_board_no" value="${ boardInfo.group_board_no }"
				style="display: none"> <input type="text"
				class="comment-content" name="group_comment_content"
				placeholder="댓글을 입력해주세요."> <input type="submit"
				class="submit-btn" value="등록">
		</form>
	</div>
	<div class="comment-count-container">
		<span class="comment-count"><i class="fa-solid fa-comments"></i>
			총 댓글 수 <b>${ commentCount }</b></span>
	</div>
	<div class="comment-list-container">
		<c:forEach var="comment" items="${ commentList }">
			<div class="comment-wrap">
				<div class="comment-header">
					<div class="user-info">${ comment.usernick }(@${ comment.userid })</div>
					<div class="comment-writedate">${ comment.group_comment_writedate }</div>
				</div>
				<div class="comment-container">
					<div class="form-container" style="display: none;">
						<form class="comment-update-form"
							action="/inmybucket/group/board/comment/update?&groupNo=${ boardInfo.group_no }"
							method="post">
							<input type="text" name="group_comment_no"
								value="${ comment.group_comment_no }" style="display: none">
							<input type="text" name="group_no"
								value="${ boardInfo.group_no }" style="display: none"> 
							<input
								type="text" name="group_board_no"
								value="${ boardInfo.group_board_no }" style="display: none">
							<input type="text" class="comment-content"
								name="group_comment_content"
								value="${ comment.group_comment_content }"> 
							<input
								type="submit" class="submit-btn" value="수정">
						</form>
					</div>
					<div class="comment-body"><span class="comment-span">${ comment.group_comment_content }</span></div>
					<c:if test="${ isCommentAuthor eq true }">
						<div class="comment-manage-container">
							<a class="update-btn" href="javascript:updateComment()"> <span
								class="comment-update">수정</span>
							</a> <a
								href="/inmybucket/group/board/comment/delete?&boardNo=${ comment.group_board_no }&groupNo=${ comment.group_no }&commentNo=${ comment.group_comment_no }">
								<span class="comment-delete">삭제</span>
							</a>
						</div>
					</c:if>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
