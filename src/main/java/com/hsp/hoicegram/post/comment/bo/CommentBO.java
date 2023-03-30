package com.hsp.hoicegram.post.comment.bo;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hsp.hoicegram.post.comment.dao.CommentDAO;
import com.hsp.hoicegram.post.comment.model.Comment;
import com.hsp.hoicegram.post.comment.model.CommentDetail;
import com.hsp.hoicegram.user.bo.UserBO;
import com.hsp.hoicegram.user.model.User;

@Service
public class CommentBO {
	
	@Autowired
	private CommentDAO commentDAO;
	
	@Autowired
	private UserBO userBO;
	
	public int addComment(int userId, int postId, String content) {
		return commentDAO.insertComment(userId, postId, content); 
	}
	
	public List<CommentDetail> getCommentList(int postId) {
		
		List<Comment> commentList = commentDAO.selectCommentList(postId);
		List<CommentDetail> commentDetailList = new ArrayList<>();
		
		
		for(Comment comment:commentList) {
			
			User user = userBO.getUserById(comment.getUserId());
			
			CommentDetail commentDetail = new CommentDetail();
			commentDetail.setId(comment.getId());
			commentDetail.setUserNickname(user.getNickname());
			commentDetail.setContent(comment.getContent());
			commentDetailList.add(commentDetail);
		}
			
		return commentDetailList;	
	}
	
	public int deleteCommentByPostId(int postId) {
		return commentDAO.deleteCommentByPostId(postId);
	}

}
