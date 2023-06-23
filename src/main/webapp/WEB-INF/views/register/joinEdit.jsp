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
		height: 650px;
		padding: 20px;
		
		border: 1px solid #000;
		border-radius: 30px;
		background-color:#fff;
		box-shadow: 0px 10px 20px 7px rgba(0, 0, 0, 0.25);
		
		font-size: 15px;
		text-align: center;
	}
	#joinEditForm{
		width: 70%;
		margin: 70px auto 0;
	}
	#joinEditForm input{
		width: 350px;
	}
	#joinEditForm li{
		display: block;
	}
	#joinEditForm li:nth-child(-n+6){
		margin-bottom: 30px;	
	}
	#joinEditForm button{
		width: 350px;
	}
	#userid, #userpwd, #userpwd1, #username, #usernick, #email{
		border:0;
		border-bottom: 1px solid #000;
		padding: 8px 5px;
	}
	
	#s1{
		padding: 8px 30px;
		color: #fff;
		background: #000;
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
		$("#joinEditForm").submit(function(){
			
			
				//비밀번호
				if($("#userpwd1").val()==""){
					alert("비밀번호를 입력하셔야 회원정보 수정이 가능합니다.");
					return false;
				}
				
				
				
				//이메일
				// 아이디 6~15글자까지, @, co.kr, com, net, go.kr
				//									()? -> 있어도 없어도됨
				reg = /^\w{6,15}@[a-zA-Z]{2,8}.[a-z]{2,5}(.[a-z]{2,5})?$/
				if(!reg.test($("#email").val())){
					alert("이메일을 잘못입력하였습니다.");
					return false;
				}
				
				
				
				//form태그의 action속성 설정
				$("#joinEditForm").attr("action","joinEditOk");
				
		});
	});
	/* function removeMember(){
		if(window.confirm("탈퇴하시겠습니까?")){
			location.href="/inmybucket/register/removeForm";
		}
	} */
</script>

<div class="noscroll-container">
<div class="log-box">
	<div class="log-title">Welcome!</div>
	<form method="post" id="joinEditForm">
	<ul>
		
		<li>
			<input type="text" name="userid" id="userid" minlength="8" maxlength="15" value="${vo.userid }" readonly/>
		</li>
		
		<li><input type="password" name="userpwd1" id="userpwd1" minlength="8" maxlength="15" placeholder="비밀번호"/></li>
		
		<li><input type="password" name="userpwd" id="userpwd" minlength="8" maxlength="15" placeholder="변경할 비밀번호"/></li>
		
		<li><input type="text" name="username" id="username" minlength="2" maxlength="10" value="${vo.username }" readonly/></li>
		
		<li><input type="text" name="usernick" id="usernick" minlength="2" maxlength="8" value="${vo.usernick }"/></li>
		
		<li><input type="text" name="email" id="email" value="${vo.email }" readonly/></li>
		
	
		<li>
			<input type="submit" value="회원정보수정하기" id="s1"/>
		</li>
	</ul>
	</form>
	</div>
</div>
