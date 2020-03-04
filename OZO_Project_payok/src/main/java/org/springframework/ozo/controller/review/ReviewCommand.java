package org.springframework.ozo.controller.review;

import javax.validation.constraints.NotNull;

import org.springframework.ozo.domain.Review;

public class ReviewCommand {

	@NotNull
	private Review review;

	public Review getReview() {
		return review;
	}

	public void setReview(Review review) {
		this.review = review;
	}
	
	
	
}
