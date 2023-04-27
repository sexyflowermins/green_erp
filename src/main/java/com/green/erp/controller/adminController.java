package com.green.erp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.erp.repository.model.Department;
import com.green.erp.repository.model.Employees;
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

	@GetMapping("/selectdepartment")
	public String selectDepartment(Employees employees, Model model) {

		List<Employees> employeeslist = adminservice.selectDepartment(employees);
		model.addAttribute("employeeslist", employeeslist);
		return "/adminPage";

	}

	@GetMapping("/privacy")
	public String selectByEmployeesId(@RequestParam Integer id, Model model) {
		System.out.println(id);
		Employees employees = adminservice.selectByEmplyees(id);
		model.addAttribute("employees", employees);
		return "/privacy";

	}

	@PostMapping("/updatefromadmin")
	public String updatefromadmin(Employees employees) {
		System.out.println(employees.toString());
		adminservice.updateemployees(employees);
		return "/adminPage";
	}

	@GetMapping("/deleteByEmployees")
	public String deleteEmployees(Integer id) {
		System.out.println("id : " + id);
		adminservice.deleteEmpoyees(id);
		return "/adminPage";
	}

}
