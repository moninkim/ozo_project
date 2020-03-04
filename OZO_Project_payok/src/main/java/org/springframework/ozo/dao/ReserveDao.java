package org.springframework.ozo.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.ozo.domain.Reserve;
import org.springframework.ozo.mybatis.mapper.ReserveMapper;
import org.springframework.stereotype.Repository;

@Repository
public class ReserveDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public Integer exsitReserve(int reserve_id) throws DataAccessException {
		return sqlSession.getMapper(ReserveMapper.class).exsitReserve(reserve_id);
	}
	
	public List<Date> getAvailabilityDate(@Param("space_id") int space_id, @Param("select_date") String select_date) throws DataAccessException{
		
		Map<String, Object> map = new HashMap<String, Object>(); 
        map.put("space_id", space_id);
        map.put("select_date", select_date);
        
		return sqlSession.getMapper(ReserveMapper.class).getAvailabilityDate(map);
	}
	
	
	public Integer insertReserve(Reserve reserve) throws DataAccessException {
		
		return sqlSession.getMapper(ReserveMapper.class).insertReserve(reserve);
	}
	
	
	public Integer updateReserve(@Param("reserve_id")int reserve_id, @Param("state")int state)throws DataAccessException {
		
		Map<String, Object> map = new HashMap<String, Object>(); 
        map.put("reserve_id", reserve_id);
        map.put("state", state);
		return sqlSession.getMapper(ReserveMapper.class).updateReserve(map);
	}
	
	
	public Reserve getReserveById(int reserve_id) throws DataAccessException {
		return sqlSession.getMapper(ReserveMapper.class).getReserveById(reserve_id);
	}
	
	public List<Reserve> getMyReserveForCus(String mem_id) throws DataAccessException {
		return sqlSession.getMapper(ReserveMapper.class).getMyReserveForCus(mem_id);
	}
	
	public List<Reserve> getMyReserveForPro(String mem_id) {
		return sqlSession.getMapper(ReserveMapper.class).getMyReserveForPro(mem_id);
	}

	public Integer getSpaceIdByReserveId(int reserve_id)	{
		return sqlSession.getMapper(ReserveMapper.class).getSpaceIdByReserveId(reserve_id);
}

}
