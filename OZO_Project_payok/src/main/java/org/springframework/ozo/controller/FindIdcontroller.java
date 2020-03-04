package org.springframework.ozo.controller;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.ozo.domain.Member;
import org.springframework.ozo.service.LoginException;
import org.springframework.ozo.service.OzoFacade;
import org.springframework.ozo.validator.FindCommandValidator;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping({ "/member/findId" })
public class FindIdcontroller {
	
	@Value("member/findIdForm")
	private String findViewName;
	
	@Autowired
	private OzoFacade ozoFacade;

	public void setOzo(OzoFacade ozoFacade) {
		this.ozoFacade = ozoFacade;
	}
	
	@Autowired
	private FindCommandValidator validator;

	public void setValidator(FindCommandValidator validator) {
		this.validator = validator;
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public String showForm() {
		
		return findViewName;
	}
	
	@Autowired
	private JavaMailSender mailSender;
	
	
	@ModelAttribute
	public FindCommand formBacking() {
		return new FindCommand();
	}
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView submit(@ModelAttribute("findCommand") FindCommand findCommand, BindingResult result) {
		validator.validate(findCommand, result);
		ModelAndView mav = new ModelAndView();

				System.out.println(findCommand.getMemName() + findCommand.getMemEmail() + findCommand.getMemPhone());
				Member member = ozoFacade.getMemberIdByEmail(findCommand.getMemName(), findCommand.getMemEmail(), findCommand.getMemPhone());
				mav.setViewName("member/checkIdPassword");
				String content = "<h1>반갑습니다 <strong>" + findCommand.getMemName() +"</strong>님:D </h1><hr>"
	    				+"<h5>Project OZO에 가입하신 아이디" + member.getMemId() +"의 비밀번호를 알려드리겠습니다!</h5><br>"
	    				+ "<h5>현재 비밀번호는 " + member.getPassword()  + "입니다!!</h5><br>"
	    				+ "<h5>홈페이지 주소는 http://localhost:8091/OZO_Project/ 입니다!</h5><br>"
	    				+"<ul>일개미 목록</ul>"
	    				+"<li>20150711 권지민</li> <li>20141119 조송이</li> <li>20160939 김유정</li> <li>20160953 박보람</li>"
	    				+"동덕여자대학교 소프트웨어시스템개발 01분반 05팀 팀프로젝트OZO<br>";
				 try {
				      MimeMessage message = mailSender.createMimeMessage();
				      MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				 
				      messageHelper.setFrom("ddprojectozo@gmail.com");  
				      messageHelper.setTo(findCommand.getMemEmail());     
				      messageHelper.setSubject("OZO에 가입하신 아이디의 비밀번호를 알려드립니다!"); 
				      messageHelper.setText(content, true);  
				      mailSender.send(message);
				    } catch(Exception e){
				      System.out.println(e);
				    }
				mav.addObject( "name", findCommand.getMemName());
				mav.addObject( "id", member.getMemId());
				mav.addObject( "password", member.getPassword());
				return mav;
			

	}
}
