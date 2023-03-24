package com.hsp.hoicegram.like;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hsp.hoicegram.like.bo.LikeBO;

@RestController
@RequestMapping("/like")
public class LikeRestController {
	
	
	@Autowired
	private LikeBO likeBO;
	
	@GetMapping("/add")
	public Map<String, String> addLike(
			@RequestParam("postId") int postId
			, HttpSession session) {
		
		
		int userId = (Integer)session.getAttribute("userId");
		int count = likeBO.addLike(postId, userId);
		
		Map<String, String> resultMap = new HashMap<>();
		if(count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
		
	}

}
