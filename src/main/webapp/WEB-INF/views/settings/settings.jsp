<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	.boxs{
		display: flex;
		justify-content: space-between;
	}
	.account-box, .settings-box{
		display:inline-block;
		width: 45%;
		
		font-size:15px;
		
		border: 1px solid #000;
		border-radius: 30px;
		padding: 20px;
		background: #fff;
	}
	.account-box>span{
		color: #ddd;
	}
	.settings-profile, .settings-chat, .settings-update-account, .settings-delete-account {
		padding:10px 0;
		border-bottom: 1px solid #ddd;
	}
	
	.settings-box input[type=radio]{
		display: none;
	}
	.settings-box input[type=radio]+label{
		padding: 5px 15px;
		margin-left: 5px;
		
		font-size: 15px;
		line-height: 15px;
		color: #ddd;
		background: #fff;
		border: 1px solid #ddd;
		border-radius: 8px;
	}
	.settings-box input[type=radio]+label:hover {
		color:#000;
		border-color: #000;
	}
	.settings-box input[type=radio]:checked+label {
		color:#011aff;
		border-color: #011aff;
	}
	#delete-account{
		cursor: pointer;
		color: red;
	}
</style>
<script>
	function deleteAccount(){
		if(window.confirm("본인의 계정을 삭제하시겠습니까?\n(삭제 후 복구는 불가능합니다.)")){
			location.href="/inmybucket/register/removeForm";
		}
	}
</script>
<div class="container">
		<i class="icon icon-settings"></i><h2>사용자 환경설정</h2>
		<div class="boxs">
			<div class="account-box">
				<p>내 정보</p>
				<!-- 
				<span>이름</span>
				<p>${logName }</p>
				 -->
				<span>아이디</span>
				<p>${logId }</p>
				<span>이메일</span>
				<p>${logEmail }</p>
			</div>
			<div class="settings-box">
				<!-- 프로필 공개 여부 -->
				<div class="settings-profile">
					<span>프로필</span>
					<div style="float:right;">
						<input type="radio" id="profile-on" name="set-profile" value="on" checked><label for="profile-on">공개</label>
						<input type="radio" id="profile-off" name="set-profile" value="off"><label for="profile-off">비공개</label>
					</div>
				</div>
				<!-- 채팅 수신 여부 -->
				<div class="settings-chat">
					<span>채팅 수신</span>
					<div style="float:right;">
						<input type="radio" id="chat-on" name="set-chat" value="on" checked><label for="chat-on">허용</label>
						<input type="radio" id="chat-off" name="set-chat" value="off"><label for="chat-off">비허용</label>
					</div>
				</div>
				<!-- 회원정보 수정 -->
				<div class="settings-update-account">
					<a href="joinEdit">회원정보 수정</a>
				</div>
				<!-- 회원 탈퇴 -->
				<div class="settings-delete-account">
					<a id="delete-account" onclick="location.href='register/removeForm'">회원탈퇴</a>
				</div >
			</div>
		</div>
</div>