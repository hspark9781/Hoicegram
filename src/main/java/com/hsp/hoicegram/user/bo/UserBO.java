package com.hsp.hoicegram.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hsp.hoicegram.common.EncryptService;
import com.hsp.hoicegram.user.dao.UserDAO;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	
	
	public int addUser(
			String email
			, String userName
			, String nickname
			, String phoneNumber
			, String password) {
		
		String encryptPassword = EncryptService.md5(password);
		
		return userDAO.insertUser(email, userName, nickname, phoneNumber, encryptPassword);
		
	}
	
	
	public int emailDuplicate(String email) {
		return userDAO.selectEmail(email);
	}
	
	public int nicknameDuplicate(String nickname) {
		return userDAO.selectNickname(nickname);
	}
	
	public int phoneNumberDuplicate(String phoneNumber) {
		return userDAO.selectPhoneNumber(phoneNumber);
	}

}
