package com.hsp.hoicegram.post.model;

import java.util.List;

import com.hsp.hoicegram.post.comment.model.Comment;
import com.hsp.hoicegram.post.comment.model.CommentDetail;

public class PostDetail {
	
	private int id;
	private int userId;
	private String nickname; // 추가
	private int likeCount; // 추가
	private boolean isLike; // 추가
	private List<CommentDetail> commentDetail; // 리스트도 멤벼변수에 가능
	private String content;
	private String imagePath;
	
	
	

	
	public List<CommentDetail> getCommentDetail() {
		return commentDetail;
	}
	public void setCommentDetail(List<CommentDetail> commentDetail) {
		this.commentDetail = commentDetail;
	}
	public boolean isLike() {
		return isLike;
	}
	public void setLike(boolean isLike) {
		this.isLike = isLike;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	
	
	
	
	
	

}
