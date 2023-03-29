package com.hsp.hoicegram.post.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hsp.hoicegram.common.FileManagerService;
import com.hsp.hoicegram.post.comment.bo.CommentBO;
import com.hsp.hoicegram.post.comment.model.CommentDetail;
import com.hsp.hoicegram.post.dao.PostDAO;
import com.hsp.hoicegram.post.like.bo.LikeBO;
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
	
	@Autowired
	private LikeBO likeBO;
	
	@Autowired
	private CommentBO commentBO;
	
	public int addPost(int userId, String content, MultipartFile file) {
		String imagePath = FileManagerService.saveFile(userId, file);
		return postDAO.insertPost(userId, content, imagePath);
	}
	
	public List<PostDetail> getPostList(int userId) {
		
		
		
		// controller에서 원하는(jsp에서 사용할 데이터 형태를 만들어준다. BO의 역할)
		
		List<Post> postList = postDAO.selectPostList();
		
		// 한 카드 박스안에 포스트 뿐만 아니라 작성자, 댓글, 좋아요의 기능이 필요할때
		List<PostDetail> postDetailList = new ArrayList<>();
		
		
		
		for(Post post:postList) { // post에서 조회한것 + 필요한 컬럼 = List<PostDetail>에 넣기
			
			// 포스트 모델에는 userId밖에 없기 때문에 userId를 통해 user테이블을 조회에서 아이디를 가져오고
			User user = userBO.getUserById(post.getUserId()); 	// user정보를 객체에 저장해야 한다.
		
			int likeCount = likeBO.getLikeCount(post.getId());
			boolean isLike = likeBO.isLike(userId, post.getId());
			
			// user와 같은 이유
			List<CommentDetail> commentList = commentBO.getCommentList(post.getId());
			
			
			PostDetail postDetail = new PostDetail();
			
			postDetail.setId(post.getId()); // post 멤버변수에서 가져올수 있는 거는 가져오기
			postDetail.setContent(post.getContent());
			postDetail.setImagePath(post.getImagePath());
			postDetail.setUserId(post.getUserId());
			postDetail.setNickname(user.getNickname()); // 작성자 닉네임 -> PostDetail의 멤벼변수 
			postDetail.setLikeCount(likeCount); // 좋아요 개수 -> PostDetail의 멤벼변수 
			postDetail.setLike(isLike);	// 좋아요 눌렀는지 여부 -> PostDetail의 멤벼변수 
			postDetail.setCommentDetail(commentList); // 댓글 목록들 -> comment의 리스트
			
			postDetailList.add(postDetail);
		}
		
		return postDetailList;
		
		
	}
			
			

}
