<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
	.noscroll-container{
		height: 850px;
		
	}
	.log-title{
		position:absolute;
		font-family: 'Just Me Again Down Here', cursive;
		font-size: 96px;
		top:-50px;
		left:50%;
		text-align:center;
		width:100%;
		transform: translate(-50%,-50%);
		color: #011aff;
	}
	.log-box{
		position:absolute;
		left:50%;
		top:50%;
		transform: translate(-50%,-40%);
		
		width: 650px;
		height: 500px;
		padding: 20px;
		
		border: 1px solid #000;
		border-radius: 30px;
		background-color:#fff;
		box-shadow: 0px 10px 20px 7px rgba(0, 0, 0, 0.25);
		
		font-size: 15px;
		text-align: center;
	}
	#removeForm{
		width: 70%;
		margin: 150px auto 0;
	}
	#removeForm input{
		width: 350px;
	}
	#removeForm li{
		display: block;
	}
	#removeForm li:nth-child(-n+2){
		margin-bottom: 30px;	
	}
	#userid, #userpwd{
		border:0;
		border-bottom: 1px solid #000;
		padding: 8px 5px;
	}
	#btn-delete-account{
		padding: 8px 30px;
		color: #fff;
		background: #000;
		margin-top: 30px;
		border-radius: 20px;
		border: 1px solid #000;
		cursor: pointer;
		font-size:15px;
		
		width: 360px;
	}
</style>
<script>

	$(function(){
		
		
		
	
		
		//유호성 검사
		$("#removeForm").submit(function(){
				//비밀번호
				if($("#userpwd").val()==""){
					alert("비밀번호를 입력하셔야 탈퇴가 가능합니다.");
					return false;
				}
				if(confirm("본인의 계정을 삭제하시겠습니까?\n(삭제 후 복구는 불가능합니다.)")==true){
					//form태그의 action속성 설정
					$("#removeForm").attr("action","remove");
				}else{
					return false;
				}		
		});
	});
	
	
</script>
</head>
<body>
<div class="noscroll-container">
	<div class="log-box">
	<div class="log-title">See You Later!</div>
	<form method="post"  id="removeForm">
	<ul>
		<li>
			<input type="text" name="userid" id="userid" minlength="8" maxlength="15" value="${ logId}" readonly/>
		</li>
		<li><input type="password" name="userpwd" id="userpwd" placeholder="비밀번호"/></li>
		<li>
			<input type="submit" value="탈퇴하기" id="btn-delete-account"/>
		</li>
	</ul>
	</form>
	</div>
</div>
