package org.springframework.ozo.service;

import java.util.List;

import org.springframework.ozo.domain.Review;

public interface ReviewService {
	
	void insertReview(Review review, int reserve_id);
	
	List <Review> getReviewBySpaceId(int space_id);

	Review getReviewByReserveId(int reserve_id);
	
	Double getAvgRate(int space_id);
	
	void insertReply(String comment, int reserve_id);
	
	String getHostBySpace_id(int space_id);
	
	void updateTotalRate(String memId);

}
