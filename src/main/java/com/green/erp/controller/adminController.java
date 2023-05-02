package com.green.erp.controller;

import java.util.List;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.green.erp.dto.DepartmentCountDto;
import com.green.erp.dto.GradeCountDto;
import com.green.erp.dto.RatingDto;
import com.green.erp.dto.SalaryDto;
import com.green.erp.dto.SalaryHistoryDto;
import com.green.erp.repository.model.Department;
import com.green.erp.repository.model.Employees;
import com.green.erp.repository.model.Grade;
import com.green.erp.repository.model.Notice;
import com.green.erp.repository.model.SalaryHistory;
import com.green.erp.repository.model.WorkTime;
import com.green.erp.service.NoticeService;
import com.green.erp.service.adminService;
@Controller
@RequestMapping("/admin")
public class adminController {

	@Autowired
	private adminService adminservice;
	
	@Autowired
	private NoticeService noticeService;
	
	@ModelAttribute("headerNoticeList")
	public List<Notice> getheaderNoticeList() {
		List<Notice> noticeList = noticeService.findWithNameOrderBy();
		return noticeList;
	}


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
		List<DepartmentCountDto> departmentList = adminservice.findByDepartment1();
		List<GradeCountDto> gradeCountDto = adminservice.gradeCount();
		model.addAttribute("gradeCountDto",gradeCountDto);
		model.addAttribute("departmentList", departmentList);
		model.addAttribute("selectdepartmentlist", selectdepartmentlist);
		return "/adminPage";
	}
	//부서에 포함된 사원 찾기
	@GetMapping("/selectdepartment")
	public String selectDepartment(@RequestParam String name, Employees employees, Model model) {
		List<Department> selectdepartmentlist = adminservice.findByDepartment(name);
		List<Employees> employeeslist = adminservice.selectDepartment(employees);
		List<DepartmentCountDto> departmentList = adminservice.findByDepartment1();
		List<GradeCountDto> gradeCountDto = adminservice.gradeCount();
		model.addAttribute("gradeCountDto",gradeCountDto);
		model.addAttribute("selectdepartmentlist", selectdepartmentlist);
		model.addAttribute("departmentList", departmentList);
		model.addAttribute("employeeslist", employeeslist);
		return "/adminPage";

	}
	// 사원정보 상세 페이지 이동
	@GetMapping("/privacy")
	public String selectByEmployeesId(@RequestParam Integer id, Model model) {
		Employees employees = adminservice.selectByEmplyees(id);
		List<Department> list = adminservice.findAllDepartment();
		List<Grade> listgrade = adminservice.serchGrade();
		List<SalaryDto> salaryList = adminservice.selectSalary();
		List<RatingDto> ratingList = adminservice.selectRating();
		model.addAttribute("listgrade", listgrade);
		model.addAttribute("list", list);
		model.addAttribute("employees", employees);
		model.addAttribute("salaryList", salaryList);
		model.addAttribute("ratingList",ratingList);
		
		return "/privacy";

	}
	// 사원정보 상세 페이지 수정
	@PostMapping("/updatefromadmin")
	public String updatefromadmin(Employees employees, SalaryHistoryDto salaryHistoryDto,HttpServletRequest request,@RequestParam("file")MultipartFile file) {
		
		adminservice.updateemployees(employees);
		adminservice.insertSalaryHistory(salaryHistoryDto);
		return "/adminPage";
	}
	//상세 페이지 모달 form
	
	//관리자 페이지 삭제
	@GetMapping("/deleteByEmployees")
	public String deleteEmployees(Integer id) {
		adminservice.deleteEmpoyees(id);
		return "/adminPage";
	}
	@PostMapping("/insertSalary")
	public String insertSalary(SalaryHistoryDto salaryHistoryDto) {
		adminservice.insertSalaryHistory(salaryHistoryDto);
		String message = "";
		
		return "/adminPage";
	}
	@GetMapping("/workTimeDetail/{empId}")
    public String workTimeDetail(@PathVariable Integer empId, Model model) {
		List<WorkTime> workTimeDetail = adminservice.selectWorkTime(empId);
        model.addAttribute("workTimeDetail", workTimeDetail);
        return "/adminPage";
    }
	
	@GetMapping("/salaryHistoryDetail/{id}")
	public String salaryHistoryDetail(@PathVariable Integer id, Model model) {
		List<SalaryHistory> salaryHistoryDetail = adminservice.selectSalaryHistory(id);
		model.addAttribute("salaryHistoryDetail", salaryHistoryDetail);
		return "/salaryHistoryView";
	}
	
	
}
