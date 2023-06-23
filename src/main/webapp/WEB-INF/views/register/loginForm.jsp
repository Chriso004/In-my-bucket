<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
window.Kakao.init("ebb852eaeac6387c436843b9309fd003");

function kakaoLogin(){
    window.Kakao.Auth.login({
        scope:'profile_nickname,account_email',
        success: function(authObj){
            //console.log(authObj);
            window.Kakao.API.request({
                url: '/v2/user/me',
                success: res => {
                    const email = res.kakao_account.email;
                    const name = res.properties.nickname;
                    

                    console.log(email);
                    console.log(name);
                    

                    $('#kakaoemail').val(email);
                    $('#kakaoname').val(name);
                    document.login_frm.submit();
                }
            });

        }
    });
}
</script>
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
		text-align: center;
	}
	#logFrm{
		width: 70%;
		margin: 70px auto 0;
	}
	#logFrm input{
		width: 350px;
	}
	#logFrm li{
		display: block;
	}
	#logFrm li:nth-child(2n){
		margin-bottom: 30px;	
	}
	/* ID/PW 타이틀 */
	.log-input-title{
		display:flex;
		float:left;
	}
	/* 아이디/비밀번호 input */
	#userid, #userpwd{
		border:0;
		border-bottom: 1px solid #000;
		padding: 8px 5px;
	}
	/* 로그인 버튼 */
	.btn-login{
		padding: 8px 30px;
		color: #fff;
		background: #000;
		border-radius: 20px;
		border: 1px solid #000;
		cursor: pointer;
		font-size:15px;
		
		width: 360px;
	}
	/* 회원가입 버튼 */
	.btn-joinForm{
		margin-top:10px;
		
		padding: 8px 30px;
		color: #000;
		background: #fff;
		border-radius: 20px;
		border: 1px solid #000;
		font-size:15px;
		cursor: pointer;
	}
	
	/* 서브메뉴 */
	#logSubMenu{
	 	font-size:12px;
	 	text-align: center;
	 	width: 100%;
	}
	#logSubMenu>li{
		padding: 0 30px;
		display: inline-block;
	}
	#logSubMenu a:hover{
		color: #011aff;
	}
</style>
<div class="noscroll-container">
	<div class="log-box">
		<div class="log-title">Welcome Back!</div>
		<form method="post" action="loginOk" id="logFrm">
			<ul>
				<li class="log-input-title">ID</li>
				<li><input type="text" name="userid" id="userid" placeholder="아이디"/></li>
				<li class="log-input-title">PW</li>
				<li><input type="password" name="userpwd" id="userpwd"  placeholder="비밀번호"/></li>
				<li><input class="btn-login" type="submit" value="로그인"/></li>
				<li><input class="btn-joinForm" type="button" onclick="location.href='join'" value="회원가입"/></li>
			</ul>
		</form>
	<form method="post" action="kakaoOk" id="kakaolog" name="login_frm">
<div class="form-group row" id="kakaologin">
			<div class="kakaobtn">
				<input type="hidden" name="kakaoemail" id="kakaoemail" />
				<input type="hidden" name="kakaoname" id="kakaoname" />
				<a href="javascript:kakaoLogin();"> 
					<img src="./resources/img/kakao_login_medium_narrow (1).png" />
				</a>
			</div>
		</div>
	</form>	

		<div id="logSubMenu">
			<p><a href="idSearchForm">아이디</a>/<a href="psSearchForm">비밀번호</a> 찾기</p>
		</div>
	</div>
</div>