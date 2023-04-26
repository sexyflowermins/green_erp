package com.green.erp.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.erp.dto.SignInFormDto;
import com.green.erp.dto.SignUpFormDto;
import com.green.erp.handler.exception.CustomRestfullException;
import com.green.erp.repository.model.Employees;
import com.green.erp.service.EmployeesService;
import com.green.erp.utile.Define;

@Controller
@RequestMapping("/ec")
public class EmployeesController {
	
	@Autowired
	EmployeesService employeesService;
	
	@Autowired
	HttpSession session;
	
	@GetMapping("/signIn")
	public String signIn() {
		return "signIn";
	}
	@PostMapping("/signInProc")
	public String signProc(SignInFormDto signInFormDto) {
		
		if(signInFormDto.getId() == null) {
			throw new CustomRestfullException("사번을 입력하세요", HttpStatus.BAD_REQUEST);
		}
		if(signInFormDto.getPassword() == null || signInFormDto.getPassword().isEmpty()) {
			throw new CustomRestfullException("비밀번호를 입력하세요", HttpStatus.BAD_REQUEST);
		}
		Employees principal = employeesService.signIn(signInFormDto);
		session.setAttribute(Define.PRINCIPAL, principal);
		return "redirect:/erp/main";
	}
	
	@GetMapping("/profile")
	public String profile() {
		Employees principal = (Employees)session.getAttribute("principal");
		if(principal == null) {
			throw new CustomRestfullException("인증된 사용자가 아닙니다.", 
							HttpStatus.UNAUTHORIZED);
		}
		return "profile";
	}
	
	@GetMapping("/logout")
	public String logout() {
		session.invalidate();
		return "redirect:/erp/main";
	}
	
	/**
	 * 
	 * @param signUpFormDto
	 * @return
	 */
	@PostMapping("/employees-sign-up")
	public String employeesSignUp(SignUpFormDto signUpFormDto) {
		if(signUpFormDto.getId() == null) {
			// 현재 시간이랑 비교해서 만들기
			throw new CustomRestfullException("사번을 입력하세요", HttpStatus.BAD_REQUEST);
		}
		if(signUpFormDto.getName() == null || signUpFormDto.getName().isEmpty()) {
			throw new CustomRestfullException("이름을 입력하세요", HttpStatus.BAD_REQUEST);
		}
		if(signUpFormDto.getEmail() == null || signUpFormDto.getEmail().isEmpty()) {
			throw new CustomRestfullException("e-mail을 입력하세요", HttpStatus.BAD_REQUEST);
		}
		if(signUpFormDto.getAge() == null) {
			throw new CustomRestfullException("나이를 입력하세요", HttpStatus.BAD_REQUEST);
		}
		if(signUpFormDto.getAddress() == null || signUpFormDto.getAddress().isEmpty()) {
			throw new CustomRestfullException("지역을 입력하세요", HttpStatus.BAD_REQUEST);
		}
		if(signUpFormDto.getHireDate() == null || signUpFormDto.getHireDate().isEmpty()) {
			throw new CustomRestfullException("입사일을 입력하세요", HttpStatus.BAD_REQUEST);
		}
		employeesService.createEmployees(signUpFormDto);
		return "redirect:/erp/main";
	}
	
	
}
