package com.group7.inmybucket.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/settings")
public class SettingsController {
	
	@RequestMapping(value="/settings")
	public ModelAndView settingsList() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("settings/settings");
		return mav;
	}
}
