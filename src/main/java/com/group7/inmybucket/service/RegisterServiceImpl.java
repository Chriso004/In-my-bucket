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
}
