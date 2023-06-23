package com.group7.inmybucket.service;

import com.group7.inmybucket.dto.ProfileDTO;

public interface MyPageService {
	public ProfileDTO getProfile(String userid);
	public String getUsernick(String userid);
	public int updateMypageUser(ProfileDTO dto);
	public int updateMypageNickname(String userid, String nickname);
}
