package org.springframework.ozo.controller;


import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.ozo.service.OzoFacade;
import org.springframework.ozo.validator.SignupCommandValidator;



@Controller
@RequestMapping({ "/member/signup" })
public class SignupController {

	@Value("member/signupForm")
	private String formViewName;
	

	@Autowired
	private OzoFacade ozoFacade;
	public void setOzo(OzoFacade ozoFacade) {
		this.ozoFacade = ozoFacade;
	}

	@Autowired
	private SignupCommandValidator validator;
	public void setValidator(SignupCommandValidator validator) {
		this.validator = validator;
	}
	
	
	@Autowired
	private JavaMailSender mailSender;
	

	@ModelAttribute("signupCommand")
	public SignupCommand formBackingObject(HttpServletRequest request) throws Exception {
		return new SignupCommand();
	}

	@RequestMapping(method = RequestMethod.GET)
	public String showForm() {
		
		return formViewName;
	}
	
	
	@RequestMapping(method = RequestMethod.POST)
	public String onSubmit(HttpServletRequest request, HttpSession session,
			@ModelAttribute("signupCommand") SignupCommand signupCommand, BindingResult result) throws Exception {

		validator.validate(signupCommand, result);
		
		
		if (result.hasErrors()) {
			return formViewName;
		}
		try {
				ozoFacade.insertMember(signupCommand.getMember());
			
		} catch (DataIntegrityViolationException ex) {
			result.rejectValue("member.memId", "USER_ID_ALREADY_EXISTS","이미 존재하는 아이디입니다.");
			return formViewName;
		}
		
		//가입메일 발송
	    String content = "<h1>반갑습니다 <strong>" + signupCommand.getMember().getName() +"</strong>님:D </h1><hr>"
	    				+"<h5>Project OZO에 가입해 주셔서 감사합니다. 열심히 개발해보겠슴다!<h5><br>"
	    				+ signupCommand.getMember().getName() + "님은 현재 <b>" 
	    				+ signupCommand.getMember().getMemberType() + "</b> 으로 가입하셨습니다.<br><br><br>"
	    				+"<ul>일개미 목록</ul>"
	    				+"<li>20150711 권지민</li> <li>20141119 조송이</li> <li>20160939 김유정</li> <li>20160953 박보람</li>"
	    				+"동덕여자대학교 소프트웨어시스템개발 01분반 05팀 팀프로젝트OZO<br>";    
	   
	    try {
	      MimeMessage message = mailSender.createMimeMessage();
	      MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	 
	      messageHelper.setFrom("ddprojectozo@gmail.com");  
	      messageHelper.setTo(signupCommand.getMember().getEmail());     
	      messageHelper.setSubject("OZO에 가입해주셔서 감사합니다!"); 
	      messageHelper.setText(content, true);  
	      mailSender.send(message);
	    } catch(Exception e){
	      System.out.println(e);
	    }

		
		MemberSession memberSession = new MemberSession(ozoFacade.getMemberBymemId(signupCommand.getMember().getMemId()));
		session.setAttribute("memberSession", memberSession);
		return "redirect:/index";
	}
}
