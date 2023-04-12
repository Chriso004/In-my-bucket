<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정폼</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<style>
	#joinEditForm ul{
		overflow:auto;
	}
	#joinEditForm li{
		float:left;
		width:20%;
		padding:10px 0;	
		border-bottom:1px solid gray;
		line-height:40px;
	}
	#joinEditForm li:nth-child(2n){
		width:80%;
	}
	#joinEditForm li:last-child{
		width:100%;
	}
	
</style>
<script>
	$(function(){
		
	
		
		//유호성 검사
		$("#joinEditForm").submit(function(){
			
			
				//비밀번호
				if($("#userpwd").val()==""){
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
</script>
</head>
<body>
<div>
	<h1>회원정보수정 폼</h1>
	<form method="post" id="joinEditForm">
	<ul>
		<li>아이디</li>
		<li>
			<input type="text" name="userid" id="userid" minlength="8" maxlength="15" value="${vo.userid }" readonly/>
		</li>
		<li>비밀번호</li>
		<li><input type="password" name="userpwd" id="userpwd" minlength="8" maxlength="15"/></li>
		<li>이름</li>
		<li><input type="text" name="username" id="username" minlength="2" maxlength="10" value="${vo.username }" readonly/></li>
		<li>닉네임</li>
		<li><input type="text" name="usernick" id="usernick" minlength="2" maxlength="8" value="${vo.usernick }"/></li>
		<li>이메일</li>
		<li><input type="text" name="email" id="email" value="${vo.email }" readonly/></li>
		
	
		<li>
			<input type="submit" value="회원정보수정하기"/>
		</li>
	</ul>
	</form>
</div>
</body>
</html>