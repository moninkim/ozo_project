package org.springframework.ozo.controller.space;


import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ozo.controller.MemberSession;
import org.springframework.ozo.domain.Space;
import org.springframework.ozo.service.FileUploadService;
import org.springframework.ozo.service.SpaceServiceImpl;
import org.springframework.ozo.service.StringToList;
import org.springframework.ozo.validator.SpaceCommandValidator;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


@Controller
@RequestMapping("/space/newRegister")
public class RegisterSpaceController {
	
	@Value("space/registerForm")
	private String formViewName;
	@Value("space/registered")
	private String successViewName;
	

	@Autowired
	private SpaceServiceImpl spaceservice;
		
	@Autowired
	FileUploadService fileUploadService;
	
	@Autowired
	private SpaceCommandValidator validator;
	
	
	@ModelAttribute("spaceTypeList")
	public String[] getSpaceTypeList() {
		return new String[] {"다목적홀", "세미나", "엠티", "스튜디오", "연습실", "공연장", "작업실", "스터디룸", "회의실", "코워킹스페이스", "파티룸", "레저시설"};
	}
	
	
	@ModelAttribute("spaceCommand")
	public SpaceCommand formBackingObject(HttpServletRequest request) throws Exception {
			return new SpaceCommand();
	}

	
	@RequestMapping(method = RequestMethod.GET)
	public String showform(HttpSession session) {	
		
		MemberSession ms = (MemberSession) session.getAttribute("memberSession");
		if ((ms.getMember().getMemberType()).equals("customer")) {
			return "redirect:/NoPermission";
		}
		return formViewName;
	
	}
	
	
	@RequestMapping(method = RequestMethod.POST)
	public String onSubmit(MultipartHttpServletRequest request, HttpSession session, @ModelAttribute("spaceCommand") SpaceCommand spaceCommand, 
			@RequestParam(required=false) List<MultipartFile> images, BindingResult result) throws Exception {
		
		validator.validate(spaceCommand, result);
		if (result.hasErrors()) {
			System.out.println("에러 발색ㅇ!!!");
			return formViewName;
		}
		
		Space newSpace = spaceCommand.getSpace();
		
		
		MemberSession msession = (MemberSession) session.getAttribute("memberSession");
		newSpace.setMember(msession.getMember());

	    newSpace.setImage_list( fileUploadService.restore(request, images) );
	    
	    
	    spaceservice.insertSpace(newSpace);
		return "redirect:/space/viewspace?space_id=" + newSpace.getSpace_id();
	}
	
	

}
