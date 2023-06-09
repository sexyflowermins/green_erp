package com.green.erp.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.green.erp.handler.exception.CustomRestfullException;
import com.green.erp.repository.model.Employees;
import com.green.erp.service.DepartmentService;
import com.green.erp.utile.Define;

@Component
public class BoardIntercepter implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Employees employees = (Employees) session.getAttribute(Define.PRINCIPAL);
		
		if(employees == null) {
			throw new CustomRestfullException("로그인 하세요", 
							HttpStatus.UNAUTHORIZED);
		}
		
		return true;
	}
}
