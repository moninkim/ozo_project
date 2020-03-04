package org.springframework.ozo.controller.review;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ozo.controller.MemberSession;
import org.springframework.ozo.domain.Credit;
import org.springframework.ozo.domain.Member;
import org.springframework.ozo.domain.Reserve;
import org.springframework.ozo.domain.Space;
import org.springframework.ozo.service.OzoFacade;
import org.springframework.ozo.service.ReserveServiceImpl;
import org.springframework.ozo.service.ReviewService;
import org.springframework.ozo.service.SpaceService;
import org.springframework.ozo.service.SpaceServiceImpl;
import org.springframework.ozo.validator.FindCommandValidator;
import org.springframework.ozo.validator.reviewCommandValidator;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping({ "/review/write" })
public class ReviewController {
	
	@Value("review/registerForm")
	private String reviewViewName;
	
	
	@Autowired
	private ReviewService reviewservice;
	public void setReview(ReviewService reviewservice) {
		this.reviewservice = reviewservice;
	}
	
	@Autowired
	private ReserveServiceImpl reserveservice;
	public void setReserveservice(ReserveServiceImpl reserveservice) {
		this.reserveservice = reserveservice;
	}
	
	@Autowired
	private OzoFacade ozoFacade;
	
	@Autowired
	private reviewCommandValidator validator;

	public void setValidator(reviewCommandValidator validator) {
		this.validator = validator;
	}
	
	@Autowired
	   private SpaceService spaceservice;
	   public void setSpaceService(SpaceService spaceservice)   {
	      this.spaceservice = spaceservice;
	   }
	
	@RequestMapping(method = RequestMethod.GET)
	public String showForm(HttpSession session) {
		
		return reviewViewName;
	}

	@ModelAttribute
	public ReviewCommand formBacking() {
		return new ReviewCommand();
	}
	
	@RequestMapping(method = RequestMethod.POST)
	   public String onSubmit(HttpSession session, HttpServletRequest request, @RequestParam("reserve_id") int reserve_id,
	         @ModelAttribute("reviewCommand") ReviewCommand reviewCommand, BindingResult result) throws Exception  {
	      validator.validate(reviewCommand, result);
	      
	      reviewservice.insertReview(reviewCommand.getReview(), reserve_id);
	      
	      MemberSession membersession = (MemberSession)session.getAttribute("memberSession");
	      Credit credit = new Credit(membersession.getMember(), "예약 번호 : " + reserve_id +" 후기 작성 완료 기념 지급", 100);
	      ozoFacade.insertCreditHistory(credit);      
	      membersession.getMember().getCredit_history().add(credit);
	      
	      Reserve reserve = reserveservice.getReserveById(reserve_id);
	      reserveservice.updateReserve(reserve_id, 2);
	      
	      int space_id = reserveservice.getSpaceIdByReserveId(reserve_id);
	      double avg_rate = reviewservice.getAvgRate(space_id);
	      Map<String, Object> map = new HashMap<String, Object>();
	      map.put("space_id", space_id);
	      map.put("total_rate", avg_rate);
	      spaceservice.updateTotalRate(map);
	      
	      String memId = reviewservice.getHostBySpace_id(space_id);
	      reviewservice.updateTotalRate(memId);

	      return "redirect:/reserve/veiwreserve?reserve_id=" + String.valueOf(reserve_id);
	   }
	
}
