package org.springframework.ozo.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ozo.dao.ReserveDao;
import org.springframework.ozo.domain.Reserve;
import org.springframework.stereotype.Service;

@Service("ReserveService")
public class ReserveServiceImpl implements ReserveService {
	
	@Autowired
	ReserveDao reservedao;
	
	@Override
	public Integer exsitReserve(int space_id) {
		return reservedao.exsitReserve(space_id);
	}
	

	@Override
	public List<Date> getAvailabilityDate(@Param("space_id") int space_id, @Param("select_date")String select_date) {
		return reservedao.getAvailabilityDate(space_id, select_date);
	}

	@Override
	public Integer insertReserve(Reserve reserve) {
		return reservedao.insertReserve(reserve);
		
	}
	
	@Override
	public Integer updateReserve(@Param("reserve_id")int reserve_id, @Param("state") int state) {
		return reservedao.updateReserve(reserve_id, state);
	}

	@Override
	public Reserve getReserveById(int reserve_id) {
		return reservedao.getReserveById(reserve_id);
	}

	@Override
	public List<Reserve> getMyReserveForCus(String mem_id) {
		return reservedao.getMyReserveForCus(mem_id);
		
	}


	@Override
	public List<Reserve> getMyReserveForPro(String mem_id) {
		return reservedao.getMyReserveForPro(mem_id);
	}

	public Integer getSpaceIdByReserveId(int reserve_id)	{
		return reservedao.getSpaceIdByReserveId(reserve_id);
	}


	


	

}
