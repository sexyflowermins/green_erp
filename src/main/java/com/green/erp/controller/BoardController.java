package com.green.erp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.erp.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
//	@Autowired
//	private BoardService boardService;
	
	@GetMapping("/list")
	public String boardList() {
		
		return "board/list";
	}
}
