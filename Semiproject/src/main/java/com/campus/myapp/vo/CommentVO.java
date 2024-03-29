package com.campus.myapp.vo;

import java.util.List;

public class CommentVO {
	private int comment_id;
	private int post_id;
	private String google_id;
	private String comment_content;
	private String comment_registration_date;
	
	//원글 제목
	private String post_title;
	
	//여러개의 레코드 번호를 저장할 콜렉션 
	private List<Integer> noList;
	
	
	
	
	public List<Integer> getNoList() {
		return noList;
	}
	public void setNoList(List<Integer> noList) {
		this.noList = noList;
	}
	public String getPost_title() {
		return post_title;
	}
	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}
	@Override
	public String toString() {
		return "CommentVO [comment_id=" + comment_id + ", post_id=" + post_id + ", google_id=" + google_id
				+ ", comment_content=" + comment_content + ", comment_registration_date=" + comment_registration_date
				+ "]";
	}
	public int getComment_id() {
		return comment_id;
	}
	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}
	public int getPost_id() {
		return post_id;
	}
	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}
	public String getGoogle_id() {
		return google_id;
	}
	public void setGoogle_id(String google_id) {
		this.google_id = google_id;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public String getComment_registration_date() {
		return comment_registration_date;
	}
	public void setComment_registration_date(String comment_registration_date) {
		this.comment_registration_date = comment_registration_date;
	}
	

	
}
