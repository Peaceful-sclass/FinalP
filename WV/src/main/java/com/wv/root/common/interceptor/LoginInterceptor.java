package com.wv.root.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor {

	private Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
	logger.info("[interceptor]: preHandle \n");
		
		if(request.getRequestURI().contains("/home.do") ||
				request.getRequestURI().contains("/rehome.do") ||
				request.getRequestURI().contains("/homeClist.do") ||
				request.getRequestURI().contains("/register.do") ||
				request.getRequestURI().contains("/login.do") ||
				request.getRequestURI().contains("/emailConfirm.do") ||
				request.getRequestURI().contains("/placeselect.do") ||
				request.getRequestURI().contains("/placedetail.do") ||
				request.getRequestURI().contains("/pcommentlist.do") ||
				request.getRequestURI().contains("/placecate.do") ||
				request.getRequestURI().contains("/findform.do") ||
				request.getRequestURI().contains("/findid.do") ||
				request.getRequestURI().contains("/findpw.do") ||
				request.getRequestURI().contains("/idChk.do") ||
				request.getRequestURI().contains("/comunity.do") ||
				request.getRequestURI().contains("/cmdetail.do") ||
				request.getSession().getAttribute("member") != null ) { //login된 유저만 login되도록 처리(controller로 넘어가도록).
			return true;
		}
		
		if(request.getSession().getAttribute("member") == null 	) {
			response.sendRedirect("rehome.do");	//위에서 로긴이 안되있으면 인터셉트 걸어서 homeClist.do로 강제로 돌려버림.
			System.out.println("***** 로그인을 해야 지나갈 수 있는 곳입니다. *****");
			return false;
		}
		
		
		
		return false;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}
