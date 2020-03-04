package org.springframework.ozo.controller;

import javax.validation.constraints.NotNull;

public class LoginCommand {
	
	@NotNull
	private String memId;
	@NotNull
	private String password;

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
