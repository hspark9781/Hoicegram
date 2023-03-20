package com.hsp.hoicegram.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hsp.hoicegram.user.bo.UserBO;

@RestController
@RequestMapping("/user")
public class UserRestController {

	@Autowired
	private UserBO userBO;
	
	
	@PostMapping("/signup")
	public Map<String, String> signup(
			@RequestParam("email") String email
			, @RequestParam("userName") String userName
			, @RequestParam("nickname") String nickname
			, @RequestParam("phoneNumber") String phoneNumber
			, @RequestParam("password") String password) {
		
		Map<String, String> resultMap = new HashMap<>();
		
		int count = userBO.addUser(email, userName, nickname, phoneNumber, password);
		
		if(count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
		
	}
	
	
	@PostMapping("/email_duplicate")
	public Map<String, String> emailDuplicate(@RequestParam("email") String email) {
		
		int count = userBO.emailDuplicate(email);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count == 0) {
			resultMap.put("result", "false");
		} else {
			resultMap.put("result", "true");
		}
		
		return resultMap;
		
	}
	
	@PostMapping("/nickname_duplicate")
	public Map<String, String> nicknameDuplicate(@RequestParam("nickname") String nickname) {
		
		int count = userBO.nicknameDuplicate(nickname);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count == 0) {
			resultMap.put("result", "false");
		} else {
			resultMap.put("result", "true");
		}
		
		return resultMap;
		
	}
	@PostMapping("/phoneNumber_duplicate")
	public Map<String, String> phoneNumberDuplicate(@RequestParam("phoneNumber") String phoneNumber) {
		
		int count = userBO.phoneNumberDuplicate(phoneNumber);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count == 0) {
			resultMap.put("result", "false");
		} else {
			resultMap.put("result", "true");
		}
		
		return resultMap;
		
	}
}
