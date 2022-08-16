package com.campus.myapp.service;

import java.util.List;

import com.campus.myapp.vo.MySavedVO;
import com.campus.myapp.vo.PagingVO;
import com.campus.myapp.vo.PostVO;

public interface MySavedService {
	public int postWriteOk(PostVO vo);
	public int postAddOk(MySavedVO vo);
	public int totalRecord(PagingVO pVO);
	public List<MySavedVO> boardList(PagingVO pVO);
}
