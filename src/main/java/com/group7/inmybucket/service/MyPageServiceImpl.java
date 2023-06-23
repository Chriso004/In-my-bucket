package com.group7.inmybucket.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group7.inmybucket.dao.MyPageDAO;
import com.group7.inmybucket.dto.ProfileDTO;

@Service
public class MyPageServiceImpl implements MyPageService {
	@Autowired
	MyPageDAO dao;
	
	public ProfileDTO getProfile(String userid) {
		return dao.getProfile(userid);
	}

	@Override
	public String getUsernick(String userid) {
		return dao.getUsernick(userid);
	}

	@Override
	public int updateMypageUser(ProfileDTO dto) {
		return dao.updateMypageUser(dto);
	}

	@Override
	public int updateMypageNickname(String userid, String nickname) {
		return dao.updateMypageNickname(userid, nickname);
	}
}
