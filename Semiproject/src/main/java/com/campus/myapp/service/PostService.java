package com.campus.myapp.service;
import java.util.List;

import com.campus.myapp.vo.PagingVO;
import com.campus.myapp.vo.PostVO;

import java.util.List;


public interface PostService {

	public List<PostVO> boardList(PagingVO pVO);
	public int totalRecord(PagingVO pVO);
	public int postWriteOk(PostVO vo);
	public void hitCount(int post_id);
	public PostVO getBoard(int post_id);
	public int boardDel(int post_id, String google_id);
	public int boardEditOk(PostVO vo);
	public int boardMultiDel(PostVO vo);
}


