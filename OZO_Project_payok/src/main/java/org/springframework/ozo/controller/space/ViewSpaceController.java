package org.springframework.ozo.controller.space;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ozo.controller.MemberSession;
import org.springframework.ozo.service.OzoFacade;
import org.springframework.ozo.service.ReviewService;
import org.springframework.ozo.service.SpaceServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ViewSpaceController {
	
	@Autowired
	private SpaceServiceImpl spaceservice;
	
	@Autowired
	private ReviewService reviewservice;
	
	@Autowired
	private OzoFacade ozoFacade;
	
	
	@RequestMapping(value = "/space/viewspace", method = RequestMethod.GET)
	public ModelAndView viewspaces(@RequestParam int space_id, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("space/viewspace");
		String memId = spaceservice.getMemIdBySpaceId(space_id);
		mav.addObject("counting", spaceservice.countSpaceBymemId(memId));
		mav.addObject("space",  spaceservice.getSpaceById(space_id));
		mav.addObject("reviewlist", reviewservice.getReviewBySpaceId(space_id) );
		
		MemberSession ms = (MemberSession) session.getAttribute("memberSession");
		if ( ms !=  null) {
			mav.addObject( "jjim", ozoFacade.checkJjim( ms.getMember().getMemId(), space_id ) );
		}
		
		return mav;
		
	}
	
	
	
	
	@ResponseBody
	@RequestMapping(value = "/space/updatejjim", method = RequestMethod.POST)
    public int updatejjim(HttpServletRequest request) throws Exception {

        int jjim = Integer.parseInt(request.getParameter("jjim"));
        String memId = request.getParameter("memId");
        int space_id = Integer.parseInt(request.getParameter("space_id"));
        
        int is_exist = ozoFacade.checkJjim( memId, space_id );
        if (is_exist == 0) 
        	spaceservice.createJjim(memId, space_id, 1);
        else
        	spaceservice.updateJjim(memId, space_id, jjim);
        
       
        return jjim;

    }

}
