package org.springframework.ozo.controller;


import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ozo.service.ReserveServiceImpl;
import org.springframework.ozo.service.SpaceServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;



@Controller
@RequestMapping("/member/mypage")
public class MypageController {
	
	@Value("member/mypage")
	private String CustomerMypageViewName;
	
	@Value("member/mypage2")
	private String ProviderMypageViewName;
	
	
	
	@Autowired
	private SpaceServiceImpl spaceservice;
	public void setSpaceservice(SpaceServiceImpl spaceservice) {
		this.spaceservice = spaceservice;
	}
	
	@Autowired
	private ReserveServiceImpl reserveService;
	
	
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView showMypage(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		MemberSession msession = (MemberSession) session.getAttribute("memberSession");
		
		if ( msession.getMember().getMemberType().equals("customer")) {
			mav.setViewName(CustomerMypageViewName);
			mav.addObject("myReserveList", reserveService.getMyReserveForCus( msession.getMember().getMemId() ));
			mav.addObject("myJjimList", spaceservice.myJjimSpace( msession.getMember().getMemId() ));
			return mav;
		}
		
		mav.setViewName(ProviderMypageViewName);
		mav.addObject( "mySpaceList", spaceservice.getMySpace( msession.getMember().getMemId() ) );
		mav.addObject( "myReserveList", reserveService.getMyReserveForPro( msession.getMember().getMemId() ) );
		return mav;
		
		
		
	}
	
	

}
