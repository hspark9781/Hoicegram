package com.hsp.hoicegram.common;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class EncryptService {
	
	// 문자열 > byte > 16진수 > 문자열
		// 암호화 기능
		// static 객체 생성 없이 사용 가능, 단 멤버변수 사용할수 없다.
		public static String md5(String message) {
			
			String resultString = "";
			
			
			try {
				MessageDigest md = MessageDigest.getInstance("md5");
				
				byte[] bytes = message.getBytes();
				md.update(bytes);
				
				byte[] digest = md.digest();
				
				// 16진수 형태의 문자열로 변환
				for(int i = 0; i < digest.length; i++) {
					
					resultString += Integer.toHexString(digest[i] & 0xff);
				}
					
				
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
			
			return resultString;
			
		}

}
