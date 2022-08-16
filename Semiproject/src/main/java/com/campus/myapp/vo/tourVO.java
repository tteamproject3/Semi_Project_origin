package com.campus.myapp.vo;

public class tourVO {
	private int tour_num;
	private String tour_id;
	private String tour_content;
	private String tour_parkinglot_num;
	private String tour_phonenum;
	private String tour_road_name_addr;
	private String tour_lotnum_addr;
	private String tour_lat;
	private String tour_long;
	private String tour_img;

	
	
	@Override
	public String toString() {
		return "tourVO [tour_num=" + tour_num + ", tour_id=" + tour_id + ", tour_content=" + tour_content
				+ ", tour_parkinglot_num=" + tour_parkinglot_num + ", tour_phonenum=" + tour_phonenum
				+ ", tour_road_name_addr=" + tour_road_name_addr + ", tour_lotnum_addr=" + tour_lotnum_addr
				+ ", tour_lat=" + tour_lat + ", tour_long=" + tour_long + ", tour_img=" + tour_img + "]";
	}
	public String getTour_img() {
		return tour_img;
	}
	public void setTour_img(String tour_img) {
		this.tour_img = tour_img;
	}
	public int getTour_num() {
		return tour_num;
	}
	public void setTour_num(int tour_num) {
		this.tour_num = tour_num;
	}
	public String getTour_id() {
		return tour_id;
	}
	public void setTour_id(String tour_id) {
		this.tour_id = tour_id;
	}
	public String getTour_content() {
		return tour_content;
	}
	public void setTour_content(String tour_content) {
		this.tour_content = tour_content;
	}
	public String getTour_parkinglot_num() {
		return tour_parkinglot_num;
	}
	public void setTour_parkinglot_num(String tour_parkinglot_num) {
		this.tour_parkinglot_num = tour_parkinglot_num;
	}
	public String getTour_phonenum() {
		return tour_phonenum;
	}
	public void setTour_phonenum(String tour_phonenum) {
		this.tour_phonenum = tour_phonenum;
	}
	public String getTour_road_name_addr() {
		return tour_road_name_addr;
	}
	public void setTour_road_name_addr(String tour_road_name_addr) {
		this.tour_road_name_addr = tour_road_name_addr;
	}
	public String getTour_lotnum_addr() {
		return tour_lotnum_addr;
	}
	public void setTour_lotnum_addr(String tour_lotnum_addr) {
		this.tour_lotnum_addr = tour_lotnum_addr;
	}
	public String getTour_lat() {
		return tour_lat;
	}
	public void setTour_lat(String tour_lat) {
		this.tour_lat = tour_lat;
	}
	public String getTour_long() {
		return tour_long;
	}
	public void setTour_long(String tour_long) {
		this.tour_long = tour_long;
	}
	
}
