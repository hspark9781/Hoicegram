package com.hsp.hoicegram.post;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/post")
public class PostController {

	@GetMapping("/timeline/view")
	public String list() {
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
