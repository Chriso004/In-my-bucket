package com.group7.inmybucket.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {
	@GetMapping("/admin/main")
	public String adminMain() {
		return "/admin/adminMain";
	}
	
}
