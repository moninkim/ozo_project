package org.springframework.ozo.controller.space;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ozo.domain.Space;
import org.springframework.ozo.service.SpaceServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class ListSpaceController {
	

	
	@Autowired
	private SpaceServiceImpl spaceservice;
	public void setSpaceservice(SpaceServiceImpl spaceservice) {
		this.spaceservice = spaceservice;
	}
	
	@ModelAttribute("spaceTypeList")
	public String[] getSpaceTypeList() {
		return new String[] {"다목적홀", "세미나", "엠티", "스튜디오 연습실", "공연장", "작업실", "스터디룸", "회의실", "코워킹스페이스", "파티룸", "레저시설"};
	}
	
	
	@RequestMapping("/space/listspaces")
	public ModelAndView listspaces(@RequestParam(required = false) String order) throws Exception {
		
		List<Space> spaceList; 
		if ( order == null) {
			spaceList = spaceservice.getAllSpace();
		}
		else if (order.equals("rate")) {
			spaceList = spaceservice.getOrderByRate();
		}
		else if (order.equals("jjim")) {
			spaceList = spaceservice.getOrderByJJim();
		}
		else {
			spaceList = spaceservice.getAllSpace();
		}
			
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("space/listspaces");
		mav.addObject("spaceList", spaceList);
		return mav;
		
	}


}
