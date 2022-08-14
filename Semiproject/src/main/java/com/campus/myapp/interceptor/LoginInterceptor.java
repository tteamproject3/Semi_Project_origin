package com.campus.myapp.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor implements HandlerInterceptor{
	
	//컨트롤러 호출되기 전에 인터셉터하는 메소드
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		//로그인 여부 확인하기
		HttpSession session = request.getSession();
		
		//session에서 로그인 정보를 구해온다
		String logStatus = (String)session.getAttribute("logStatus"); //null, Y
		
		if(logStatus!=null && logStatus.equals("Y")) {
			//로그인 상태일 때
			return true;
		} else {
			//로그인 안된 경우
			response.sendRedirect("/user/login");
			return false;
		}
	}
}