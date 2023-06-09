package com.green.erp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.erp.dto.DepartmentCountDto;
import com.green.erp.dto.GradeCountDto;
import com.green.erp.repository.model.Board;
import com.green.erp.repository.model.Department;
import com.green.erp.repository.model.Grade;
import com.green.erp.repository.model.Notice;
import com.green.erp.service.BoardService;
import com.green.erp.service.NoticeService;
import com.green.erp.service.adminService;

@Controller

@RequestMapping("/erp")
public class ErpController {

	@Autowired
	private NoticeService noticeService;
	@Autowired
	private BoardService boardService;
	@Autowired
	private adminService adminservice;

	@ModelAttribute("headerNoticeList")
	public List<Notice> getheaderNoticeList() {
		
		List<Notice> headerNoticeList = noticeService.findWithNameOrderBy();
		
		return headerNoticeList;
	}

	@GetMapping("/main")
	private String main(Model model) {

		List<Board> boardList = boardService.findLimit();
		List<Board> countList = boardService.findBoardCountByCategory();

		model.addAttribute("boardList", boardList);
		model.addAttribute("countList", countList);

		return "main";
	}

	@GetMapping("/adminpage")
	public String adminpage(Model model) {
		
		List<Notice> noticeList = noticeService.findWithNameOrderBy();
		List<DepartmentCountDto> departmentList = adminservice.findByDepartment1();
		List<GradeCountDto> gradeCountDto = adminservice.gradeCount();
		
		model.addAttribute("gradeCountDto", gradeCountDto);
		model.addAttribute("departmentList", departmentList);

		model.addAttribute("noticeList",noticeList);
		return "/admin/adminPage";

	}

	@GetMapping("/signUp")
	public String signUp(Model model) {
		List<Department> list = adminservice.findAllDepartment();
		model.addAttribute("list", list);
		// 회원가입 직급 조회
		List<Grade> listgrade = adminservice.serchGrade();
		model.addAttribute("listgrade", listgrade);

		
		
		
		return "/admin/signUp";

	}
}
