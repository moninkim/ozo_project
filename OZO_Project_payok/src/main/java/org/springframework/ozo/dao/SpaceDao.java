package org.springframework.ozo.dao;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.ozo.domain.Space;
import org.springframework.ozo.mybatis.mapper.JjimMapper;
import org.springframework.ozo.mybatis.mapper.SpaceMapper;
import org.springframework.stereotype.Repository;

@Repository
public class SpaceDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public List<Space> getRateTop() throws DataAccessException {
		return sqlSession.getMapper(SpaceMapper.class).getRateTop();
	}
	
	public List<Space> getJjimTop() throws DataAccessException {
		return sqlSession.getMapper(SpaceMapper.class).getJjimTop();
	}
	
	public List<Space> getAllSpace()  throws DataAccessException {
		return sqlSession.getMapper(SpaceMapper.class).getAllSpace();
	}
	
	
	public List<Space> getSpaceMain()  throws DataAccessException {
		return sqlSession.getMapper(SpaceMapper.class).getSpaceMain();
	}
	
	public List<Space> getMySpace(String memId) {
		return sqlSession.getMapper(SpaceMapper.class).getMySpace(memId);
	}
	
	public List<Space> myJjimSpace(String memId) {
		return sqlSession.getMapper(SpaceMapper.class).myJjimSpace(memId);
	}
	
	public Space getSpaceById(int space_id)  throws DataAccessException {
		return sqlSession.getMapper(SpaceMapper.class).getSpaceById(space_id);
	}
	
	public List<Space> searchSpace(Map<String, String> map) {
		return sqlSession.getMapper(SpaceMapper.class).searchSpace(map);
	}
	
	public List<Space> searchSpace2(Map<String, String> map) {
		return sqlSession.getMapper(SpaceMapper.class).searchSpace2(map);
	}
	

	
	public Integer insertSpace(Space space) throws DataAccessException {
		Integer result = sqlSession.getMapper(SpaceMapper.class).insertSpace(space);
		result = sqlSession.getMapper(SpaceMapper.class).insertSpaceImage(space.getImage_list());

		return result;
	}
	
	
	
	
	public List<Space> getOrderByRate() throws DataAccessException	{
		return sqlSession.getMapper(SpaceMapper.class).getOrderByRate();
	}
	
	public List<Space> getOrderByJJim() throws DataAccessException	{
		return sqlSession.getMapper(SpaceMapper.class).getOrderByJJim();
	}

	
	public Integer updateSpace(Space space) throws DataAccessException {
		
		Integer result = sqlSession.getMapper(SpaceMapper.class).updateSpace(space);
		result = sqlSession.getMapper(SpaceMapper.class).deleteBeforeUpdate(space.getSpace_id());
		result = sqlSession.getMapper(SpaceMapper.class).reinsertSpaceImage(space);
		return result;
	}

	public Space viewSpace(int space_id) {
		return null;
	}
	
	
	
	

	public Integer updateTotalRate(Map<String, Object> map) throws DataAccessException   {
	      Integer result = sqlSession.getMapper(SpaceMapper.class).updateTotalRate(map);
	      return result;
	}
	
	
	public Integer updateJjim(String memId, int space_id, int jjim_check) throws DataAccessException   {
	      Integer result = sqlSession.getMapper(JjimMapper.class).updateJjim(memId, space_id, jjim_check);
	      return result;
	}
	
	public Integer createJjim(String memId, int space_id, int jjim_check) throws DataAccessException   {
	      Integer result = sqlSession.getMapper(JjimMapper.class).createJjim(memId, space_id, jjim_check);
	      return result;
	}
	
	public Integer updateJjimcnt(int space_id, int amount) throws DataAccessException	{
		return sqlSession.getMapper(SpaceMapper.class).updateJjimcnt(space_id, amount);
	}
	
	
	
	public String getMemIdBySpaceId(int space_id) throws DataAccessException	{
		return sqlSession.getMapper(SpaceMapper.class).getMemIdBySpaceId(space_id);
	}
	
	
	public Integer countSpaceBymemId(String memId) throws DataAccessException	{
		return sqlSession.getMapper(SpaceMapper.class).countSpaceBymemId(memId);
	}
	



}
