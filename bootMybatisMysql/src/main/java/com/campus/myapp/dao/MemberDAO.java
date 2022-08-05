package com.campus.myapp.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.vo.MemberVO;
import com.campus.myapp.vo.ZipcodeVO;

@Mapper
@Repository
public interface MemberDAO {
	//아이디 중복검사
	public int idCheck(String userid);
	//우편번호 찾기
	public List<ZipcodeVO> zipSearch(String doro);
	//회원가입
	public int memberWrite(MemberVO vo);
	//로그인
	public MemberVO loginOk(MemberVO vo);
	//회원선택: 로그인한 회원
	public MemberVO getMember(String userid);
	//회원수정: db업데이트
	public int memberEditOk(MemberVO vo);
	

}
