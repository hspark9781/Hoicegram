package com.hsp.hoicegram.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
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
	public Map<String, Boolean> emailDuplicate(@RequestParam("email") String email) {
		
		Map<String, Boolean> resultMap = new HashMap<>();
		
		if(userBO.emailDuplicate(email)) {
			resultMap.put("result", true);
		} else {
			resultMap.put("result", false);
		}
		
		return resultMap;
		
//		 resultMap.put("result", userBO.nicknameDuplicate(email));
//		 return resultMap;	 
		
	}
	
	@GetMapping("/nickname_duplicate")
	public Map<String, Boolean> nicknameDuplicate(@RequestParam("nickname") String nickname) {
		
		
		Map<String, Boolean> resultMap = new HashMap<>();
		
		if(userBO.nicknameDuplicate(nickname)) {
			resultMap.put("result", true);
		} else {
			resultMap.put("result", false);
		}
		
		return resultMap;
		
	}
	@PostMapping("/phoneNumber_duplicate")
	public Map<String, Boolean> phoneNumberDuplicate(@RequestParam("phoneNumber") String phoneNumber) {
		
		Map<String, Boolean> resultMap = new HashMap<>();
		
		if(userBO.phoneNumberDuplicate(phoneNumber)) {
			resultMap.put("result", true);
		} else {
			resultMap.put("result", false);
		}
		
		return resultMap;
		
	}
}
