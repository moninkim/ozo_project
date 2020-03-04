package org.springframework.ozo.mybatis.mapper;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.ozo.domain.Reserve;

public interface ReserveMapper {
	
	
	@Select("SELECT reserve_id "+
			"FROM reserve " +
			"WHERE reserve_id = #{reserve_id}")
	Integer exsitReserve(int reserve_id);
	
	
	@Update("UPDATE RESERVE SET " +
	   	    "STATE = #{state} " +
			"WHERE reserve_id = #{reserve_id}")
	Integer updateReserve(Map<String, Object> map);
	
	List<Date> getAvailabilityDate(Map<String, Object> map);
	
	Integer insertReserve(Reserve reserve);
	
	Reserve getReserveById(int reserve_id);

	List<Reserve> getMyReserveForCus(String mem_id);
	
	List<Reserve> getMyReserveForPro(String mem_id);
	
	List<Reserve> getReserveByStateForPro(Map<String, Object> map);
	
	@Select("SELECT s.space_id " + 
			"FROM reserve r, space s " + 
			"where s.space_id = r.space_id AND r.reserve_id = #{reserve_id}")
	Integer getSpaceIdByReserveId(int reserve_id);


}
