package com.campus.myapp.vo;

public class BoardVO {
	private int postid;
	private String google_id;
	private String post_type;
	private String festival_id;
	private String tour_id;
	private String post_title;
	private String post_content;
	private int post_hit;
	private int post_review_rating;
	private String post_registration_date;
	private String post_file1;
	private String post_file2;
	private String post_file3;
	@Override
	public String toString() {
		return "BoardVO [postid=" + postid + ", google_id=" + google_id + ", post_type=" + post_type + ", festival_id="
				+ festival_id + ", tour_id=" + tour_id + ", post_title=" + post_title + ", post_content=" + post_content
				+ ", post_hit=" + post_hit + ", post_review_rating=" + post_review_rating + ", post_registration_date="
				+ post_registration_date + ", post_file1=" + post_file1 + ", post_file2=" + post_file2 + ", post_file3="
				+ post_file3 + "]";
	}
	public int getPostid() {
		return postid;
	}
	public void setPostid(int postid) {
		this.postid = postid;
	}
	public String getGoogle_id() {
		return google_id;
	}
	public void setGoogle_id(String google_id) {
		this.google_id = google_id;
	}
	public String getPost_type() {
		return post_type;
	}
	public void setPost_type(String post_type) {
		this.post_type = post_type;
	}
	public String getFestival_id() {
		return festival_id;
	}
	public void setFestival_id(String festival_id) {
		this.festival_id = festival_id;
	}
	public String getTour_id() {
		return tour_id;
	}
	public void setTour_id(String tour_id) {
		this.tour_id = tour_id;
	}
	public String getPost_title() {
		return post_title;
	}
	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}
	public String getPost_content() {
		return post_content;
	}
	public void setPost_content(String post_content) {
		this.post_content = post_content;
	}
	public int getPost_hit() {
		return post_hit;
	}
	public void setPost_hit(int post_hit) {
		this.post_hit = post_hit;
	}
	public int getPost_review_rating() {
		return post_review_rating;
	}
	public void setPost_review_rating(int post_review_rating) {
		this.post_review_rating = post_review_rating;
	}
	public String getPost_registration_date() {
		return post_registration_date;
	}
	public void setPost_registration_date(String post_registration_date) {
		this.post_registration_date = post_registration_date;
	}
	public String getPost_file1() {
		return post_file1;
	}
	public void setPost_file1(String post_file1) {
		this.post_file1 = post_file1;
	}
	public String getPost_file2() {
		return post_file2;
	}
	public void setPost_file2(String post_file2) {
		this.post_file2 = post_file2;
	}
	public String getPost_file3() {
		return post_file3;
	}
	public void setPost_file3(String post_file3) {
		this.post_file3 = post_file3;
	}
	
}
