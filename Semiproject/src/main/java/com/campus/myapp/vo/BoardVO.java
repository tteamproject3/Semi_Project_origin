package com.campus.myapp.vo;

public class BoardVO {

    private int no;
	private String subject;
	private String content;
	private String userid;
	private String ip;
	private int hit;
	private String writedate;

    
    @Override
    public String toString() {
        return "BoardVO [content=" + content + ", hit=" + hit + ", ip=" + ip + ", no=" + no + ", subject=" + subject
                + ", userid=" + userid + ", writedate=" + writedate + "]";
    }
    public int getNo() {
        return no;
    }
    public void setNo(int no) {
        this.no = no;
    }
    public String getSubject() {
        return subject;
    }
    public void setSubject(String subject) {
        this.subject = subject;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public String getUserid() {
        return userid;
    }
    public void setUserid(String userid) {
        this.userid = userid;
    }
    public String getIp() {
        return ip;
    }
    public void setIp(String ip) {
        this.ip = ip;
    }
    public int getHit() {
        return hit;
    }
    public void setHit(int hit) {
        this.hit = hit;
    }
    public String getWritedate() {
        return writedate;
    }
    public void setWritedate(String writedate) {
        this.writedate = writedate;
    }

    

}
