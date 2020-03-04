package org.springframework.ozo.service;

@SuppressWarnings("serial")
public class LoginException extends Exception {

	public LoginException() {
		super();
	}

	public LoginException(String errormsg) {
		super(errormsg);
	}
	
}
