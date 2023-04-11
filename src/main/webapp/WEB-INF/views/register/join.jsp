<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#joinForm ul{
		overflow:auto;
	}
	#joinForm li{
		float:left;
		width:20%;
		padding:10px 0;	
		border-bottom:1px solid gray;
		line-height:40px;
	}
	#joinForm li:nth-child(2n){
		width:80%;
	}
	#joinForm li:last-child{
		width:100%;
	}
	#addr{width:80%;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
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
	//우편번호 검색
	$("#zipSearch").on('click', function(){
		window.open("zipcodeSearch","zipcode","width=500,height=600");
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
<div class="container">
	<h1>회원가입 폼</h1>
	<form method="post" id="joinForm">
	<ul>
		<li>아이디</li>
		<li>
			<input type="text" name="userid" id="userid" minlength="8" maxlength="15" />
			<input type="button" value="아이디중복검사"/>
			<input type="hidden" id="idStatus" value="Y"/>
		</li>
		<li>비밀번호</li>
		<li><input type="password" name="userpwd" id="userpwd" minlength="8" maxlength="15" /></li>
		<li>비밀번호확인</li>
		<li><input type="password" name="userpwd2" id="userpwd2" /></li>
		<li>이름</li>
		<li><input type="text" name="username" id="username" minlength="2" maxlength="10" /></li>
		
		<li>이메일</li>
		<li><input type="text" name="email" id="email" /></li>
	
	
	
		<li>
			<input type="submit" value="회원가입"/>
		</li>
	</ul>
	</form>
</div>