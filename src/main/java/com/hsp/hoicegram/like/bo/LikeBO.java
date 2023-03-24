package com.hsp.hoicegram.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hsp.hoicegram.like.dao.LikeDAO;

@Service
public class LikeBO  {
	
	@Autowired
	private LikeDAO likeDAO;
	
	public int addLike(int postId, int userId) {
		
		return likeDAO.insertLike(postId, userId);
	}

}