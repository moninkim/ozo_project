package org.springframework.ozo.validator;



import org.springframework.ozo.controller.space.SpaceCommand;
import org.springframework.ozo.domain.Space;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class SpaceCommandValidator implements Validator{
	
	@Override
	public boolean supports(Class<?> clazz) {
		return SpaceCommand.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "space.type", "REQUIRED", "유형 필수입력.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "space.area", "REQUIRED", "주소 필수입력.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "space.title", "REQUIRED", "제목 필수입력.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "space.introduce", "REQUIRED", "소개 필수입력.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "space.facility", "REQUIRED", "시설 필수입력.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "space.guide", "REQUIRED", "주의사항 필수입력.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "space.max_people", "REQUIRED", "정원 필수입력.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "space.cost", "REQUIRED", "가격 필수입력.");

		
		SpaceCommand sc = (SpaceCommand)target; 
		Space s = sc.getSpace();
		if ( s.getCost() < 0 ) {
			errors.reject("The COST is too LOW","비용은 0원 이상이어야 합니다.");
		}
		if ( s.getMax_people() <= 0 ) {
			errors.reject("Personnel Error","인원수는 1명 이상이어야 합니다.");
		}
	}

}
