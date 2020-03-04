package org.springframework.ozo.domain;

import java.io.Serializable;
import java.util.List;

@SuppressWarnings("serial")
public class Space implements Serializable {
  
	private int space_id;
	private Member Member;
	private String type;
	private String area;
	private String title;
	private String introduce;
	private String facility;
	private String guide;
	private String content;
	private int max_people;
	private int cost;
	private double total_rate;
	private int jjim_cnt;
	
	private List<String> image_list;
	
	
	private List<Reserve> reserve_list;
	private List<Review> review_list;
	
	
	

	public int getSpace_id() {
		return space_id;
	}
	public void setSpace_id(int space_id) {
		this.space_id = space_id;
	}
	public Member getMember() {
		return Member;
	}
	public void setMember(Member Member) {
		this.Member = Member;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	
	
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	
		
	public double getTotal_rate() {
		return total_rate;
	}



	public void setTotal_rate(double total_rate) {
		this.total_rate = (Math.round(total_rate*10)/10.0);
	}



	public String getIntroduce() {
		return introduce;
	}
	
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getFacility() {
		return facility;
	}
	
	public void setFacility(String facility) {
		this.facility = facility;
	}
	
	public String getGuide() {
		return guide;
	}
	
	public void setGuide(String guide) {
		this.guide = guide;
	}
	public int getMax_people() {
		return max_people;
	}
	public void setMax_people(int max_people) {
		this.max_people = max_people;
	}
	public List<String> getImage_list() {
		return image_list;
	}
	public void setImage_list(List<String> image_list) {
		this.image_list = image_list;
	}
	public List<Reserve> getReserve_list() {
		return reserve_list;
	}
	public void setReserve_list(List<Reserve> reserve_list) {
		this.reserve_list = reserve_list;
	}
	public List<Review> getReview_list() {
		return review_list;
	}
	public void setReview_list(List<Review> review_list) {
		this.review_list = review_list;
	}

	public int getJjim_cnt() {
		return jjim_cnt;
	}
	public void setJjim_cnt(int jjim_cnt) {
		this.jjim_cnt = jjim_cnt;
	}
	
	
	
	
	
  
}