package com.campus.myapp.vo;


public class FestivalVO {
//	private String fstvlNm;
//	private String opar;
//	private String fstvlStartDate;
//	private String fstvlEndDate;
//	private String fstvlCo;
//	private String phoneNumber;
//	private String homepageUrl;
//	private String rdnmadr;
//	private String lnmadr;
//	private String latitude;
//	private String longitude;
	private String festival_id;
	private String festival_place;
	private String festival_start_date;
	private String festival_end_date;
	private String festival_content;
	private String festival_phonenum;
	private String festival_site;
	private String festival_road_name_addr;
	private String festival_lotnum_addr;
	private String festival_lat;
	private String festival_long;
	@Override
	public String toString() {
		return "FestivalVO [festival_id=" + festival_id + ", festival_place=" + festival_place
				+ ", festival_start_date=" + festival_start_date + ", festival_end_date=" + festival_end_date
				+ ", festival_content=" + festival_content + ", festival_phonenum=" + festival_phonenum
				+ ", festival_site=" + festival_site + ", festival_road_name_addr=" + festival_road_name_addr
				+ ", festival_lotnum_addr=" + festival_lotnum_addr + ", festival_lat=" + festival_lat
				+ ", festival_long=" + festival_long + "]";
	}
	public String getFestival_id() {
		return festival_id;
	}
	public void setFestival_id(String festival_id) {
		this.festival_id = festival_id;
	}
	public String getFestival_place() {
		return festival_place;
	}
	public void setFestival_place(String festival_place) {
		this.festival_place = festival_place;
	}
	public String getFestival_start_date() {
		return festival_start_date;
	}
	public void setFestival_start_date(String festival_start_date) {
		this.festival_start_date = festival_start_date;
	}
	public String getFestival_end_date() {
		return festival_end_date;
	}
	public void setFestival_end_date(String festival_end_date) {
		this.festival_end_date = festival_end_date;
	}
	public String getFestival_content() {
		return festival_content;
	}
	public void setFestival_content(String festival_content) {
		this.festival_content = festival_content;
	}
	public String getFestival_phonenum() {
		return festival_phonenum;
	}
	public void setFestival_phonenum(String festival_phonenum) {
		this.festival_phonenum = festival_phonenum;
	}
	public String getFestival_site() {
		return festival_site;
	}
	public void setFestival_site(String festival_site) {
		this.festival_site = festival_site;
	}
	public String getFestival_road_name_addr() {
		return festival_road_name_addr;
	}
	public void setFestival_road_name_addr(String festival_road_name_addr) {
		this.festival_road_name_addr = festival_road_name_addr;
	}
	public String getFestival_lotnum_addr() {
		return festival_lotnum_addr;
	}
	public void setFestival_lotnum_addr(String festival_lotnum_addr) {
		this.festival_lotnum_addr = festival_lotnum_addr;
	}
	public String getFestival_lat() {
		return festival_lat;
	}
	public void setFestival_lat(String festival_lat) {
		this.festival_lat = festival_lat;
	}
	public String getFestival_long() {
		return festival_long;
	}
	public void setFestival_long(String festival_long) {
		this.festival_long = festival_long;
	}
	
	
}
