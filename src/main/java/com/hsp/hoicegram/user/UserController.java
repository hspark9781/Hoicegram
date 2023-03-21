package com.hsp.hoicegram.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {

	@GetMapping("/signup/view")
	public String signup() {
		return "user/signup";
	}
	
	
	@GetMapping("/signin/view")
	public String signin() {
		return "user/signin";
	}
	
	@GetMapping("/signout")
	public String signout(HttpSession session) {
		
		session.removeAttribute("userId");
		session.removeAttribute("nickname");
		
		return "redirect:/user/signin/view";
	}
	
	
	
	
	
	
	
}
