<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	.boxs{
		display: flex;
	}
	.account-box{
		display:inline-block;
		width:50%;
	}
	.account-box>span{
		color: #ddd;
	}

	.settings-box{
		width:50%;
	}
</style>
<script>
	$(function(){
		$("#delete-account").click(function(){
			alert("본인의 계정을 삭제하시겠습니까?\n(삭제 후 복구는 불가능합니다.)");
			/* 계정삭제 연결 */
		});
	});
</script>
<div class="container">
		<i class="icon icon-settings"></i><h2>사용자 환경설정</h2>
		<div class="boxs">
			<div class="account-box">
				<h4>내 정보</h4>
				<span>이름</span>
				<p>김채린</p> <!-- ${vo.username } -->
				<span>아이디</span>
				<p>chaerin0</p>
				<span>이메일</span>
				<p>chaerin0@gmail.com</p>
			</div>
			<div class="settings-box">
				<!-- 프로필 공개 여부 -->
				<div class="setting-chat">
					<span>프로필</span>
					<div style="float:right;">
						<input type="radio" id="profile-on" name="set-profile" value="on"><label for="profile-on">공개</label>
						<input type="radio" id="profile-off" name="set-profile" value="off"><label for="profile-off">비공개</label>
					</div>
				</div>
				<hr color="#ddd">
				<!-- 채팅 수신 여부 -->
				<div class="setting-chat">
					<span>채팅 수신</span>
					<div style="float:right;">
						<input type="radio" id="chat-on" name="set-chat" value="on"><label for="chat-on">받기</label>
						<input type="radio" id="chat-off" name="set-chat" value="off"><label for="chat-off">받지않기</label>
					</div>
				</div>
				<hr color="#ddd">
				<!-- 회원정보 수정 -->
				<div class="setting-update-account">
					<a href="/inmybucket/join/joinEdit">회원정보 수정</a>
				</div>
				<hr color="#ddd">
				<!-- 회원 탈퇴 -->
				<div class="setting-delete-account">
					<a id="delete-account" style="color: red;">회원탈퇴</a>
				</div >
				<hr color="#ddd">
			</div>
		</div>
</div>