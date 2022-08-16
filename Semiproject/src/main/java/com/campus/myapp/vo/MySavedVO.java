package com.campus.myapp.vo;

public class MySavedVO {
	private int saved_num;
	private String saved_title;
	private String saved_url;
	private String saved_content;
	private String google_id;
	
	
	
	
	
	@Override
	public String toString() {
		return "MySavedVO [saved_num=" + saved_num + ", saved_title=" + saved_title + ", saved_url=" + saved_url
				+ ", saved_content=" + saved_content + ", google_id=" + google_id + "]";
	}
	public int getSaved_num() {
		return saved_num;
	}
	public void setSaved_num(int saved_num) {
		this.saved_num = saved_num;
	}
	public String getSaved_title() {
		return saved_title;
	}
	public void setSaved_title(String saved_title) {
		this.saved_title = saved_title;
	}
	public String getSaved_url() {
		return saved_url;
	}
	public void setSaved_url(String saved_url) {
		this.saved_url = saved_url;
	}
	public String getSaved_content() {
		return saved_content;
	}
	public void setSaved_content(String saved_content) {
		this.saved_content = saved_content;
	}
	public String getGoogle_id() {
		return google_id;
	}
	public void setGoogle_id(String google_id) {
		this.google_id = google_id;
	}
	
	
	
}
