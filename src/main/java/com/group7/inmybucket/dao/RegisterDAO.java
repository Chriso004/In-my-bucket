package com.group7.inmybucket.dao;

import com.group7.inmybucket.vo.RegisterVO;





public interface RegisterDAO {
	//아이디 중복검사 - 아이디의 갯수를 구한다.
	public int idCheckCount(String userid);
	//회원가입
	public int registerInsert(RegisterVO vo);
	//로그인
	public RegisterVO loginOk(String userid, String userpwd, String usernick, String permission);
	//회원정보 수정 폼
	public RegisterVO registerEdit(String userid);
	//회원정보 수정 DB update
	public int registerEditOk(RegisterVO vo); 
}
