package org.springframework.ozo.domain;

import java.io.Serializable;
import java.util.List;

@SuppressWarnings("serial")
public class Member implements Serializable {


	private String memId;
	private String memberType;
	private String name;
	private String password;
	private String email;
	private String phone;
	private String profile;
	private double grade;
	
	private List<Credit> credit_history;
	
	
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemberType() {
		return memberType;
	}
	public void setMemberType(String memberType) {
		this.memberType = memberType;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public double getGrade() {
		return grade;
	}
	public void setGrade(double grade) {
		this.grade = grade;
	}
	
	
	

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public List<Credit> getCredit_history() {
		return credit_history;
	}

	public void setCredit_history(List<Credit> credit_history) {
		this.credit_history = credit_history;
	}
	
	public int getTotalCredit() {
		int total_credit = 0;
		
		
		if (credit_history != null) {
			for(Credit i : credit_history) 
				total_credit += i.getAmount();
		}
		
		return total_credit;
	}

	
	
	
	
	

}
