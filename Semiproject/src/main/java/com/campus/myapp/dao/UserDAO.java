package com.campus.myapp.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.campus.myapp.vo.UserVO;

@Mapper
@Repository
public interface UserDAO {
	//로그인 전 db 체크 
	public int loginOk(String g_id, String g_name);
	
	//닉네임 중복 검사
	public int nicknameChk(String nickname);
	
	//회원정보 db 입력
	public int userWrite(UserVO u_vo);
	
	//아이디로 회원정보찾기
	public UserVO getUser(String g_id);
}
