package com.campus.myapp.vo;

public class PagingVO {
    private int nowPage = 1; 
	private int onePageRecord=10; 
	private int totalRecord; 
	private int totalPage; // 페이지 레코드 서낵할 위치
	
	//페이지 번호
	private int startPage = 1;
	private int onePageCount = 5;
	
	//검색
	private String searchKey;
	private String searchWord;


    @Override
    public String toString() {
        return "PagingVO [nowPage=" + nowPage + ", onePageCount=" + onePageCount + ", onePageRecord=" + onePageRecord
                + ", searchKey=" + searchKey + ", searchWord=" + searchWord + ", startPage=" + startPage
                + ", totalPage=" + totalPage + ", totalRecord=" + totalRecord + "]";
    }

    
    public int getNowPage() {
        return nowPage;
    }
    public void setNowPage(int nowPage) {
        this.nowPage = nowPage;
    }
    public int getOnePageRecord() {
        return onePageRecord;
    }
    public void setOnePageRecord(int onePageRecord) {
        this.onePageRecord = onePageRecord;
    }
    public int getTotalRecord() {
        return totalRecord;
    }
    public void setTotalRecord(int totalRecord) {
        this.totalRecord = totalRecord;
    }
    public int getTotalPage() {
        return totalPage;
    }
    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }
    public int getStartPage() {
        return startPage;
    }
    public void setStartPage(int startPage) {
        this.startPage = startPage;
    }
    public int getOnePageCount() {
        return onePageCount;
    }
    public void setOnePageCount(int onePageCount) {
        this.onePageCount = onePageCount;
    }
    public String getSearchKey() {
        return searchKey;
    }
    public void setSearchKey(String searchKey) {
        this.searchKey = searchKey;
    }
    public String getSearchWord() {
        return searchWord;
    }
    public void setSearchWord(String searchWord) {
        this.searchWord = searchWord;
    }

    


}