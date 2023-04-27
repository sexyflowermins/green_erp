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
public class NoticeIntercepter implements HandlerInterceptor {
	
	@Autowired
	DepartmentService departmentService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Employees employees = (Employees) session.getAttribute(Define.PRINCIPAL);
		
		if(employees == null) {
			throw new CustomRestfullException("로그인 하세요", 
							HttpStatus.UNAUTHORIZED);
		}
		if(departmentService.findById(employees.getDepartment()).getName().equals("인사관리")==false){
			
		throw new CustomRestfullException("인증된 사용자가 아닙니다.", 
					HttpStatus.UNAUTHORIZED);
		}
		
		return true;
	}
}
