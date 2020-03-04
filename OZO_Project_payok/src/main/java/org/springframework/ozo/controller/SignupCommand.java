package org.springframework.ozo.controller;

import java.io.Serializable;

import org.springframework.ozo.domain.Member;

@SuppressWarnings("serial")
public class SignupCommand implements Serializable {
	
	private Member member;
	
	private boolean newMember;
	
	private String repeatedPassword;
	
	public SignupCommand(Member member) {
		this.member = member;
		this.newMember = false;
	}
	
	public SignupCommand() {
		this.member = new Member();
		this.newMember = true;
	}
	
	public Member getMember() {
		return member;
	}
	
	public boolean isNewMember() {
		return newMember;
	}

	public void setRepeatedPassword(String repeatedPassword) {
		this.repeatedPassword = repeatedPassword;
	}

	public String getRepeatedPassword() {
		return repeatedPassword;
	}
	
	
	
}
