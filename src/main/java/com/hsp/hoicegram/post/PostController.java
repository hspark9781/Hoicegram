package com.hsp.hoicegram.post;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hsp.hoicegram.post.bo.PostBO;
import com.hsp.hoicegram.post.model.PostDetail;

@Controller
@RequestMapping("/post")
public class PostController {
	
	// controller는 jsp를 채울 데이터를 원함 BO에서 중간과정을 해결해줘야한다.
	
	@Autowired
	private PostBO postBO; 
	

	@GetMapping("/timeline/view")
	public String list(Model model) {
		
		List<PostDetail> postList = postBO.getPostList();
		
		model.addAttribute("postList", postList);
		
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
