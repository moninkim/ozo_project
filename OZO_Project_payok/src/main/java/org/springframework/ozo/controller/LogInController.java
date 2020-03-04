package org.springframework.ozo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ozo.domain.Member;
import org.springframework.ozo.service.LoginException;
import org.springframework.ozo.service.OzoFacade;
import org.springframework.ozo.validator.LoginCommandValidator;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/member/login")
public class LogInController {
	
	private String formViewName = "member/loginForm";

	@Autowired
	private OzoFacade ozoFacade;

	public void setOzo(OzoFacade ozoFacade) {
		this.ozoFacade = ozoFacade;
	}
	
	
	@Autowired
	private LoginCommandValidator validator;

	public void setValidator(LoginCommandValidator validator) {
		this.validator = validator;
	}

	@RequestMapping(method = RequestMethod.GET)
	public String form() {
		return formViewName;
	}

	@ModelAttribute
	public LoginCommand formBacking() {
		return new LoginCommand();
	}

	@RequestMapping(method = RequestMethod.POST)
	public String submit(@ModelAttribute("loginCommand") LoginCommand loginCommand, HttpSession session, BindingResult result) {
		validator.validate(loginCommand, result);

		
		if (result.hasErrors()) {
			return formViewName;
		}
		try {
				Member member = ozoFacade.getMemberBymemId(loginCommand.getMemId());
				
				if (member == null) throw new LoginException("iddoesnotexist");
			
				if ( member.getPassword().equals(loginCommand.getPassword()) ) {
					MemberSession memberSession = new MemberSession(member);
					memberSession.getMember().setCredit_history(ozoFacade.getCreditHistory(loginCommand.getMemId()));
					session.setAttribute("memberSession", memberSession);
				}
				else {
					throw new LoginException("invalidIdOrPassword.loginCommand");
				}
				
				if (session.getAttribute("prevPage") != null)
					return "redirect:"+session.getAttribute("prevPage");
				else
					return "redirect:/index";
				
		} catch (LoginException e) {
			result.reject(e.getMessage(), new Object[] { loginCommand.getMemId() }, null);
			return formViewName;
		}
	}

	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.setValidator(new LoginCommandValidator());
	}

	
}
