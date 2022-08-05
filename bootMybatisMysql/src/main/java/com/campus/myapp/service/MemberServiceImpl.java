package com.campus.myapp.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.dao.MemberDAO;
import com.campus.myapp.vo.MemberVO;
import com.campus.myapp.vo.ZipcodeVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Inject
	MemberDAO dao;

	@Override
	public int idCheck(String userid) {
		// TODO Auto-generated method stub
		return dao.idCheck(userid);
	}

	@Override
	public List<ZipcodeVO> zipSearch(String doro) {
		// TODO Auto-generated method stub
		return dao.zipSearch(doro);
	}

	@Override
	public int memberWrite(MemberVO vo) {
		// TODO Auto-generated method stub
		return dao.memberWrite(vo);
	}
//

//
	@Override
	public MemberVO getMember(String userid) {
		// TODO Auto-generated method stub
		return dao.getMember(userid);
	}

	@Override
	public MemberVO loginOk(MemberVO vo) {
		// TODO Auto-generated method stub
		return dao.loginOk(vo);
	}

	@Override
	public int memberEditOk(MemberVO vo) {
		// TODO Auto-generated method stub
		return dao.memberEditOk(vo);
	}



}
