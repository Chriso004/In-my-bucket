<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/group/memberManage.css">
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
			<li class="member-manage"><a href="/inmybucket/group/member/manage?groupNo=${ groupNo }">멤버관리</a></li>
		</ul>
	</div>
	<div class="member-container">
		<ul class="member-list">
			<li class="menu-title">참여자 목록</li>
			<c:forEach var="member" items="${ memberList }">
				<li class="user-info">${ member.usernick }(@${ member.userid })</li>
				<li class="registerdate">${ member.registerdate }</li>
				<li class="kick-btn"><a href="/inmybucket/group/member/manage/kick?userid=${ member.userid }&groupNo=${ groupNo }">추방하기</a></li>
			</c:forEach>
		</ul>
	</div>
	<div class="queue-container">
		<ul class="queue-list">
			<li class="menu-title">참여 수락 요청</li>
			<c:forEach var="queue" items="${ queueList }">
				<li class="user-info">${ queue.usernick }(@${ queue.userid })</li>
				<li class="accept-btn"><a href="/inmybucket/group/member/manage/approve?userid=${ queue.userid }&groupNo=${ groupNo }">승인</a></li>
				<li class="denied-btn"><a href="/inmybucket/group/member/manage/denied?userid=${ queue.userid }&groupNo=${ groupNo }">거부</a></li>
			</c:forEach>
		</ul>
	</div>
</div>