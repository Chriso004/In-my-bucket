package com.group7.inmybucket.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.group7.inmybucket.dao.RegisterDAO;
import com.group7.inmybucket.vo.RegisterVO;
@Service
public class RegisterServiceImpl implements RegisterServiece {
	@Inject
	RegisterDAO dao;
	
	@Override
	public int idCheckCount(String userid) {
		
		return dao.idCheckCount(userid);
	}

	@Override
	public int registerInsert(RegisterVO vo) {
		
		
		return dao.registerInsert(vo);
	}

	@Override
	public RegisterVO loginOk(String userid, String userpwd, String usernick, String permission, String email) {
		
		return dao.loginOk(userid, userpwd, usernick, permission, email);
	}

	@Override
	public RegisterVO registerEdit(String userid) {
		
		return dao.registerEdit(userid);
	}

	@Override
	public int registerEditOk(RegisterVO vo) {
		
		return dao.registerEditOk(vo);
	}

	@Override
	public RegisterVO memberIdSearch(RegisterVO searchVO) {
		
		return dao.memberIdSearch(searchVO);
	}

	

	@Override
	public int passwordUpdate(RegisterVO searchVO) {
		return dao.passwordUpdate(searchVO);
		
	}

	@Override
	public String psSearch(String username, String email) {
		
		return dao.psSearch(username, email);
	}

	@Override
	public int remove(RegisterVO vo) {
		
		return dao.remove(vo);
	}

	@Override
	public RegisterVO removeForm(String userid, String userpwd) {
		
		return dao.removeForm(userid, userpwd);
	}

	@Override
	public int registerprofile(RegisterVO vo) {
		
		return dao.registerprofile(vo);
	}

	@Override
	public int kakaoOk(RegisterVO userTO) {
		
		return dao.kakaoOk(userTO);
	}

	@Override
	public RegisterVO kaka(RegisterVO userTo) {
		
		return dao.kaka(userTo);
	}

	


}
