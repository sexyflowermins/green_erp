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

import com.green.erp.dto.BoardFormDto;
import com.green.erp.dto.NoticeUpdateFormDto;
import com.green.erp.handler.exception.CustomRestfullException;
import com.green.erp.repository.model.Board;
import com.green.erp.repository.model.Category;
import com.green.erp.repository.model.Employees;
import com.green.erp.repository.model.Notice;
import com.green.erp.service.BoardService;
import com.green.erp.service.NoticeService;
import com.green.erp.utile.Define;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	BoardService boardService;
	@Autowired
	NoticeService noticeService;
	
	@Autowired
	private HttpSession session;
	
	@ModelAttribute("noticeList")
	public List<Notice> getNoticeList() {
		List<Notice> noticeList = noticeService.findWithName();
		return noticeList;
	}
	
	@GetMapping("/list")
	public String getBoardList(Model model) {
		
		List<Board> boardList = boardService.findAll();
		model.addAttribute(boardList);
		
		return "board/list";
	}
	
	@GetMapping("/write")
	public String createBoard(Model model) {
		
		List<Category> categoryList = boardService.findCategoryAll();
		model.addAttribute(categoryList);
		
		return "board/write";
	}
	
	@PostMapping("/write")
	public String createBoardProc(BoardFormDto boardFormDto) {

		Employees employees = (Employees) session.getAttribute(Define.PRINCIPAL);
		boardFormDto.setEmpId(employees.getId());
		boardService.createBoard(boardFormDto);

		return "redirect:/board/list";
	}
	
	@GetMapping("/post/{id}")
	public String getBoard(@PathVariable Integer id, Model model) {
		
		boardService.updateViews(id);
		Board board = boardService.findById(id);
		model.addAttribute(board);
		
		return "board/post";
	}
	
	@GetMapping("/delete/{id}")
	public String deleteBoard(@PathVariable Integer id) {
		
		boardService.deleteBoard(id);
		
		return "redirect:/board/list";
	}
	
	@GetMapping("/update/{id}")
	public String updateBoard(@PathVariable Integer id,Model model) {
		
		boardService.updateViews(id);
		Board board = boardService.findById(id);
		model.addAttribute(board);
		
		return "board/update";
	}
	
	@PostMapping("/updateProc")
	public String updateBoardProc(BoardFormDto updateFormDto) {

		boardService.updateBoard(updateFormDto);

		return "redirect:/board/list";
	}
}
