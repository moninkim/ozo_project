package org.springframework.ozo.service;


import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import org.springframework.ozo.domain.Space;
import org.springframework.ozo.mybatis.mapper.SpaceMapper;

public interface SpaceService {

	List<Space> getRateTop();
	
	List<Space> getJjimTop();
	
	List<Space> getSpaceMain();
	
	List<Space> getAllSpace();
	
	List<Space> getMySpace(String memId);
	
	List<Space> myJjimSpace(String memId);
	
	public Space getSpaceById(int space_id);
	
	List<Space> getOrderByJJim();
	
	public List<Space> searchSpace(Map<String, String> map);
	
	public List<Space> searchSpace2(Map<String, String> map);
	
	void insertSpace(Space space);
	
	void updateSpace(Space space);
	
	Integer updateTotalRate(Map<String, Object> map);

	Integer updateJjim(String memId, int space_id, int jjim_check);
	
	Integer createJjim(String memId, int space_id, int jjim_check);

	String getMemIdBySpaceId(int space_id);

	Integer countSpaceBymemId(String memId);

}
