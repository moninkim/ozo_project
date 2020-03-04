package org.springframework.ozo.controller.reserve;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ozo.controller.MemberSession;
import org.springframework.ozo.domain.Reserve;
import org.springframework.ozo.service.OzoFacadeImpl;
import org.springframework.ozo.service.ReserveServiceImpl;
import org.springframework.ozo.service.ReviewServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/reserve/veiwreserve")
public class ViewReserveController {
	
	

	
	@Autowired
	private ReserveServiceImpl reserveservice;

	@Autowired
	private ReviewServiceImpl reviewservice;
	
	@Autowired
	private OzoFacadeImpl ozoFacade;
	
	
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView viewreserve(HttpSession session, @RequestParam int reserve_id) {
		
		ModelAndView mav = new ModelAndView();
		
		
			Reserve reserve = reserveservice.getReserveById(reserve_id);
			reserve.setMember(ozoFacade.getMemberBymemId(reserve.getMember().getMemId()));
			reserve.setReview(reviewservice.getReviewByReserveId(reserve_id));
			MemberSession ms = (MemberSession) session.getAttribute("memberSession");
			
			if ( ms.getMember().getMemId().equals(reserve.getMember().getMemId()) || 
					ms.getMember().getMemId().equals(reserve.getSpace().getMember().getMemId())) {
				mav.setViewName("reserve/veiwReserve");
				mav.addObject("reserve", reserve );
			}
			else {
				mav.setViewName("reserve/NoPermission");
			}
			
		

		return mav;
		
	}

}
