package com.green.erp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.erp.dto.BoardReplyFormDto;
import com.green.erp.repository.model.Board;
import com.green.erp.repository.model.BoardReply;
import com.green.erp.repository.model.Employees;
import com.green.erp.service.BoardReplyService;
import com.green.erp.service.BoardService;
import com.green.erp.utile.Define;


@Controller
@RequestMapping("/boardReply")
public class BoardReplyController {
	
	@Autowired
	private BoardReplyService boardReplyService;
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private HttpSession session;
	
	
	@PostMapping("/write")
	public String createBoardProc(BoardReplyFormDto boardReplyFormDto,Model model) {

		String content = boardReplyFormDto.getContent().replaceAll("\r\n", "<BR>");
		boardReplyFormDto.setContent(content);
		Employees employees = (Employees) session.getAttribute(Define.PRINCIPAL);
		boardReplyFormDto.setEmpId(employees.getId());
		boardReplyService.createBoardReply(boardReplyFormDto);
		
		int findBoardId = boardReplyFormDto.getBoardId();
		
		Board board = boardService.findById(findBoardId);
		List<BoardReply> replyList = boardReplyService.findBoardReplyListById(findBoardId);

		model.addAttribute(board);
		model.addAttribute(replyList);
		
		return "redirect:/board/post/"+board.getId();
	}
	
	@GetMapping("/delete/{replyId}/{boardId}")
	public String deleteBoardReply(@PathVariable Integer replyId,@PathVariable Integer boardId,Model model) {

		boardReplyService.deleteBoardReplyById(replyId);
		Board board = boardService.findById(boardId);
		List<BoardReply> replyList = boardReplyService.findBoardReplyListById(boardId);
		
		model.addAttribute("board",board);
		model.addAttribute("replyList",replyList);

		return "redirect:/board/post/"+board.getId();
	}
}
