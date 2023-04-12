package com.group7.inmybucket.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	//로그인(DB)
	@PostMapping("/loginOk")
	public ModelAndView loginOk(String userid, String userpwd, String usernick, String permission, HttpServletRequest request, HttpSession session) {
		//Session 객체 얻어오기
		// 매개변수로 HttpServletRequest request -> Session구하기
		// 매개변수로 HttpSession session
		
		RegisterVO vo = service.loginOk(userid, userpwd , usernick, permission);
		//vo->null인 경우 선택레코드가 없다. - 로그인실패
		//	   null이 아닌경우 선택레코드 있다. - 로그인 성공
		ModelAndView mav = new ModelAndView();
		if(vo != null) {//로그인
			session.setAttribute("logId", vo.getUserid() );
			session.setAttribute("logName", vo.getUsername() );
			session.setAttribute("logNick", vo.getUsernick());
			session.setAttribute("logPermission", vo.getPermission());
			session.setAttribute("logStatus", "Y");
			
			mav.setViewName("redirect:/");
		}else {//로그인 실패
			mav.setViewName("redirect:loginForm");
		}
		return mav;
	}
	//로그아웃 - 세션제거
		@RequestMapping("/logout")
		public ModelAndView logout(HttpSession session) {
			session.invalidate();
			ModelAndView mav = new ModelAndView();
			mav.setViewName("redirect:/");
			return mav;
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
	//회원정보 수정폼 - session 로그인 아이디에 해당하는 회원정보 select하여 뷰페이지 이동
	@GetMapping("/joinEdit")
	public ModelAndView joinEdit(HttpSession session) {
		RegisterVO vo = service.registerEdit((String)session.getAttribute("logId"));
			
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", vo);
		mav.setViewName("register/joinEdit");
		return mav;
		}
	//회원정보 수정(DB) - form의 내용과 session의 로그인 아이디를 구하여 회원정보를 수정한다.
	@PostMapping("/joinEditOk")
	public ModelAndView joinEditOk(RegisterVO vo, HttpSession session) {
		vo.setUserid((String)session.getAttribute("logId"));
			
		int cnt = service.registerEditOk(vo);
			
		ModelAndView mav = new ModelAndView();
		if(cnt>0){// 수정성공시 -> db에서 수정된 내용을 보여주고
			mav.setViewName("redirect:/");
		}else{// 수정실패시 -> 이전페이지 (알림)
			mav.addObject("msg","회원정보수정 실패하였습니다.");
			mav.setViewName("register/joinOkResult");
		}
		return mav;
	
	}
}
