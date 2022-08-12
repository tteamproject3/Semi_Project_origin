package com.campus.myapp.vo;
import java.util.List;

public class BoardVO {
	// private int no;
	// private String subject;
	// private String content;
	// private String userid;
	// private String ip;
	// private int hit;
	// private String writedate;
	
	// //여러개의 레코드 번호를 저장하는 컬렉션 선언
	// private List<Integer> noList;
	
	// ///여러개의 레코드 번호를 저장할 컬렉션 선언
	// private int reply_count;
	
	private String post_id;
	private String google_id;
	private int touristSpot_tour_num;
	private int festival_festival_num;
	private String post_type;
	private String post_title;
	private String post_content;
	private int post_hit;
	private String post_registration_date;

	//여러개의 레코드 번호를 저장하는 컬렉션 선언
	private List<Integer> post_id_List;
	
	///여러개의 레코드 번호를 저장할 컬렉션 선언
	private int reply_count;
	
	@Override
	public String toString() {
		return "BoardVO [festival_festival_num=" + festival_festival_num + ", google_id=" + google_id + ", post_id_List="
				+ post_id_List + ", post_content=" + post_content + ", post_hit=" + post_hit + ", post_id=" + post_id
				+ ", post_registration_date=" + post_registration_date + ", post_title=" + post_title + ", post_type="
				+ post_type + ", reply_count=" + reply_count + ", touristSpot_tour_num=" + touristSpot_tour_num + "]";
	}

	public String getPost_id() {
		return post_id;
	}

	public void setPost_id(String post_id) {
		this.post_id = post_id;
	}

	public String getGoogle_id() {
		return google_id;
	}

	public void setGoogle_id(String google_id) {
		this.google_id = google_id;
	}

	public int getTouristSpot_tour_num() {
		return touristSpot_tour_num;
	}

	public void setTouristSpot_tour_num(int touristSpot_tour_num) {
		this.touristSpot_tour_num = touristSpot_tour_num;
	}

	public int getFestival_festival_num() {
		return festival_festival_num;
	}

	public void setFestival_festival_num(int festival_festival_num) {
		this.festival_festival_num = festival_festival_num;
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

	public List<Integer> getpost_id_List() {
		return post_id_List;
	}

	public void setpost_id_List(List<Integer> post_id_List) {
		this.post_id_List = post_id_List;
	}

	public int getReply_count() {
		return reply_count;
	}

	public void setReply_count(int reply_count) {
		this.reply_count = reply_count;
	}

	
}
