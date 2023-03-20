package com.hsp.hoicegram.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDAO {
	
	

	public int insertUser(
			@Param("email") String email
			, @Param("userName") String userName
			, @Param("nickname") String nickname
			, @Param("phoneNumber") String phoneNumber
			, @Param("password") String password);
	
	
	public int selectEmail(@Param("email") String email);
	
	public int selectNickname(@Param("nickname") String nickname);
	
	public int selectPhoneNumber(@Param("phoneNumber") String phoneNumber);
	
	
}
