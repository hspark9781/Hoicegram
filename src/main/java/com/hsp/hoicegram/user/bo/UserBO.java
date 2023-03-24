package com.hsp.hoicegram.user.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hsp.hoicegram.common.EncryptService;
import com.hsp.hoicegram.user.dao.UserDAO;
import com.hsp.hoicegram.user.model.User;

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
		
	
	
	public boolean emailDuplicate(String email) {
		int count =  userDAO.selectEmail(email);
		if(count == 0) {
			return false;
		} else {
			return true;
		}
	}
	
	public boolean nicknameDuplicate(String nickname) {
		int count = userDAO.selectNickname(nickname);
		
		if(count == 0) {
			return false;
		} else {
			return true;
		}
	}
	
	public boolean phoneNumberDuplicate(String phoneNumber) {
		int count = userDAO.selectPhoneNumber(phoneNumber);
		
		if(count == 0) {
			return false;
		} else {
			return true;
		}
		
		// userDAO.selectPhoneNumber(phoneNumber) != 0; => 이해 하면 쓰기
	}
	
	
	public User getUser(String email, String password) {
		String encryptPassword = EncryptService.md5(password);
		return userDAO.selectUser(email, encryptPassword);
	}
	
	
	public List<User> getNicknameList() {
		return userDAO.selectNicknameList();
	}
		

}
