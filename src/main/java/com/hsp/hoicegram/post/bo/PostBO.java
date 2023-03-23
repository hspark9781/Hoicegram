package com.hsp.hoicegram.post.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hsp.hoicegram.common.FileManagerService;
import com.hsp.hoicegram.post.dao.PostDAO;

@Service
public class PostBO {
	
	@Autowired
	private PostDAO postDAO;
	
	public int addPost(int userId, String content, MultipartFile file) {
		String imagePath = FileManagerService.saveFile(userId, file);
		return postDAO.insertPost(userId, content, imagePath);
	}

}
