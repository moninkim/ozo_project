package org.springframework.ozo.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.ozo.domain.Review;

public interface ReviewMapper {
	
	Integer insertReview(Map<String, Object> map);
	
	
	List <Review> getReviewBySpaceId(int space_id);
	
	@Select("SELECT rv.reply, rv.rate, rv.content, rv.write_date as writeDate "+
			"FROM RESERVE r, REVIEW rv " + 
			"WHERE r.reserve_id = #{reserve_id} AND r.reserve_id = rv.reserve_id")
	Review getReviewByReserveId(int reserve_id);
	
	
	@Select("SELECT * " + 
			"FROM (SELECT *  FROM REVIEW r ORDER BY RATE DESC, r.write_date DESC ) " + 
			"WHERE ROWNUM <= 5")
	List <Review> Top5();

	@Select ("SELECT AVG(r.rate) " + 
			 "FROM REVIEW r JOIN RESERVE rs ON r.reserve_id = rs.reserve_id JOIN SPACE s ON s.space_id = rs.space_id " +
			 "AND s.space_id = #{space_id}")
	Double getAvgRate(int space_id);

	@Update("UPDATE REVIEW "+
			"SET reply = #{reply} "+
			"WHERE reserve_id = #{reserve_id}")
	void insertReply(Map<String, Object> map);
	
	
	@Select("SELECT memId FROM space WHERE space_id = #{space_id}")
	String getHostIdBySpace_id(int space_id);
	
	@Update ("UPDATE member m " + 
			"SET m.grade = (SELECT ROUND(AVG(s.total_rate), 2) " +
					"FROM space s WHERE s.memId = #{memId} AND s.total_rate != 0) " +
				"WHERE m.memId = #{memId}")
	Integer updateTotalRate(String memId);


}
