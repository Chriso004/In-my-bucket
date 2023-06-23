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
		font-size: 80px;
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
		height: 600px;
		padding: 20px;
		
		border: 1px solid #000;
		border-radius: 30px;
		background-color:#fff;
		box-shadow: 0px 10px 20px 7px rgba(0, 0, 0, 0.25);
		
		font-size: 15px;
		
	}
	#joinForm{
		padding: 0 30%;
		font-size: 15px;
	}
	#joinForm input{
		margin-bottom: 30px; 
		width: 350px;
		height: 39px;
		border:none; 
		display: block;
		border-bottom: 1px solid rgba(0,0,0,0.4);
		transform: translate(-20%,-40%);
	}
	#joinForm li{
		display: block;
		
	}
	#joinForm li:nth-child(2n){
		padding-bottom: 0px;	
		text-align: center;
	}
	
</style>

<script>
$(function(){
	//아이디 중복검사
	$("input[value=아이디중복검사]").click(function(){
		if($("#userid").val()!=""){
		//			주소, 창이름, 옵션
		window.open("idCheck?userid="+$("#userid").val(),"chk","width=400,height=300");
		}else{
			alert("아이디를 입력후 중복검사하세요.");
		}		
	});
	//아이디 입력란에 키보드를 입력하면 아이디 중복검사 초기화
	$("#userid").keyup(function(){
		$("#idStatus").val("N");
	});

	
	//유호성 검사
	$("#joinForm").submit(function(){
		
		if($("#userid").val()==""){
			alert("아이디를 입력하세요..");
			return false;
		}
		//아이디 검사
		//첫번째 문자 영대소문자, 숫자, _ 가능
		//글자길이 8~15글자 사이
		//var reg = /^[A-Za-z]{1}[A-Za-z_]{7,14}$/
			var reg = /^[A-Za-z]{1}\w{7,14}$/
			
			if(!reg.test($("#userid").val())){// 유효한값이면 true, 잘못된 데이터면 false
				alert("아이디는 첫번째문자는 영어대소문자로 시작하여야하며, \n영어대소문자,숫자,_가능, 아이디는 8~15글자까지 가능");
				return false;
			}
			if($("#idStatus").val()=="N"){
				alert("아이디 중복검사를 하세요.");
				return false;
			}
			//비밀번호
			if($("#userpwd").val()==""){
				alert("비밀번호를 입력하세요.");
				return false;
			}
			if($("#userpwd").val() != $("#userpwd2").val()){
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}
			//이름검사
			reg = /^[가-힣]{2,10}$/
			if(!reg.test($("#username").val())){
				alert("이름은 2~10글자까지 한글만 가능합니다.");
				return false;
			}
			//닉네임검사
			if($("#usernick").val()==""){
				alert("닉네임을 입력하세요.");
				return false;
			}
			
			//tel검사
			if($("#tel").val()==""){
				alert("전화번호를 입력하세요.");
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
			$("#joinForm").attr("action","joinOk");
			
	});
});
</script>
	
<div class="noscroll-container">
	<div class="log-box">
	<div class="log-title">Welcome to our universe!</div>
	<form method="post" id="joinForm">
	<ul>
		
		<li>
			<input type="text" name="userid" id="userid" minlength="8" maxlength="15" placeholder="아이디" style="margin: 10px 20px 0px 0px;" />
			<input type="button" value="아이디중복검사" id="idc" style="background-color:#000; color:#fff; border-radius: 20px; display:inline;  width: 101px; height: 39px; margin: 0 0 -15px 350px;"/>
			<input type="hidden" id="idStatus" value="Y"/>
		</li>
		
		<li><input type="password" name="userpwd" id="userpwd" minlength="8" maxlength="15" placeholder="비밀번호"/></li>
		
		<li><input type="password" name="userpwd2" id="userpwd2" placeholder="비밀번호확인"/></li>
		
		<li><input type="text" name="username" id="username" minlength="2" maxlength="10" placeholder="이름"/></li>
		
		<li><input type="text" name="usernick" id="usernick" minlength="2" maxlength="8" placeholder="닉네임"/></li>
		
		<li><input type="text" name="email" id="email" placeholder="이메일" /></li>
		
		
		<li><input type="text" name="tel" id="tel" placeholder="전화번호"/></li>
		
		
		<li>
			<input type="submit" id="button" value="회원가입" style="background-color:#000; color:#fff; border-radius: 20px;"/>
		</li>
	</ul>
	</form>
	</div>
</div>
