package com.campus.myapp.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor implements HandlerInterceptor {
	// 컨트롤러가 호출되기 전에 입터셉터하는 메소드이다.
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		// 로그인 여부 확인하기
		HttpSession session = request.getSession();

		// 세션에서 로그인 정보를 구해온다
		String logStatus = (String) session.getAttribute("logStatus"); // null,y

		if (logStatus != null && logStatus.equals("Y")) {
			// 로그인 상태일때
			return true;
		} else {
			// 로그인 상태가 아닐때

			response.sendRedirect("/member/login");
			return false;
		}
		// postHandle()
		// afterCompletion()
	}
}
