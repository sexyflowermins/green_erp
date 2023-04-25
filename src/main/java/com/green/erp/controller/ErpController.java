package com.green.erp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.erp.repository.model.Notice;
import com.green.erp.service.ErpService;
import com.green.erp.service.NoticeService;

@Controller
@RequestMapping("/erp")
public class ErpController {

	@Autowired
	private ErpService erpService;
	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("/main")
	private String main(Model model){
		
		List<Notice> noticeList = noticeService.findAll();
		model.addAttribute("noticeList",noticeList);
		
		return "main";
	}
	
}
