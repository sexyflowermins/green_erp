package com.green.erp.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.erp.dto.NoticeFormDto;
import com.green.erp.dto.NoticeUpdateFormDto;
import com.green.erp.repository.model.Employees;
import com.green.erp.repository.model.Notice;
import com.green.erp.service.EmployeesService;
import com.green.erp.service.NoticeService;
import com.green.erp.utile.Define;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private EmployeesService employeesService;
	@Autowired
	private HttpSession session;
	
	@ModelAttribute("noticeList")
	public List<Notice> getNoticeList() {
		List<Notice> noticeList = noticeService.findAll();
		return noticeList;
	}
	
	@GetMapping("/list")
	public String noticeList(@ModelAttribute("noticeList") List<Notice> noticeList,Model model) {

		List<String> nameList = new ArrayList<>();
		
		for(int i=0;i<noticeList.size();i++) {
			Employees username = employeesService.selectById(noticeList.get(i).getEmpId());
			nameList.add(username.getName());
		}
		model.addAttribute("nameList",nameList);
		
		return "notice/list";
	}
	
	@GetMapping("/list/{search}")
	public String noticeListBySearch(@PathVariable String search,@ModelAttribute("noticeList") List<Notice> noticeList,Model model) {
		
		return "notice/list";
	}
	
	@GetMapping("/write")
	public String createNotice() {
		return "notice/write";
	}
	
	@PostMapping("/write")
	public String createNoticeProc(NoticeFormDto noticeFormDto) {
		
		Employees employees = (Employees)session.getAttribute(Define.PRINCIPAL);
		noticeFormDto.setEmpId(employees.getId());
		noticeService.createNotice(noticeFormDto);
		
		return "redirect:/erp/main";
	}
	
	@GetMapping("/update/{id}")
	public String updateNotice(@PathVariable Integer id,Model model) {
		
		noticeService.updateViews(id);
		Notice notice = noticeService.findById(id);
		model.addAttribute(notice);
		
		return "notice/update";
	}
	
	@PostMapping("/updateProc")
	public String updateNoticeProc(NoticeUpdateFormDto updateFormDto) {
		
		noticeService.updateNotice(updateFormDto);
		
		return "redirect:/erp/main";
	}
	
	@GetMapping("/delete/{id}")
	public String deleteNotice(@PathVariable Integer id) {
		
		noticeService.deleteNotice(id);
		
		return "redirect:/notice/list";
	}
	
}
