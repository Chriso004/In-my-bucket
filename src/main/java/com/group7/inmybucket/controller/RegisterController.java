package com.group7.inmybucket.controller;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.group7.inmybucket.service.RegisterServiceImpl;

import com.group7.inmybucket.vo.RegisterVO;







@Controller
public class RegisterController {
	@Autowired
	RegisterServiceImpl service;
	
	@Autowired
	JavaMailSenderImpl mailSender;
	
	//로그인폼
	@GetMapping("/loginForm")
	public String login() {
		return "register/loginForm";
	}
	//로그인(DB)
	@PostMapping("/loginOk")
	public ModelAndView loginOk(String userid, String userpwd, String usernick, String permission, String email, HttpServletRequest request, HttpSession session, RegisterVO vvo) {
		//Session 객체 얻어오기
		
		RegisterVO vo = service.loginOk(userid, userpwd , usernick, permission, email);
		//vo->null인 경우 선택레코드가 없다. - 로그인실패
		//	   null이 아닌경우 선택레코드 있다. - 로그인 성공
		
		ModelAndView mav = new ModelAndView();
		if(vo != null ) {//로그인
			session.setAttribute("logId", vo.getUserid() );
			session.setAttribute("logName", vo.getUsername() );
			session.setAttribute("logNick", vo.getUsernick());
			session.setAttribute("logPermission", vo.getPermission());
			session.setAttribute("logPwd", vo.getUserpwd());
			session.setAttribute("logEmail", vo.getEmail());
			
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
		service.registerprofile(vo);
		
		
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
	//아이디 찾기
	@RequestMapping(value="idSearchForm", method=RequestMethod.GET)
	public String idSearchForm(HttpServletRequest request, Model model, RegisterVO searchVO) {
		return "register/idSearchForm";
	}
	//아이디정보확인
	@RequestMapping(value = "idSearchOk")
	public String search_result_id(HttpServletRequest request, Model model,
	    @RequestParam(required = true, value = "username") String username, 
	    @RequestParam(required = true, value = "tel") String tel,
	    RegisterVO searchVO) {
	 
	 
	try {
	    
	    searchVO.setUsername(username);
	    searchVO.setTel(tel);
	    RegisterVO memberSearch = service.memberIdSearch(searchVO);
	    
	    model.addAttribute("searchVO", memberSearch);
	 
	} catch (Exception e) {
	    System.out.println(e.toString());
	    model.addAttribute("msg", "오류가 발생되었습니다.");
	}
	 
	return "register/idSearchOk";
	}

	
	///이메일/////////////////////////////////
	@GetMapping("/psSearchForm")
	public String psSearchForm() {
		return "register/psSearchForm";
		}
	@PostMapping("/psSearchEmailSend")
	@ResponseBody
	public String idSearchEmailSend(RegisterVO vo) {
			
		//이름과 이메일이 일치하는 회원의 비밀번호
		String userpwd = service.psSearch(vo.getUsername(), vo.getEmail());
			
		if(userpwd==null || userpwd.equals("")) {//비번 없으면 존재하지 않는 정보
			return "N";
		}else {
			
		//비번 있으면
		//DB조회한 비밀번호를 이메일로 보내고 메일보냈다는 정보를 알려준다.
			String emailSubject = "비밀번호 찾기 결과";
			String emailContent = "<div style='background:pink; margin:50px; padding:50px; border:2px solid gray; font-size:2em; text-align:center'>";
			emailContent += "검색한 비밀번호 입니다.<br/>";
			emailContent += "비밀번호 : "+userpwd;
			emailContent += "</div>";
			try {
				//mimeMessage -> mimeMessageHelper
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
					
				//보내는 메일주소
				messageHelper.setFrom("gprhf123@naver.com");
				messageHelper.setTo(vo.getEmail());
				messageHelper.setSubject(emailSubject);
				messageHelper.setText("text/html; charset=UTF-8", emailContent);
					
				mailSender.send(message);//보내기
				return "Y";
			}catch(Exception e) {
				e.printStackTrace();
				return "N";
			}
		}
	}
	@RequestMapping(value="register/removeForm", method=RequestMethod.GET)
	public ModelAndView removeForm(HttpSession session) {
		RegisterVO vo = service.removeForm((String)session.getAttribute("logId"), (String)session.getAttribute("logPwd"));
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", vo);
		mav.setViewName("register/removeForm");
		return mav;
	}
	
	@RequestMapping(value="register/remove", method=RequestMethod.POST)
	public ModelAndView removeMember(HttpSession session, RegisterVO vo) {
			ModelAndView mav = new ModelAndView();
			
				 
				 int result = service.remove(vo);
				 if(result>0) {
				 session.invalidate();
				 mav.setViewName("redirect:/");
				 }else {
					mav.addObject("msg","회원탈퇴에 실패하였습니다.");
					mav.setViewName("register/joinOkResult");
				 }
				
			return mav;
		}
	@PostMapping("/kakaoOk")
	public String kakaoOk(HttpServletRequest request, String userid, String userpwd, String usernick, String email, String permission, HttpSession session) {
		
		System.out.println(request.getParameter("kakaoemail"));
		System.out.println(request.getParameter("kakaoname"));
		
		// kakaoemail을 kakaoid에 저장
		String kakaoemail = request.getParameter("kakaoemail");

		RegisterVO userTo = new RegisterVO();

		// kakaoid를 to의 id로 세팅
		userTo.setEmail(kakaoemail);

		// 카카오계정으로 로그인한 적이 있는지 없는지 
		int result_lookup = service.kakaoOk(userTo);

		if (result_lookup == 0) { // 회원이 아닌경우 (카카오 계정으로 처음 방문한 경우) 카카오 회원정보 설정 창으로 이동
		    System.out.println("카카오 회원 정보 설정");

		   
		    request.setAttribute("kakaoname",request.getParameter("kakaoname"));
		    
		    request.setAttribute("kakaoemail",request.getParameter("kakaoemail"));

		    // 회원가입창으로 이동
		    return "register/join";
		} else { // 이미 카카오로 로그인한 적이 있을 때 (최초 1회 로그인때 회원가입된 상태) 로그인창으로 보내줌
			userTo = service.kaka(userTo);
			session.setAttribute("logId", userTo.getUserid() );
			session.setAttribute("logName", userTo.getUsername() );
			session.setAttribute("logNick", userTo.getUsernick());
			session.setAttribute("logPermission", userTo.getPermission());
			session.setAttribute("logPwd", userTo.getUserpwd());
			session.setAttribute("logEmail", userTo.getEmail());
			
			session.setAttribute("logStatus", "Y");
		}
			return "redirect:/";
		
	}
}

	
