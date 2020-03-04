package org.springframework.ozo.domain;

import java.io.Serializable;
import java.util.Date;


@SuppressWarnings("serial")
public class Reserve implements Serializable {


	private int reserve_id;
	private Space space;
	private Member Member;
	private int peoplenum;
	private int state;
	private Date startDate;
	private Date endDate;
	private Date create_date;
	private int total_cost;
	private String payment_id;
	private String payment;
	private Review review;
	
	
	public Reserve() {}
	
	public Reserve(Space space, Member member, int peoplenum, int state, Date startDate, Date endDate, int total_cost) {		
		this.space = space;
		Member = member;
		this.peoplenum = peoplenum;
		this.state = state;
		this.startDate = startDate;
		this.endDate = endDate;
		this.total_cost = total_cost;
		this.create_date = new Date();
	}


	public int getReserve_id() {
		return reserve_id;
	}

	public void setReserve_id(int reserve_id) {
		this.reserve_id = reserve_id;
	}

	public Space getSpace() {
		return space;
	}

	public void setSpace(Space space) {
		this.space = space;
	}

	public Member getMember() {
		return Member;
	}

	public void setMember(Member Member) {
		this.Member = Member;
	}
	
	public int getPeoplenum() {
		return peoplenum;
	}

	public void setPeoplenum(int peoplenum) {
		this.peoplenum = peoplenum;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}
	
	

	public Date getCreate_date() {
		return create_date;
	}

	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}



	public int getTotal_cost() {
		return total_cost;
	}

	public void setTotal_cost(int total_cost) {
		this.total_cost = total_cost;
	}
	
	public String getPayment_id() {
		return payment_id;
	}

	public void setPayment_id(String payment_id) {
		this.payment_id = payment_id;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public Review getReview() {
		return review;
	}



	public void setReview(Review review) {
		this.review = review;
	}
	
	
	
	

}