package com.hsp.hoicegram.post.like.dao;



import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;


@Repository
public interface LikeDAO {
	
	public int insertLike(
			@Param("userId") int userId
			, @Param("postId") int postId);
	
	public int selectLikeCount(@Param("postId") int postId);
	
	public int selectCountLikeByUserId(
			@Param("userId") int userId
			, @Param("postId") int postId);
	
	public int deleteLike(
			@Param("userId") int userId
			, @Param("postId") int postId);
	
	public int deleteLikeByPostId(@Param("postId") int postId);
	
	
}
