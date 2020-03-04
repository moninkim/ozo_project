package org.springframework.ozo.domain;

import java.io.Serializable;
import java.util.Date;


@SuppressWarnings("serial")
public class Credit implements Serializable{
	
	
	private Member member;
	private int credit_id;
	private String purpose;
	private int amount;
	private Date credit_date;
	
	public Credit() {}
	
	public Credit(Member member, String purpose, int amount) {
		this.member = member;
		this.purpose = purpose;
		this.amount = amount;
	}
	
	
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	public int getCredit_id() {
		return credit_id;
	}
	public void setCredit_id(int credit_id) {
		this.credit_id = credit_id;
	}
	public String getPurpose() {
		return purpose;
	}
	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public Date getCredit_date() {
		return credit_date;
	}
	public void setCredit_date(Date credit_date) {
		this.credit_date = credit_date;
	}
	
	
	

}
