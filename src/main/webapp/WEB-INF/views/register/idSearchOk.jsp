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
		transform: translate(-50%,-50%);
		
		width:650px;
		height: 450px;
		padding: 20px;
		
		border: 1px solid #000;
		border-radius: 30px;
		background-color:#fff;
		box-shadow: 0px 10px 20px 7px rgba(0, 0, 0, 0.25);
		
		font-size: 15px;
		
	}
	.mb-4{
		text-align:center;
		margin: 150px 0 0 0;
		font-size:20px;
	}
</style>                                                                                    
                                                                                   
                               
                                                                         
                                                                          
    <div class="noscroll-container">    
    <div class="log-box">
    <div class="log-title">Welcome Back!</div>                                                                          
        <c:choose>                                                                          
            <c:when test="${empty searchVO}">                                                 
                <p class="mb-4">조회결과가 없습니다.</p>                                        
            </c:when>                                                                         
            <c:otherwise>                                                                     
                <p class="mb-4">회원가입시 사용한 아이디는 ${searchVO.userid} 입니다.</p>                                              
            </c:otherwise>                                                                    
        </c:choose>                                                                         
    </div>
   </div>                                                                                 
                                                                                        
                                                                              
                                                                                     
                                                                                          
                                                                                                                 
                                                                                            
                                                                            
                                                                                            
           