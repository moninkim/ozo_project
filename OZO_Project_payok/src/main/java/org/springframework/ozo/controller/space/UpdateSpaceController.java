package org.springframework.ozo.controller.space;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.dao.DataIntegrityViolationException;
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
@RequestMapping({ "/space/update" })
public class UpdateSpaceController {

	@Value("space/updateForm")
	private String formViewName;
	
	@Autowired
	private SpaceServiceImpl spaceservice;
	
	@Autowired
	FileUploadService fileUploadService;
	
	@Autowired
	private SpaceCommandValidator validator;

	
	@ModelAttribute("spaceCommand")
	public SpaceCommand formBackingObject(@RequestParam("space_id")int space_id, HttpServletRequest request) throws Exception	{
		
		Space space = spaceservice.getSpaceById(space_id);
		SpaceCommand spaceCommand = new SpaceCommand(space);
		
		return spaceCommand;
	}
	
	
	@RequestMapping(method = RequestMethod.GET)
	public String showForm(HttpServletRequest request)	{
		return formViewName;
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String onSubmit(MultipartHttpServletRequest request, HttpSession session, @ModelAttribute("spaceCommand") SpaceCommand spaceCommand,
			@RequestParam(required=false) List<MultipartFile> images, BindingResult result) throws Exception	{
		
		validator.validate(spaceCommand, result);
		
		if (result.hasErrors())	{
			System.out.println("에러 발생 ! !");
			return formViewName;
		}
		
		try	{
			Space updateSpace = spaceCommand.getSpace();
		
			MultipartFile uploadfile = spaceCommand.getImages(); 			 
		    String fname = uploadfile.getOriginalFilename(); 
		    if (!fname.equals("")) {
		    	updateSpace.setImage_list( fileUploadService.restore(request, images));	
		    }
		    else {
		    	updateSpace.setImage_list( spaceCommand.getSpace().getImage_list() );
		    }
			

			spaceservice.updateSpace(updateSpace);
			
		    return "redirect:/space/viewspace?space_id=" + updateSpace.getSpace_id();
			
		} catch (DataIntegrityViolationException ex)	{
			return formViewName;
		}	
	}
}




