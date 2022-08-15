package com.campus.myapp.vo;

public class UserVO {
	private String google_id;
	private String google_username;
	private int user_role;
	private String user_nickname;
	private String user_register_date;
	private String email;
	
	private String user_phonenum;
	private String tel1;
	private String tel2;
	private String tel3;
	private String user_gender;
	private String user_birth;
	
	private int agree_to_receive_email;
	private int agree_to_receive_msg;
	
	
	
	@Override
	public String toString() {
		return "UserVO [google_id=" + google_id + ", google_username=" + google_username + ", user_role=" + user_role
				+ ", user_nickname=" + user_nickname + ", user_register_date=" + user_register_date + ", user_phonenum="
				+ user_phonenum + ", tel1=" + tel1 + ", tel2=" + tel2 + ", tel3=" + tel3 + ", user_gender="
				+ user_gender + ", user_birth=" + user_birth + ", agree_to_receive_email=" + agree_to_receive_email
				+ ", agree_to_receive_msg=" + agree_to_receive_msg + "]";
	}
	
	
	public String getGoogle_id() {
		return google_id;
	}
	public void setGoogle_id(String google_id) {
		this.google_id = google_id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGoogle_username() {
		return google_username;
	}
	public void setGoogle_username(String google_username) {
		this.google_username = google_username;
	}
	public int getUser_role() {
		return user_role;
	}
	public void setUser_role(int user_role) {
		this.user_role = user_role;
	}
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	public String getUser_register_date() {
		return user_register_date;
	}
	public void setUser_register_date(String user_register_date) {
		this.user_register_date = user_register_date;
	}
	public String getUser_phonenum() {
		return tel1+"-"+tel2+"-"+tel3;
	}
	public void setUser_phonenum(String user_phonenum) {
		this.user_phonenum = user_phonenum;
		String telSplit[] = user_phonenum.split("-");
		tel1 = telSplit[0];
		tel2 = telSplit[1];
		tel3 = telSplit[2];
	}
	public String getTel1() {
		return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	public String getTel3() {
		return tel3;
	}
	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}
	public String getUser_gender() {
		return user_gender;
	}
	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}
	public String getUser_birth() {
		return user_birth;
	}
	public void setUser_birth(String user_birth) {
		this.user_birth = user_birth;
	}
	public int getAgree_to_receive_email() {
		return agree_to_receive_email;
	}
	public void setAgree_to_receive_email(int agree_to_receive_email) {
		this.agree_to_receive_email = agree_to_receive_email;
	}
	public int getAgree_to_receive_msg() {
		return agree_to_receive_msg;
	}
	public void setAgree_to_receive_msg(int agree_to_receive_msg) {
		this.agree_to_receive_msg = agree_to_receive_msg;
	}

	
}
