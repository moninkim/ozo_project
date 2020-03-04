package org.springframework.ozo.controller.space;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ozo.domain.Space;
import org.springframework.ozo.service.SpaceServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/space/search")
public class SearchController {
	
	@Value("space/searchList")
	String successViewName;
	
	
	@Autowired
	private SpaceServiceImpl spaceservice;
	
	@ModelAttribute("spaceTypeList")
	public String[] getSpaceTypeList() {
		return new String[] {"다목적홀", "세미나", "엠티", "스튜디오 연습실", "공연장", "작업실", "스터디룸", "회의실", "코워킹스페이스", "파티룸", "레저시설"};
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView searchSpaces(HttpServletResponse response, @RequestParam("condition") String condition, @RequestParam("keyword") String keyword) throws Exception {
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("condition", condition);
		mav.addObject("keyword", keyword);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		List<Space> spaceList = spaceservice.searchSpace(map);
		if(spaceList != null) {	
			mav.setViewName(successViewName);
			mav.addObject("spaceList", spaceList);
		}else {
			PrintWriter writer = response.getWriter();
		    writer.println("<script>alert(' 검색 실패 ;< ');" + "location.href = '/'; " + "</script>");
		}


		return mav;
		
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView searchSpaces2(HttpServletResponse response, HttpServletRequest request, @RequestParam("area") String area, @RequestParam("title") String title) throws Exception {
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("area", area);
		mav.addObject("title", title);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("area", area);
		map.put("title", title);
		
		List<Space> spaceList = spaceservice.searchSpace2(map);
		if(spaceList != null) {	
			mav.setViewName(successViewName);
			mav.addObject("spaceList", spaceList);
			request.setAttribute("keyword1", area);
			request.setAttribute("keyword2", title);
		}else {
			PrintWriter writer = response.getWriter();
		    writer.println("<script>alert(' 검색 실패 ;< ');" + "location.href = '/'; " + "</script>");
		}


		return mav;
		
	}

}
