package com.green.erp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.erp.dto.NoticeFormDto;
import com.green.erp.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("/write")
	public String createNotice() {
		return "notice/write";
	}
	
	@PostMapping("/write")
	public String createNoticeProc(NoticeFormDto noticeFormDto) {
		
		noticeFormDto.setEmpId(20230424);
		noticeService.createNotice(noticeFormDto);
		 
		return "redirect:/erp/main";
	}
	
}
