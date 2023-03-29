package com.hsp.hoicegram.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.hsp.hoicegram.post.model.Post;

@Repository
public interface PostDAO {
	
	public int insertPost(
			@Param("userId") int userId
			, @Param("content") String content
			, @Param("imagePath") String imagePath);
	
	public List<Post> selectPostList();
	
	public Post selectPost(
			@Param("id") int id
			, @Param("userId") int userId);
	
	public String selectNickname(int userId);
	
	public int deletePost(
			@Param("userId") int userId
			, @Param("id") int id);
	
	

}
