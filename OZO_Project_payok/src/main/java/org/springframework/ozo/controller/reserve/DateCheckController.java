package org.springframework.ozo.controller.reserve;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ozo.service.ReserveServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/space/reserve/getAvailabilityDate")
public class DateCheckController {
	
	@Autowired
	private ReserveServiceImpl reserveservice;
	public void setReserveservice(ReserveServiceImpl reserveservice) {
		this.reserveservice = reserveservice;
	}
	
	@RequestMapping(method = RequestMethod.POST)
	@ResponseBody
	public List<Date> getAvailabilityDate(@RequestBody Map<String,String> map) throws Exception {
		
		List<Date> result = new ArrayList<Date>();

		try {
			result = reserveservice.getAvailabilityDate( Integer.parseInt(map.get("space_id").toString()), map.get("select_date") );
		} catch (Exception e) {

			e.printStackTrace();
			Date currentDate = new Date();
			result.add(currentDate);

		}

		

		return result;

	}

}
