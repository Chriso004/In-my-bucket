package com.group7.inmybucket.service;

import com.group7.inmybucket.vo.RegisterVO;



public interface RegisterServiece {
	//아이디 중복검사
	public int idCheckCount(String userid);
	//회원가입
	public int registerInsert(RegisterVO vo);
	//로그인
	public RegisterVO loginOk(String userid, String userpwd, String usernick, String permission);
	//회원가입
	public RegisterVO registerEdit(String userid);
	//회원가입 수정 
	public int registerEditOk(RegisterVO vo);
}
