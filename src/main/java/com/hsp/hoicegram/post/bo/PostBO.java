package com.hsp.hoicegram.post.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hsp.hoicegram.common.FileManagerService;
import com.hsp.hoicegram.post.dao.PostDAO;
import com.hsp.hoicegram.post.model.Post;
import com.hsp.hoicegram.post.model.PostDetail;
import com.hsp.hoicegram.user.bo.UserBO;
import com.hsp.hoicegram.user.model.User;

@Service
public class PostBO {
	
	@Autowired
	private PostDAO postDAO;
	
	@Autowired //싱글턴 패턴
	private UserBO userBO;
	
	public int addPost(int userId, String content, MultipartFile file) {
		String imagePath = FileManagerService.saveFile(userId, file);
		return postDAO.insertPost(userId, content, imagePath);
	}
	
	public List<PostDetail> getPostList() {
		
		// controller에서 원하는(jsp에서 사용할 데이터 형태를 만들어준다. BO의 역할)
		List<Post> postList = postDAO.selectPostList();
		
		List<PostDetail> postDetailList = new ArrayList<>();
		
		for(Post post:postList) {
			
			User user = userBO.getUserById(post.getUserId());
			
			PostDetail postDetail = new PostDetail();
			
			postDetail.setId(post.getId());
			postDetail.setContent(post.getContent());
			postDetail.setImagePath(post.getImagePath());
			postDetail.setUserId(post.getUserId());
			postDetail.setNickname(user.getNickname());
			
			postDetailList.add(postDetail);
		}
		
		return postDetailList;
			
			
	}

}
