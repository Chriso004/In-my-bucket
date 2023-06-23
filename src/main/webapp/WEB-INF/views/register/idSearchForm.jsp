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
	
	#username, #tel{
		margin-bottom: 40px; 
		width: 500px;
		height: 50px;
		border:none; 
		display: block;
		border-bottom: 1px solid rgba(0,0,0,0.4);
		transform: translate(10%, 0%);
	}
	#createForm{
		width: 70%;
		margin: 70px auto 0;
	}
	#createForm input{
		width: 350px;
	}
	#createForm li{
		display: block;
	}
	#createForm li:nth-child(2n){
		margin-bottom: 30px;	
	}
	.search{
		
		padding: 8px 30px;
    color: #fff;
    border-radius: 20px;
    border: 1px solid #000;
    cursor: pointer;
    font-size: 15px;
    width: 300px;
    text-align: center;
    margin: 0px 0px 0px 34px;
	
	}
	
</style>
<script>
var path = "${pageContext.request.contextPath }";
 
$(document).ready(function() {
var msg = "${msg}";
if(msg != ""){
alert(msg);    
}
});
 
 
function fnSubmit() {
 

 
if ($("#username").val() == null || $("#username").val() == "") {
alert("이름을 입력해주세요.");
$("#username").focus();
 
return false;
}
 
if ($("#tel").val() == null || $("#tel").val() == "") {
alert("전화번호를 입력해주세요.");
$("#tel").focus();
 
return false;
}
 

 
 
if (confirm("아이디를 찾으시겠습니까?")) {
 
$("#createForm").submit();
 
return false;
}
}
 
</script>
<div class="noscroll-container">
<div class="log-box">
<div class="log-title">Welcome Back!</div>
<form commandName="searchVO" id="createForm" action="${path}/inmybucket/idSearchOk" method="post">

<div>
          <input type="text"
              id="username" name="username"
              placeholder="이름">
      </div>
      <div>
          <input type="text" 
              id="tel" name="tel"
              placeholder="전화번호">
      </div>
      <div class="search" style="font-size:15px;">
      <a href="javascript:void(0)" onclick="fnSubmit(); return false;" >
          아이디찾기
      </a>
	 </div>
</form>
</div>
</div>