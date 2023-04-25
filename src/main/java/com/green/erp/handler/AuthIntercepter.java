package com.green.erp.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.green.erp.handler.exception.UnAuthorizedException;
import com.green.erp.repository.model.Employees;
import com.green.erp.utile.Define;

//1. HandlerInterceptor 구현
//2. 
@Component // IoC 대상 싱글톤 관리
public class AuthIntercepter implements HandlerInterceptor {
	//컨트롤러 들어가기 전
	// true ,false
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		Employees principal = (Employees)session.getAttribute(Define.PRINCIPAL);
		if(principal == null) {
			
			throw new UnAuthorizedException("로그인 먼저 해주세요", HttpStatus.UNAUTHORIZED);
			//return false;
		}
		return true;
	}
	
	//뷰가 렌더링 되기 전에 호출 되는 메서드
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}
	
	// 요청 처리가 완료되고 즉, 뷰 렌더링이 완료 된 후에 호출 되는 메서드
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}
	
}
