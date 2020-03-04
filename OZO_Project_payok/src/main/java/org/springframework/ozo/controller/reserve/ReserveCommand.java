package org.springframework.ozo.controller.reserve;

import javax.validation.constraints.NotNull;

@SuppressWarnings("serial")
public class ReserveCommand {
	
	@NotNull
	private int peoplenum;

	public int getPeoplenum() {
		return peoplenum;
	}

	public void setPeoplenum(int peoplenum) {
		this.peoplenum = peoplenum;
	}
	
	
	
	
	
	

}
