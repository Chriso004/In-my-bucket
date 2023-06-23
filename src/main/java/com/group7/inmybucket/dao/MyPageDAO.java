package com.group7.inmybucket.dao;

import com.group7.inmybucket.dto.ProfileDTO;

public interface MyPageDAO {
	public ProfileDTO getProfile(String userid);
	public String getUsernick(String userid);
	public int updateMypageUser(ProfileDTO dto);
	public int updateMypageNickname(String userid, String nickname);
}
