package com.group7.inmybucket.service;

import javax.servlet.http.HttpSession;

import com.group7.inmybucket.vo.RegisterVO;



public interface RegisterServiece {
	//아이디 중복검사
	public int idCheckCount(String userid);
	//회원가입
	public int registerInsert(RegisterVO vo);
	//로그인
	public RegisterVO loginOk(String userid, String userpwd, String usernick, String permission, String email);
	//회원가입
	public RegisterVO registerEdit(String userid);
	//회원가입 수정 
	public int registerEditOk(RegisterVO vo);
	//아이디찾기
	RegisterVO memberIdSearch(RegisterVO searchVO);
	
	//비번 변경
	int passwordUpdate(RegisterVO searchVO);
	//비번 메일
	public String psSearch(String username, String email);
	//회원탈퇴
	public int remove(RegisterVO vo);
	public RegisterVO removeForm(String userid, String userpwd);
	public int registerprofile(RegisterVO vo);
	public int kakaoOk(RegisterVO userTO);
	public RegisterVO kaka(RegisterVO userTo);
}
