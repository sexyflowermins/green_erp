package com.green.erp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.erp.repository.model.Employees;
import com.green.erp.service.adminService;

@Controller
public class adminController {

	@Autowired
	private adminService adminservice;

	@GetMapping("/findAll")
	public String department(Model model) {

		List<Employees> list = adminservice.findAllDepartment();
		model.addAttribute("list", list);
		return "/adminPage";

	}

	@GetMapping("/findBydepartment")
	public String findByDepartment(@RequestParam String department, Model model) {
		System.out.println(department);
		List<Employees> selectdepartmentlist = adminservice.findByDepartment(department);
		model.addAttribute("selectdepartmentlist", selectdepartmentlist);
		return "/adminPage";
	}
	@GetMapping("/selectdepartment")
	public String selectDepartment(Model model) {

		List<Employees> selectdepartment = adminservice.selectDepartment();
		model.addAttribute("selectdepartment", selectdepartment);
		return "/adminPage";

	}
}
