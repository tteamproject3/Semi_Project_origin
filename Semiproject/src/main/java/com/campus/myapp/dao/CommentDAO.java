package com.campus.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.campus.myapp.vo.CommentVO;

@Mapper
@Repository
public interface CommentDAO {
	public int commentInsert(CommentVO vo);
	public List<CommentVO> commentList(int post_id);
	public int commentUpdate(CommentVO vo);
	public int commentDelete(int comment_id, String google_id);

}
