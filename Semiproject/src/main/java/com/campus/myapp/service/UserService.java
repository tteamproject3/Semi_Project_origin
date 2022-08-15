package com.campus.myapp.service;

import com.campus.myapp.vo.UserVO;

public interface UserService {
	public int loginOk(String g_id, String g_name);
	
	public int nicknameChk(String nickname);
	
	public int userWrite(UserVO u_vo);
	
	public UserVO getUser(String g_id);
}
