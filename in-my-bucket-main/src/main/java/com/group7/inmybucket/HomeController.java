package com.group7.inmybucket;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	
	public ModelAndView bucketPeed() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/views/home");
		return mav;
	}
	
}
