<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<style>
	/* 모달 배경 */
	.modal-bg{
		/* display: none; */
		width: 100%;
		height: 100vh;
		top:0;
		left:0;
		position: absolute;
		z-index:99;
		background-color: black;
		opacity: 0.5;
	}
	
	.modal-view{
		/* display: none; */
        width: 900px;
        height: 700px;
        border-radius: 30px;
        padding: 20px;
        position: absolute;
        
        top:50%;
        left: 50%;
        transform: translate(-50%,-50%);
        
        z-index: 999;
		background-color: #fff;
	}
	
	.modal_close{
		
		float:right;
		width: 40px;
		height: 40px;
		background-color: blue;
		background: url('${pageContext.request.contextPath }/img/icon_gg_close.png');
	}
	
	.modal-settings{
		margin: 20px auto;
		width: 600px;
	}
	.settings-box{
		margin-top: 70px;
	}
</style>


	<!-- 모달창 배경 -->
	<div class="modal-bg"></div>
	<!-- 모달창 -->
	<div class="modal-view">
		<!-- 닫기버튼 -->
    	<div class="modal_close">
    		<a class="" href="#"></a>
    	</div>
    	<!-- 내용 -->
    	<div class="modal-settings">
			<i class="icon icon-settings"></i><h2>사용자 환경설정</h2>
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
					<span>회원정보 수정</span>
				</div>
				<hr color="#ddd">
				<!-- 회원 탈퇴 -->
				<div class="setting-delete-account">
					<span style="color: red;">회원탈퇴</span>
				</div >
				<hr color="#ddd">
			</div>
		</div>
	</div>
