package org.springframework.ozo.controller;


import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.dao.DataIntegrityViolationException;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.util.WebUtils;
import org.springframework.ozo.service.FileUploadService;
import org.springframework.ozo.service.OzoFacade;
import org.springframework.ozo.validator.SignupCommandValidator;



@Controller
@RequestMapping({ "/member/update" })
public class UpdateMemberController {

	@Value("member/updateForm")
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
	FileUploadService fileUploadService;
		
	MemberSession memberSession;
	
	@ModelAttribute("signupCommand")
	public SignupCommand formBackingObject(HttpServletRequest request) throws Exception {
		
		memberSession = (MemberSession) WebUtils.getSessionAttribute(request, "memberSession");
		return new SignupCommand( ozoFacade.getMemberBymemId(memberSession.getMember().getMemId()) );
	}

	@RequestMapping(method = RequestMethod.GET)
	public String showForm(HttpServletRequest request) {
		
		if ( request.getParameter("password").equals( memberSession.getMember().getPassword() ) ) //입력 비밀번호 같다고?
			return formViewName;
		else {
			request.setAttribute("errormsg", "비밀번호가 일치하지 않습니다");
			return "member/memcheck";
		}
		
	}
	
	
	@RequestMapping(method = RequestMethod.POST)
	public String onSubmit(HttpServletRequest request, HttpSession session,
			@ModelAttribute("signupCommand") SignupCommand signupCommand, BindingResult result) throws Exception {

		validator.validate(signupCommand, result);
		
		
		if (result.hasErrors()) {
			return formViewName;
		}
		try {
			
			ozoFacade.updateMember(signupCommand.getMember());
				
		} catch (DataIntegrityViolationException ex) {
			return formViewName;
		}
		
		((MemberSession) session.getAttribute("memberSession")).setMember(ozoFacade.getMemberBymemId(signupCommand.getMember().getMemId()));
		
		return "redirect:/member/mypage";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/ChangeProfile", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public String fileUploadAjax(MultipartRequest multipartRequest,HttpSession session) throws IOException{

	MultipartFile file = multipartRequest.getFile("file");	
	String memId = ((MemberSession)session.getAttribute("memberSession")).getMember().getMemId();
	String fileName = fileUploadService.changeProfile(file, memId);
	
	ozoFacade.updateProfileImg(memId, fileName);
	((MemberSession) session.getAttribute("memberSession")).getMember().setProfile(fileName);
	return fileName;
	}
}
