package org.springframework.ozo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class LogOutController {
	@RequestMapping("/logout")
	public String handleRequest(HttpSession session) throws Exception {
		session.removeAttribute("memberSession");
		session.invalidate();
		return "redirect:/index";
	}

}
