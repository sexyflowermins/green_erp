package com.green.erp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.erp.repository.model.Department;
import com.green.erp.repository.model.Employees;
import com.green.erp.repository.model.WorkTime;
import com.green.erp.service.adminService;

@Controller
public class adminController {

	@Autowired
	private adminService adminservice;

	// 전체조회
	@GetMapping("/findAll")
	public String department(Model model) {

		List<Department> list = adminservice.findAllDepartment();
		model.addAttribute("list", list);
		return "/adminPage";

	}
	// 선택조회
	@GetMapping("/findBydepartment")
	public String findByDepartment(@RequestParam String name, Model model) {
		List<Department> selectdepartmentlist = adminservice.findByDepartment(name);
		model.addAttribute("selectdepartmentlist", selectdepartmentlist);
		System.out.println(name);
		return "/adminPage";
	}
	//부서에 포함된 사원 찾기
	@GetMapping("/selectdepartment")
	public String selectDepartment(Employees employees, Model model) {

		List<Employees> employeeslist = adminservice.selectDepartment(employees);
		model.addAttribute("employeeslist", employeeslist);
		return "/adminPage";

	}
	// 사원정보 상세 페이지 이동
	@GetMapping("/privacy")
	public String selectByEmployeesId(@RequestParam Integer id, Model model) {
		System.out.println(id);
		Employees employees = adminservice.selectByEmplyees(id);
		model.addAttribute("employees", employees);
		return "/privacy";

	}
	// 사원정보 상세 페이지 수정
	@PostMapping("/updatefromadmin")
	public String updatefromadmin(Employees employees) {
		System.out.println(employees.toString());
		
		adminservice.updateemployees(employees);
		return "/adminPage";
	}
	//관리자 페이지 삭제
	@GetMapping("/deleteByEmployees")
	public String deleteEmployees(Integer id) {
		System.out.println(id);
		adminservice.deleteEmpoyees(id);
		return "/adminPage";
	}

	@GetMapping("/workTimeDetail/{empId}")
    public String workTimeDetail(@PathVariable Integer empId, Model model) {
        WorkTime workTimeDetail = adminservice.selectWorkTime(empId);
        System.out.println(workTimeDetail);
        model.addAttribute("workTimeDetail", workTimeDetail);
        return "/adminPage";
    }
	
	
}
