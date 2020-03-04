package org.springframework.ozo.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ozo.dao.SpaceDao;
import org.springframework.ozo.domain.Space;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("SpaceService")
public class SpaceServiceImpl implements SpaceService{
	
	
	@Autowired
	private SpaceDao spacedao;
	
	
	
	@Override
	public List<Space> getAllSpace() {
		return spacedao.getAllSpace();
	}
	
	@Override
	public List<Space> getSpaceMain() {
		return spacedao.getSpaceMain();
	}
	
	@Override
	public List<Space> getMySpace(String memId) {
		return spacedao.getMySpace(memId);
	}
	
	@Override
	public Space getSpaceById(int space_id) {
		return spacedao.getSpaceById(space_id);
	}
	
	@Override
	public List<Space> searchSpace(Map<String, String> map) {
		return spacedao.searchSpace(map);
	}
	
	@Override
	public List<Space> searchSpace2(Map<String, String> map) {
		return spacedao.searchSpace2(map);
	}
	
	
	@Transactional
	@Override
	public void insertSpace(Space space) {
		spacedao.insertSpace(space);		
	}

	@Transactional
	@Override
	public void updateSpace(Space space)	{
		spacedao.updateSpace(space);
	}


	@Override
	public List<Space> getRateTop() {
		return spacedao.getRateTop();
	}
	
	@Override
	public List<Space> getJjimTop() {
		return spacedao.getJjimTop();
	}

	public Integer updateTotalRate(Map<String, Object> map)   {
	      return spacedao.updateTotalRate(map);
	}


	public List<Space> getOrderByRate() {
		return spacedao.getOrderByRate();
	}

	@Transactional
	@Override
	public Integer updateJjim(String memId, int space_id, int jjim_check) {
		int result = spacedao.updateJjim(memId, space_id, jjim_check);
		
		if (jjim_check == 1) {
			result = spacedao.updateJjimcnt(space_id, 1);
		}
		else {
			result = spacedao.updateJjimcnt(space_id, -1);
		}
		
		return result;
		
	}

	@Transactional
	@Override
	public Integer createJjim(String memId, int space_id, int jjim_check) {
		int result =  spacedao.createJjim(memId, space_id, jjim_check);
		result = spacedao.updateJjimcnt(space_id, 1);
		
		return result;
	}

	@Override
	public List<Space> myJjimSpace(String memId) {
		return spacedao.myJjimSpace(memId);
	}
	
	@Override
	public String getMemIdBySpaceId(int space_id)	{
		return spacedao.getMemIdBySpaceId(space_id);
	}
		
	@Override
	public Integer countSpaceBymemId(String memId)	{
		return spacedao.countSpaceBymemId(memId);
	}

	@Override
	public List<Space> getOrderByJJim() {
		return spacedao.getOrderByJJim();

	}

	

	


}
	

	
	

