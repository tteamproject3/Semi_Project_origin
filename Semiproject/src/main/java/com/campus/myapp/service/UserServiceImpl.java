package com.campus.myapp.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.campus.myapp.dao.UserDAO;
import com.campus.myapp.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {
	@Inject
	UserDAO dao;

	@Override
	public int loginOk(String g_id, String g_name) {
		return dao.loginOk(g_id, g_name);
	}

	@Override
	public int nicknameChk(String nickname) {
		return dao.nicknameChk(nickname);
	}

	@Override
	public int userWrite(UserVO u_vo) {
		return dao.userWrite(u_vo);
	}

	@Override
	public UserVO getUser(String g_id) {
		return dao.getUser(g_id);
	}
}
