package com.group7.inmybucket.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.group7.inmybucket.service.RegisterServiceImpl;
import com.group7.inmybucket.vo.RegisterVO;



@Controller
public class RegisterController {
	@Autowired
	RegisterServiceImpl service;
	//로그인폼
	@GetMapping("/loginForm")
	public String login() {
		return "register/loginForm";
	}
	//회원가입 폼
	@GetMapping("/join")
	public String join() {
		return "register/join";
	}
	//아이디 중복검사
	@GetMapping("/idCheck")
	public String idCheck(String userid, Model model) {
	//조회
	//아이디의 갯수 구하기 - 0, 1
	int result = service.idCheckCount(userid);
			
	
	model.addAttribute("userid", userid);
	model.addAttribute("result", result);
			
		return "register/idCheck";
	}
	@RequestMapping(value="/joinOk", method=RequestMethod.POST)
	public ModelAndView joinOk(RegisterVO vo) {
		System.out.println(vo.toString());
		
		ModelAndView mav = new ModelAndView();
		//회원가입
		int result = service.registerInsert(vo);
		
		
		if(result>0) {//회원가입 성공시 - 로그인폼으로 이동
			mav.setViewName("redirect:loginForm");
		}else{//실패시
			mav.addObject("msg","회원등록실패하였습니다.");
			mav.setViewName("register/joinOkResult");
		}
		return mav;
	}
}
