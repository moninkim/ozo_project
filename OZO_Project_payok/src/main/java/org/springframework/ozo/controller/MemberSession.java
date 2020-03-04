package org.springframework.ozo.controller;

import java.io.Serializable;

import org.springframework.ozo.domain.Member;

@SuppressWarnings("serial")

public class MemberSession implements Serializable{
	
	private Member member;
	
	public MemberSession(Member member) {
		this.member = member;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
		
	}



}
