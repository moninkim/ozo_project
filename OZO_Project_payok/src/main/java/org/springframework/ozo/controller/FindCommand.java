package org.springframework.ozo.controller;

import javax.validation.constraints.NotNull;

public class FindCommand {

	@NotNull
	private String memName;
	@NotNull
	private String memEmail;
	@NotNull
	private String memPhone;
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public String getMemPhone() {
		return memPhone;
	}
	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}
	
	
}
