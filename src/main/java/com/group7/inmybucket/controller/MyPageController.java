package com.group7.inmybucket.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.group7.inmybucket.dto.ProfileDTO;
import com.group7.inmybucket.service.MyPageService;

@Controller
public class MyPageController {
	@Autowired
	MyPageService service;

	@GetMapping("/mypage")
	public ModelAndView mypage(@Param("userid") String userid) {
		ModelAndView mav = new ModelAndView();
;
		ProfileDTO profileData = service.getProfile(userid);
		String usernick = service.getUsernick(userid);

		mav.addObject("usernick", usernick);
		mav.addObject("profileData", profileData);
		mav.setViewName("mypage/mypage");

		return mav;
	}

	@PostMapping("/mypage/profileUpdate.do")
	public ModelAndView profileUpdate(HttpServletRequest req, ProfileDTO dto, String nickname) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/common/alert");
		mav.addObject("url", "/inmybucket/mypage?userid=" + dto.getUserid());
		
		if(nickname.equals("")) {
			mav.addObject("msg", "닉네임을 설정해주세요.");
			return mav;
		}
		else {
			if(dto.getUser_image_path() == null) 
				dto.setUser_image_path("");
			dto.setProfile_visible(true);
			int userUpdate = service.updateMypageUser(dto);
			int nicknameUpdate = service.updateMypageNickname(dto.getUserid(), nickname);
			if(userUpdate == 0 || nicknameUpdate == 0) {
				mav.addObject("msg", "오류가 발생하였습니다.");
				return mav;
			}
			mav.addObject("msg", "수정이 완료되었습니다.");
		}
		
		return mav;
	}

}
