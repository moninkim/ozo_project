package org.springframework.ozo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ozo.domain.Member;
import org.springframework.ozo.domain.Reserve;
import org.springframework.ozo.domain.Space;
import org.springframework.ozo.service.LoginException;
import org.springframework.ozo.service.OzoFacade;
import org.springframework.ozo.service.SpaceServiceImpl;
import org.springframework.ozo.validator.LoginCommandValidator;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/index", method=RequestMethod.GET)
public class IndexController {
	
	private String ViewName = "index";

	@Autowired
	private SpaceServiceImpl spaceservice;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView index(HttpSession session) {
		List<Space> spaceList = spaceservice.getSpaceMain();
		List<Space> rateList = spaceservice.getRateTop();
		List<Space> jjimList = spaceservice.getJjimTop();
		ModelAndView mav = new ModelAndView();
		mav.setViewName(ViewName);
		mav.addObject("spaceList", spaceList);
		mav.addObject("rateList", rateList);
		mav.addObject("jjimList", jjimList);
		
		
		
		return mav;
	}
	


	

}
