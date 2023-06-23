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
		
		width:650px;
		height: 450px;
		padding: 20px;
		
		border: 1px solid #000;
		border-radius: 30px;
		background-color:#fff;
		box-shadow: 0px 10px 20px 7px rgba(0, 0, 0, 0.25);
		
		font-size: 15px;
		
	}
	
	#username, #email{
		border:0;
		border-bottom: 1px solid #000;
		padding: 8px 5px;
		
	}
	
	#button{
		padding: 8px 30px;
		color: #fff;
		background: #000;
		border-radius: 20px;
		border: 1px solid #000;
		cursor: pointer;
		font-size:15px;
		
		width: 360px;
	}
	#psSearch{
		width: 70%;
		margin: 140px auto 0 140px;
	}
	#psSearch input{
		width: 350px;
	}
	#psSearch li{
		display: block;
	}
	#psSearch li:nth-child(2n){
		margin-bottom: 30px;	
	}
</style>

<script>
	$(function(){
		$("#psSearch").submit(function(){
			event.preventDefault();
			
			if($("#username").val()==""){
				alert("이름을 입력하세요...");
				return false;
			}
			if($("#email").val()==""){
				alert("이메일을 입력하세요...");
				return false;
			}
			
			var url = 'psSearchEmailSend';
			var params = $("#psSearch").serialize();
			
			$.ajax({
				url : url,
				data : params,
				type : 'POST', 
				success:function(result){
					if(result=='Y'){
						alert("이메일로 비밀번호를 전송하였습니다.");
						location.href="/inmybucket/loginForm";
					}else{
						alert("존재하지 않는 정보입니다.");
					}
				},error:function(e){
					console.log(e.responseText);
				}
			});
		});
	});
</script>
</head>
<body>
<div class="noscroll-container">
<div class="log-box">
<div class="log-title">Welcome Back!</div>
	
	<form method="post" id="psSearch">
	<ul>
		<li>이름</li>
		<li><input type="text" name="username" id="username"/></li>
		<li>이메일</li>
		<li><input type="text" name="email" id="email"/></li>
		<li><input type="submit" value="비밀번호찾기" id="button"/></li>
	</ul>
	</form>
</div>
</div>