package org.springframework.ozo.mybatis.mapper;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.ozo.domain.Space;

public interface SpaceMapper {

	List<Space> getRateTop();
	
	List<Space> getJjimTop();
	
	List<Space> getAllSpace();
	
	List<Space> getSpaceMain();
	
	List<Space> getMySpace(String memId);
	
	List<Space> myJjimSpace(String memId);
	
	Space getSpaceById(int space_id);
	
	Space viewSpace(int space_id);
	
	void deleteSpace(int space_id);
	
	List<Space> searchSpace(Map<String, String> map);
	
	List<Space> searchSpace2(Map<String, String> map);
	
	//	배열때문에ㅠㅠㅠ
	Integer insertSpace(Space space);
	Integer insertSpaceImage(@Param("image_list") List<String> image_list);

	
	Integer updateSpace(Space space);
	Integer deleteBeforeUpdate(int space_id);
	Integer reinsertSpaceImage(Space space);
	
	
	
	@Update("UPDATE space " + 
	         "SET total_rate = #{total_rate} " + 
	         "WHERE space_id = #{space_id}")   
	   Integer updateTotalRate(Map<String, Object> map);

	List<Space> getOrderByRate();
	
	List<Space> getOrderByJJim();
	
	@Select("SELECT memId " + 
			"FROM space WHERE space_id = #{space_id}")
	String getMemIdBySpaceId(int space_id);
	
	@Select("SELECT COUNT(*) FROM space WHERE memId = #{memId}")
	Integer countSpaceBymemId(String memId);
	
	
	@Update("UPDATE space "+
			"SET jjim_cnt = jjim_cnt + #{param2} "+
			"WHERE space_id = #{param1}")
	Integer updateJjimcnt(int space_id, int amount);



}
