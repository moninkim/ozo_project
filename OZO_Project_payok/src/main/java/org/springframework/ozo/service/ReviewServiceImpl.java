package org.springframework.ozo.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ozo.dao.ReviewDao;
import org.springframework.ozo.domain.Review;
import org.springframework.stereotype.Service;

@Service("ReviewService")
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDao reviewdao;
	
	public Double getAvgRate(int space_id)	{
		return reviewdao.getAvgRate(space_id);
	}


	@Override
	public void insertReview(@Param("review")Review review, @Param("reserve_id") int reserve_id) {
		reviewdao.insertReview(review, reserve_id);		
	}
	
	public List <Review> getReviewBySpaceId(int space_id) {
		return reviewdao.getReviewBySpaceId(space_id);
	}

	@Override
	public Review getReviewByReserveId(int reserve_id) {
		return  reviewdao.getReviewByReserveId(reserve_id);
	}
	
	@Override
	public void insertReply(String comment, int reserve_id) {
		 reviewdao.insertReply(comment, reserve_id);
	}
	
	@Override
	public String getHostBySpace_id(int space_id)	{
		return reviewdao.getHostBySpace_id(space_id);
	}
	
	@Override
	public void updateTotalRate(String memId)	{
		reviewdao.updateTotalRate(memId);
	}

	
}
