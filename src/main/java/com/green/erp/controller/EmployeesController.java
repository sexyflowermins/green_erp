package com.green.erp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.erp.dto.EndTimeFormDto;
import com.green.erp.dto.SignInFormDto;
import com.green.erp.dto.SignUpFormDto;
import com.green.erp.dto.StartTimeFormDto;
import com.green.erp.dto.UpdateInformationDto;
import com.green.erp.handler.exception.CustomRestfullException;
import com.green.erp.repository.model.Department;
import com.green.erp.repository.model.Employees;
import com.green.erp.repository.model.MySalary;
import com.green.erp.repository.model.WorkTime;
import com.green.erp.service.DepartmentService;
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

		WorkTime workTime = employeesService.findByStartWork(principal.getId());
		session.setAttribute(Define.WORKTIME, workTime);
		
		return "redirect:/erp/main";
	}
//	workTime = employeesService.findByStartWork(principal.getId());
	
	@GetMapping("/profile")
	public String profile(Model model) {
		Employees principal = (Employees)session.getAttribute("principal");
		if(principal == null) {
			throw new CustomRestfullException("인증된 사용자가 아닙니다.", 
							HttpStatus.UNAUTHORIZED);
		}
		WorkTime workTime = employeesService.findByStartWork(principal.getId());
		session.setAttribute(Define.WORKTIME, workTime);
		List<WorkTime> workList = employeesService.findByWorkList(principal.getId());
		if(workList.isEmpty()) {
			model.addAttribute("workList",null);			
		}else {
			model.addAttribute("workList",workList);						
		}
		List<MySalary> mySalaries = employeesService.mySalaryList(principal.getId());
		if(mySalaries.isEmpty()) {
			model.addAttribute("mySalaryList", mySalaries);
		}else {
			model.addAttribute("mySalaryList", mySalaries);
		}
		
		System.out.println(mySalaries.toString());
		return "profile";
	}
	
	@GetMapping("/logout")
	public String logout() {
		session.invalidate();
		//workTime = null;
		return "redirect:/erp/main";
	}
	
	/**
	 * 
	 * @param signUpFormDto
	 * @return
	 */
	@PostMapping("/employees-sign-up")
	public String employeesSignUp(SignUpFormDto signUpFormDto, Model model) {
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
	
	@GetMapping("/updateIn")
	public String updateMyIn() {
		Employees principal = (Employees)session.getAttribute("principal");
		
		if(principal == null) {
			throw new CustomRestfullException("인증된 사용자가 아닙니다.", 
							HttpStatus.UNAUTHORIZED);
		}
		return "updateInformation";
	}

	@PostMapping("/updateInformation")
	public String updateMyInfo(UpdateInformationDto updateInformationDto) {
		Employees principal = (Employees)session.getAttribute("principal");
		
		if(principal == null) {
			throw new CustomRestfullException("인증된 사용자가 아닙니다.", 
							HttpStatus.UNAUTHORIZED);
		}
		if(updateInformationDto.getName() == null || updateInformationDto.getName().isEmpty()) {
			throw new CustomRestfullException("이름을 입력하세요", HttpStatus.BAD_REQUEST);
		}
		
		if(updateInformationDto.getEmail() == null || updateInformationDto.getEmail().isEmpty()) {
			throw new CustomRestfullException("e-mail을 입력하세요", HttpStatus.BAD_REQUEST);
		}
		if(updateInformationDto.getAge() == null) {
			throw new CustomRestfullException("나이를 입력하세요", HttpStatus.BAD_REQUEST);
		}
		if(updateInformationDto.getAddress() == null || updateInformationDto.getAddress().isEmpty()) {
			throw new CustomRestfullException("지역을 입력하세요", HttpStatus.BAD_REQUEST);
		}
		if(updateInformationDto.getPassword() == null) {
			throw new CustomRestfullException("비밀번호를 입력하세요", HttpStatus.BAD_REQUEST);
		}
		updateInformationDto.setId(principal.getId());
		employeesService.changeInfo(updateInformationDto);
		session.invalidate();
		
		return "redirect:/ec/signIn";
	}
	
	@PostMapping("/start-work")
	public String startTime(StartTimeFormDto startTimeFormDto, Model model) {
		
		Employees principal = (Employees)session.getAttribute("principal");
		if(principal == null) {
			throw new CustomRestfullException("인증된 사용자가 아닙니다.", 
							HttpStatus.UNAUTHORIZED);
		}
		// WorkTime workTime =  // 서비스 호출해서 select 처리 
		// JSP 파일에 데이터를 내려주는 기술
		// 1. Model 선에 값 할당 
		startTimeFormDto.setEmpId(principal.getId());
		employeesService.start(startTimeFormDto);
		
		
		
		return "redirect:/ec/profile";
	}
	@PostMapping("/end-work")
	public String endTime(EndTimeFormDto endTimeFormDto) {
		Employees principal = (Employees)session.getAttribute("principal");
		if(principal == null) {
			throw new CustomRestfullException("인증된 사용자가 아닙니다.", 
							HttpStatus.UNAUTHORIZED);
		}
		endTimeFormDto.setEmpId(principal.getId());
		employeesService.end(endTimeFormDto);
		
		return "redirect:/erp/main";
	}
	
		
}
