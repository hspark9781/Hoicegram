package com.hsp.hoicegram.post.like.bo;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hsp.hoicegram.post.like.dao.LikeDAO;

@Service
public class LikeBO {
	
	@Autowired
	private LikeDAO likeDAO;

	public int addLike(int userId, int postId) {
		
		return likeDAO.insertLike(userId, postId);
	}
	
	public int getLikeCount(int postId) {
		return likeDAO.selectLikeCount(postId);
	}
	
	public boolean isLike(int userId, int postId) {
		int count = likeDAO.selectCountLikeByUserId(userId, postId);
		
		if(count == 0) {
			return false;
		} else {
			return true;
		}
	}
	
	public int unLike(int userId, int postId) {
		return likeDAO.deleteLike(userId, postId);
		
	}
	
	
	
}
