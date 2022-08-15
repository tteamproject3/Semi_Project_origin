package com.campus.myapp.controller;

import java.io.IOException;
import java.nio.charset.Charset;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import com.campus.myapp.config.Constant;
import com.campus.myapp.config.GoogleUser;
import com.campus.myapp.service.OAuthService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.service.UserService;
import com.campus.myapp.vo.UserVO;

@RestController
@RequestMapping("")
public class UserController {
	@Autowired
	OAuthService oAuthService;
	private final Logger logger = LoggerFactory.getLogger(getClass());
	Constant constant;


	@Inject
	UserService service;
	
	ModelAndView mav = null;
	
	@GetMapping("/user/login")
	public ModelAndView login() {
		mav = new ModelAndView();
		mav.setViewName("/user/login");
		return mav;
	}
	@GetMapping("/auth/{socialLoginType}")
	public ModelAndView socialLoginRedirect(@PathVariable(name="socialLoginType") String SocialLoginPath) throws IOException {
		Constant.SocialLoginType socialLoginType= Constant.SocialLoginType.valueOf(SocialLoginPath.toUpperCase());
		ModelAndView mav =  new ModelAndView();
		mav.setViewName( oAuthService.request(socialLoginType));


		return mav;
	}
	/**
	 * Social Login API Server 요청에 의한 callback 을 처리
	 * @param socialLoginPath (GOOGLE, FACEBOOK, NAVER, KAKAO)
	 * @param code API Server 로부터 넘어오는 code
	 * @return SNS Login 요청 결과로 받은 Json 형태의 java 객체 (access_token, jwt_token, user_num 등)
	 */
	@ResponseBody
	@GetMapping(value = "/login/oauth2/code/{socialLoginType}")
	public ModelAndView callback (
			@PathVariable(name = "socialLoginType") String socialLoginPath, HttpSession session,
			@RequestParam(name = "code") String code)throws IOException,Exception{
		mav = new ModelAndView();
		logger.info(">> 소셜 로그인 API 서버로부터 받은 code :"+ code);
		Constant.SocialLoginType socialLoginType= Constant.SocialLoginType.valueOf(socialLoginPath.toUpperCase());
		GoogleUser getSocialOAuthRes=oAuthService.oAuthLogin(socialLoginType,code);
		logger.info(getSocialOAuthRes.toString());
		logger.info(getSocialOAuthRes.getName());

		UserVO u_vo = new UserVO();
		u_vo.setGoogle_id(getSocialOAuthRes.getId());
		u_vo.setGoogle_username(getSocialOAuthRes.getName());;
		u_vo.setEmail(getSocialOAuthRes.getEmail());
		int result = service.loginOk(getSocialOAuthRes.getId(), getSocialOAuthRes.getName());
		if (result==0) {
			System.out.println("신규회원");
			//회원아님 -> 회원가입
			mav.addObject("u_vo", u_vo);
			mav.setViewName("/user/signinAgree");

		} else if(result ==1) {
			System.out.println("기존회원");
			//회원임 -> 로그인 절차
			UserVO vo = service.getUser(getSocialOAuthRes.getId());

			session.setAttribute("logId",getSocialOAuthRes.getId());
			session.setAttribute("logNickName",vo.getUser_nickname());
			session.setAttribute("logMode",vo.getUser_role() ); //0: 유저모드, 1: 관리자모드
			session.setAttribute("logStatus", "Y");
			mav.setViewName("redirect:/");

		} else {
			//예외
			mav.setViewName("redirect:/");
		}

		return mav;
	}
	
	@GetMapping("/user/loginOk")
	public ModelAndView loginOk(String email, String g_id, String g_name, HttpSession session) {
		mav = new ModelAndView();
		UserVO u_vo = new UserVO();
		u_vo.setGoogle_id(g_id);
		u_vo.setGoogle_username(g_name);
		
		//db 확인 
		int result = service.loginOk(g_id, g_name);
		if (result==0) { 
			System.out.println("신규회원");
			//회원아님 -> 회원가입
			mav.addObject("u_vo", u_vo);
			mav.setViewName("/user/signinAgree");
			
		} else if(result ==1) {
			System.out.println("기존회원");
			//회원임 -> 로그인 절차 
			UserVO vo = service.getUser(g_id);
			
			session.setAttribute("logId",g_id);
			session.setAttribute("logNickName",vo.getUser_nickname());
			session.setAttribute("logMode",vo.getUser_role() ); //0: 유저모드, 1: 관리자모드
			session.setAttribute("logStatus", "Y");
			mav.setViewName("redirect:/");
			
		} else {
			//예외
			mav.setViewName("redirect:/");
		}
			
		return mav;
	}
	
	//회원가입 1 약관동의 
	@PostMapping("/user/agree")
	public ModelAndView nextSignin(UserVO u_vo) {
		mav = new ModelAndView();
		mav.addObject("u_vo", u_vo);
		mav.setViewName("/user/signinInfo");
		return mav;
	}
	
	//닉네임 중복검사 	
	@GetMapping("/user/nicknameChk")
	public ModelAndView nicknameChk(String user_nickname) {
		mav = new ModelAndView();
		int result = service.nicknameChk(user_nickname);
		mav.addObject("nameCnt", result);
		mav.addObject("user_nickname", user_nickname);

		mav.setViewName("/user/nicknameOk");
		return mav;
	}
	//회원가입 2 정보입력 후 완료
	@PostMapping("/user/signinOk")
	public ResponseEntity<String> signinOk(UserVO u_vo, String g_id, String g_name){
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text","html",Charset.forName("UTF-8")));
		headers.add("Content-Type", "text/html; charset=utf-8");

		try {
			
			u_vo = logMode(u_vo);
			logger.info(u_vo.toString());
			int result = service.userWrite(u_vo);
			
	         String msg = "<script>";
	         msg += "alert('회원가입이 성공하였습니다. 로그인페이지로 이동합니다.');";
	         msg += "location.href='/user/login'";
	         msg += "</script>";
	         
	         entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK); //성공:200 
		
		} catch (Exception e) {
			e.printStackTrace();
			 String msg ="<script>";
	         msg += "alert('회원가입이 실패하였습니다.');";
	         msg += "history.back();";
	         msg += "</script>";
	         entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	public UserVO logMode(UserVO u_vo) {
		if(u_vo.getGoogle_id().equals("tteamproject3@gmail.com")) {
			u_vo.setUser_role(1);
		}
		return u_vo;
	}
	
	//로그아웃
	@GetMapping("/user/logout")
	public ModelAndView logout(HttpSession session) {
		session.invalidate(); //세션의 로그인 정보를 제거 
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/");
		return mav;
	}
}











