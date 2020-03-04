package org.springframework.ozo.controller.review;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ozo.domain.Review;
import org.springframework.ozo.service.ReserveServiceImpl;
import org.springframework.ozo.service.ReviewServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping({ "/review/reply" })
public class ReviewReplyController {
	
	
	@Autowired
	private ReserveServiceImpl reserveservice;
	
	@Autowired
	private ReviewServiceImpl reviewservice;
	
	
	@ResponseBody
	@RequestMapping(method= RequestMethod.POST)
	public String insertReply(HttpServletRequest request, HttpServletResponse response, @RequestBody Map<String,String> map) throws IOException {
		
		int reserveId = Integer.parseInt(map.get("reserveId").toString());
		String comment = map.get("comment").toString();
		
		reviewservice.insertReply(comment, reserveId);

		return comment;
		
	}

}
