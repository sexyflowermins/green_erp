package com.green.erp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.erp.dto.NoticeFormDto;
import com.green.erp.dto.NoticeUpdateFormDto;
import com.green.erp.handler.exception.CustomRestfullException;
import com.green.erp.repository.model.Board;
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
	private HttpSession session;

	@ModelAttribute("noticeList")
	public List<Notice> getNoticeList() {
		List<Notice> noticeList = noticeService.findWithName();
		
		return noticeList;
	}

	@ModelAttribute("headerNoticeList")
	public List<Notice> getheaderNoticeList() {
	
		List<Notice> headerNoticeList = noticeService.findWithNameOrderBy();
		
		return headerNoticeList;
	}

	@GetMapping("/list")
	public String noticeList(Model model) {

		Employees principal = (Employees) session.getAttribute(Define.PRINCIPAL);
		if (principal == null) {
			throw new CustomRestfullException("로그인 하세요", HttpStatus.UNAUTHORIZED);
		}

		return "notice/list";
	}

	@GetMapping("/detail/{id}")
	public String getDetailById(@PathVariable Integer id, Model model) {

		Notice notice = noticeService.findById(id);
		model.addAttribute(notice);

		return "notice/detail";
	}

	@GetMapping("/write")
	public String createNotice() {

		return "notice/write";
	}

	@PostMapping("/write")
	public String createNoticeProc(NoticeFormDto noticeFormDto) {

		Employees principal = (Employees) session.getAttribute(Define.PRINCIPAL);
		noticeFormDto.setEmpId(principal.getId());
		String content = noticeFormDto.getContent().replaceAll("\r\n", "<BR>");
		noticeFormDto.setContent(content);
		noticeService.createNotice(noticeFormDto);

		return "redirect:/notice/list";
	}

	@GetMapping("/update/{id}")
	public String updateNotice(@PathVariable Integer id, Model model) {
		
		Notice notice = noticeService.findById(id);
		notice.setContent(notice.getContent().replaceAll("<BR>", "\r\n"));
		model.addAttribute(notice);

		return "notice/update";
	}

	@PostMapping("/updateProc")
	public String updateNoticeProc(NoticeUpdateFormDto updateFormDto) {

		String content = updateFormDto.getContent().replaceAll("\r\n", "<BR>");
		updateFormDto.setContent(content);
		noticeService.updateNotice(updateFormDto);

		return "redirect:/notice/list";
	}

	@GetMapping("/delete/{id}")
	public String deleteNotice(@PathVariable Integer id) {

		noticeService.deleteNotice(id);

		return "redirect:/notice/list";
	}

}
