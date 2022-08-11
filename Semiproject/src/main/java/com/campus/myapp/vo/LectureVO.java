package com.campus.myapp.vo;
import java.util.List;
import java.util.Map;

public class LectureVO {
	private int id;
	private List<Map<String, Object>> students;
	private Map<String, Object> subject;
	@Override
	public String toString() {
		return "LectureVO [id=" + id + ", students=" + students + ", subject=" + subject + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public List<Map<String, Object>> getStudents() {
		return students;
	}
	public void setStudents(List<Map<String, Object>> students) {
		this.students = students;
	}
	public Map<String, Object> getSubject() {
		return subject;
	}
	public void setSubject(Map<String, Object> subject) {
		this.subject = subject;
	} 
	
}
