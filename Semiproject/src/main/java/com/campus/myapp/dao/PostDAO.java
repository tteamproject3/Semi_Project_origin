package com.campus.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;


import com.campus.myapp.vo.PagingVO;
import com.campus.myapp.vo.PostVO;

@Mapper
@Repository
public interface PostDAO {
	
	public List<PostVO> boardList(PagingVO pVO);
	public int totalRecord(PagingVO pVO);
	public int postWriteOk(PostVO vo);
	public void hitCount(int post_id);
	public PostVO getBoard(int post_id);
	public int boardDel(int post_id, String google_id);
	public int boardEditOk(PostVO vo);
	public int boardMultiDel(PostVO vo);
	
	public List<PostVO> getThemeList(PagingVO pVO);
	public int totalThemeRecord(PagingVO pVO);
}
