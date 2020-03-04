package org.springframework.ozo.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import org.springframework.ozo.controller.SignupCommand;
import org.springframework.ozo.domain.Member;

@Component
public class SignupCommandValidator implements Validator {
	

	public boolean supports(Class<?> clazz) {
		return Member.class.isAssignableFrom(clazz);
	}

	public void validate(Object obj, Errors errors) {
		SignupCommand memberForm = (SignupCommand)obj; 
		Member member = memberForm.getMember();
		

		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "member.memberType", "MEMBER_TYPE_REQUIRED", "회원 유형 필수 입력");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "member.name", "NAME_REQUIRED", "이름 필수 입력");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "member.email", "EMAIL_REQUIRED", "이메일 필수 입력");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "member.phone", "PHONE_REQUIRED", "전화번호 필수 입력");
		
		if (memberForm.isNewMember()) {
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "member.memId", "USER_ID_REQUIRED", "아이디 필수 입력");
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "member.password", "MEMBER_PASSWORD_REQUIRED", "비밀번호 필수 입력");
			
			
			if (member.getPassword().length() < 5 ) {
				errors.rejectValue("member.password", "PASSWORD_SHORT", "비밀번호는 5글자 이상");
			}
			if (!member.getPassword().equals(memberForm.getRepeatedPassword())) {
				errors.rejectValue("member.password", "PASSWORD_MISMATCH", "비밀번호와 비밀번호 확인이 일치하지 않습니다");
			}
		}
		else if (member.getPassword() != null && member.getPassword().length() > 0) {
			if (!member.getPassword().equals(memberForm.getRepeatedPassword())) {
				errors.reject("PASSWORD_MISMATCH", "비밀번호와 비밀번호 확인이 일치하지 않습니다");
			}
		}
		
		
		if (member.getPhone().matches("01[01679]-\\d{3,4}-\\d{4}") == false)
			errors.rejectValue("member.phone", "invalidFormat"); 
	}
}
