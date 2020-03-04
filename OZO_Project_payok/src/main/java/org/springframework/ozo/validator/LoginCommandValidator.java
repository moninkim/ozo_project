package org.springframework.ozo.validator;

import org.springframework.ozo.controller.LoginCommand;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;


@Component
public class LoginCommandValidator implements Validator{
	
	@Override
	public boolean supports(Class<?> clazz) {
		return LoginCommand.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "memId", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "required");
	}
}
