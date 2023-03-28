package com.hsp.hoicegram.post.comment.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.hsp.hoicegram.post.comment.model.Comment;

@Repository
public interface CommentDAO {
	
	public int insertComment(
			@Param("userId") int userId
			, @Param("postId")int postId
			, @Param("content") String content);
	
	public Comment selectComment(
			@Param("userId") int userId
			, @Param("postId")int postId);

}
