package com.campus.myapp.vo;

import java.util.List;

public class PostVO {
	private int post_id;
	private String google_id;
	private String post_type;
	private String post_title;
	private String post_intro;
	private String post_content;
	private int post_hit;
	private String post_registration_date;
	private String post_file1;
	private String post_file2;
	private String post_file3;
	
	//여러개의 레코드 번호를 저장할 콜렉션 
	private List<Integer> noList;
	
	private int comment_count;
	
	@Override
	public String toString() {
		return "PostVO [post_id=" + post_id + ", google_id=" + google_id + ", post_type=" + post_type + ", post_title="
				+ post_title + ", post_intro=" + post_intro + ", post_content=" + post_content + ", post_hit="
				+ post_hit + ", post_registration_date=" + post_registration_date + ", post_file1=" + post_file1
				+ ", post_file2=" + post_file2 + ", post_file3=" + post_file3 + "]";
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
	public String getPost_type() {
		return post_type;
	}
	public void setPost_type(String post_type) {
		this.post_type = post_type;
	}
	public String getPost_title() {
		return post_title;
	}
	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}
	public String getPost_intro() {
		return post_intro;
	}
	public void setPost_intro(String post_intro) {
		this.post_intro = post_intro;
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
	public List<Integer> getNoList() {
		return noList;
	}
	public void setNoList(List<Integer> noList) {
		this.noList = noList;
	}
	public int getComment_count() {
		return comment_count;
	}
	public void setComment_count(int comment_count) {
		this.comment_count = comment_count;
	}
	
}