package org.springframework.ozo.mybatis.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface JjimMapper {
	
	@Select("SELECT COUNT(*) " + 
			"FROM jjim " + 
			"WHERE memid = #{param1} AND space_id = #{param2}")
	Integer checkJjim(String memId, int space_id);
	
	
	@Update("UPDATE JJIM SET " +
			"jjim_check = #{param3} " + 
			"WHERE memid = #{param1} AND space_id = #{param2}")
	Integer updateJjim(String memId, int space_id, int jjim_check);
	
	@Insert("INSERT INTO JJIM (memid, space_id, jjim_check) " +
			"VALUES (#{param1}, #{param2}, #{param3}) ")
	Integer createJjim(String memId, int space_id, int jjim_check);
	
	
	
}
