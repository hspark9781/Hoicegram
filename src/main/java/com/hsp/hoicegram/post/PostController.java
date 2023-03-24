package com.hsp.hoicegram.post;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hsp.hoicegram.post.bo.PostBO;
import com.hsp.hoicegram.post.model.Post;
import com.hsp.hoicegram.user.bo.UserBO;
import com.hsp.hoicegram.user.model.User;

@Controller
@RequestMapping("/post")
public class PostController {
	
	@Autowired
	private PostBO postBO; 
	
	@Autowired
	private UserBO userBO;

	@GetMapping("/timeline/view")
	public String list(Model model) {
		
		List<Post> postList = postBO.getPostList();
		List<User> userList = userBO.getNicknameList();
		
		model.addAttribute("postList", postList);
		model.addAttribute("userList", userList);
		
		return "post/list";
	}
	
	@GetMapping("/create/view")
	public String create() {
		return "post/create";
	}
	
	@GetMapping("/detail/view")
	public String detail() {
		return "post/detail";
	}
	
}
