package com.green.erp.handler;

import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import com.green.erp.handler.exception.CustomRestfullException;
import com.green.erp.handler.exception.UnAuthorizedException;

/**
 * 예외 시
 *	데이터를 내려줄수 있다.	
 *
 */
@RestControllerAdvice // IoC 대상 + AOP 기반
public class MyrestfullExceptionHandler {
	
	@ExceptionHandler
	public void exception(Exception e) {
		System.out.println(e.getClass().getName());
		System.out.println(e.getMessage());
	}
	//사용자 정의 예외 클래스 활용
	@ExceptionHandler(CustomRestfullException.class)
	public String basicException(CustomRestfullException e) {
		StringBuffer sb = new StringBuffer();
		sb.append("<script>");
		//반드시 마지막에 ;을 붙여서 사용하자
		sb.append("alert('"+e.getMessage()+"');");
		sb.append("location.href='/erp/main';");
		sb.append("</script>");
		return sb.toString();
	}
	
	@ExceptionHandler(UnAuthorizedException.class)
	public String unAuthorizedExceptionth(UnAuthorizedException e) {
		StringBuffer sb = new StringBuffer();
		sb.append("<script>");
		//반드시 마지막에 ;을 붙여서 사용하자
		sb.append("alert('"+e.getMessage()+"');");
		sb.append("location.href='/ec/signIn';");
		sb.append("</script>");
		return sb.toString();
	}
}
