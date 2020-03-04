package org.springframework.ozo.validator;

import org.springframework.ozo.controller.FindCommand;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class reviewCommandValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return FindCommand.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "review.rate", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "review.content", "required");
	}
}
