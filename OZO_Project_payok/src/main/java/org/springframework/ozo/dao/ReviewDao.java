package org.springframework.ozo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.ozo.domain.Reserve;
import org.springframework.ozo.domain.Review;
import org.springframework.ozo.mybatis.mapper.ReserveMapper;
import org.springframework.ozo.mybatis.mapper.ReviewMapper;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public Integer insertReview(Review review, int reserve_id) throws DataAccessException {
		Map<String, Object> map = new HashMap<String, Object>(); 
        map.put("reserve_id", reserve_id);
        map.put("review", review);
		Integer result = sqlSession.getMapper(ReviewMapper.class).insertReview(map);
		return result;
	}
	
	public List <Review> getReviewBySpaceId(int space_id) throws DataAccessException {
		return sqlSession.getMapper(ReviewMapper.class).getReviewBySpaceId(space_id);
	}
	
	public Review getReviewByReserveId(int reserve_id) throws DataAccessException {
		return sqlSession.getMapper(ReviewMapper.class).getReviewByReserveId(reserve_id);
	}

	public Double getAvgRate(int space_id) throws DataAccessException	{
		return sqlSession.getMapper(ReviewMapper.class).getAvgRate(space_id);
	}
	
	public void insertReply(String reply, int reserve_id)throws DataAccessException {
		Map<String, Object> map = new HashMap<String, Object>(); 
        map.put("reserve_id", reserve_id);
        map.put("reply", reply);
		
        sqlSession.getMapper(ReviewMapper.class).insertReply(map);
	}
	
	public String getHostBySpace_id(int space_id) throws DataAccessException	{
		return sqlSession.getMapper(ReviewMapper.class).getHostIdBySpace_id(space_id);
	}
	
	public Integer updateTotalRate(String memId) throws DataAccessException	{
		
		return sqlSession.getMapper(ReviewMapper.class).updateTotalRate(memId);
	}


}
