package com.group7.inmybucket.service;

import com.group7.inmybucket.vo.RegisterVO;

public interface RegisterServiece {
	//아이디 중복검사
	public int idCheckCount(String userid);
	//회원가입
	public int registerInsert(RegisterVO vo);
}
