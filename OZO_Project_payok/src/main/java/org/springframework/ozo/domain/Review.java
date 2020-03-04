package org.springframework.ozo.domain;

import java.io.Serializable;
import java.util.Date;


import org.springframework.beans.support.PagedListHolder;

@SuppressWarnings("serial")
public class Review implements Serializable {



	private Reserve reserve;
	private String content;
	private int rate;
	private Date writeDate;
	private String reply;
	
	

	

	public Reserve getReserve() {
		return reserve;
	}

	public void setReserve(Reserve reserve) {
		this.reserve = reserve;
	}

	
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getRate() {
		return rate;
	}

	public void setRate(int rate) {
		this.rate = rate;
	}

	

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	

	
	

}
