package org.springframework.ozo.controller.reserve;


import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ozo.controller.MemberSession;
import org.springframework.ozo.controller.review.ReviewCommand;
import org.springframework.ozo.domain.Credit;
import org.springframework.ozo.domain.KakaoPayApproval;
import org.springframework.ozo.domain.Reserve;
import org.springframework.ozo.domain.Space;
import org.springframework.ozo.service.KakaoPayService;
import org.springframework.ozo.service.OzoFacade;
import org.springframework.ozo.service.ReserveServiceImpl;
import org.springframework.ozo.service.SpaceServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReserveController {
	
	private Reserve reserve;
	private Credit credit;
	
	@Value("reserve/registerForm")
	private String formViewName;
	
	@Autowired
	private OzoFacade ozoFacade;
		
	@Autowired
	private SpaceServiceImpl spaceservice;
		
	@Autowired
	private KakaoPayService kakaoPayService;
	
	@Autowired
	private ReserveServiceImpl reserveservice;
	
	@Autowired
	SendMailController sendmail;
	
	
	@RequestMapping(value="/reserve/updatestaus", method= {RequestMethod.POST})
	@ResponseBody
	public List<String> updateReserve(@RequestBody Map<String,String> map, HttpServletResponse response) throws IOException {
		
		
		List<String> msg = new ArrayList<String>();
		
		int reserve_id = Integer.parseInt(map.get("reserve_id").toString());
		int state = Integer.parseInt(map.get("state").toString());
				

		if ( reserveservice.exsitReserve(reserve_id) != null ) {
			msg.add(String.valueOf(reserveservice.updateReserve(reserve_id, state)));
			return msg;
		}else {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			msg.add("faill");
			return msg;
		}
		
		
	}
	
	

	@RequestMapping(value="/space/newReserve", method = RequestMethod.GET)
	public ModelAndView showform(HttpSession session, @RequestParam int space_id) {
		

		ModelAndView mav = new ModelAndView();
		mav.setViewName(formViewName);
		mav.addObject("space", spaceservice.getSpaceById(space_id) );
		return mav;
	}
	
	
	
	@RequestMapping(value="/space/newReserve", method = RequestMethod.POST)
	public String onSubmit(HttpSession session, HttpServletRequest request, @RequestParam int space_id) throws Exception {
		
		//필요한 데이더 먼저 끌어 모아 버리기
		MemberSession membersession = (MemberSession) session.getAttribute("memberSession");
		int peoplenum =  Integer.parseInt(request.getParameter("peoplenum"));
		int total_cost =  Integer.parseInt(request.getParameter("total_cost"));

		int credit_amount = 0;
		if (!request.getParameter("credit_amount").equals("")) {
			credit_amount = Integer.parseInt(request.getParameter("credit_amount")) * 1;
		}
		
		String sDate = request.getParameter("userdate")+" "+request.getParameter("StartTime")+":00:00";
		String eDate = request.getParameter("userdate")+" "+request.getParameter("EndTime")+":00:00";		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date startDate = transFormat.parse(sDate);
		Date endDate = transFormat.parse(eDate);
		
		Space space = spaceservice.getSpaceById(space_id);
		
		reserve = new Reserve(space, membersession.getMember(), peoplenum, 0, startDate, endDate, total_cost);
		credit = new Credit(membersession.getMember(), "공간 " + space.getTitle()+" 예약에 사용", credit_amount);
		

		return "redirect:" + kakaoPayService.kakaoPayReady(reserve);
		

		
	}
	
	@RequestMapping(value="/kakaoPaySuccess", method = {RequestMethod.GET, RequestMethod.POST})
    public String kakaoPaySuccess(HttpSession session, @RequestParam("pg_token") String pg_token) {
		
		MemberSession membersession = (MemberSession) session.getAttribute("memberSession");
		
        KakaoPayApproval kakaoPayApproval = kakaoPayService.kakaoPayInfo(pg_token, reserve);
		        
        reserve.setPayment_id(kakaoPayApproval.getTid());
        if (kakaoPayApproval.getPayment_method_type().equals("MONEY"))
        	reserve.setPayment("카카오 페이 머니");
        else
        	reserve.setPayment(kakaoPayApproval.getCard_info().getPurchase_corp());
        
		reserveservice.insertReserve(reserve);
		
		if(credit.getAmount() != 0) {
	         ozoFacade.insertCreditHistory(credit);
	         membersession.getMember().getCredit_history().add(credit);
	     }
				
		sendmail.ComReserToCus(membersession.getMember(), reserve);
		sendmail.ComReserToPro(reserve.getSpace(), reserve);
		
	
		
		return "redirect:/reserve/veiwreserve?reserve_id="+reserve.getReserve_id();
		

    }
	
	
	


}
