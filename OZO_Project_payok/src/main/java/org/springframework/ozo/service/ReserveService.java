package org.springframework.ozo.service;

import java.util.Date;
import java.util.List;

import org.springframework.ozo.domain.Reserve;

public interface ReserveService {
	
	Integer exsitReserve(int reserve_id);
	
	Integer insertReserve(Reserve reserve);
	
	Integer updateReserve(int reserve_id, int state);
	
	List<Date> getAvailabilityDate(int space_id, String select_date);
	
	Reserve getReserveById(int reserve_id);
	
	List<Reserve> getMyReserveForCus(String mem_id);
	
	List<Reserve> getMyReserveForPro(String mem_id);
	
	Integer getSpaceIdByReserveId(int reserve_id);

}
