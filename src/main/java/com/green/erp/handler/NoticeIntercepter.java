package com.green.erp.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.green.erp.repository.model.Employees;
import com.green.erp.utile.Define;

@Component
public class NoticeIntercepter implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Employees employees = (Employees) session.getAttribute(Define.PRINCIPAL);

		if(employees==null||employees.getDepartment() != "인사") {
			
			response.sendRedirect("/erp/main");
			return false;
		}
		
		return true;
	}
}
