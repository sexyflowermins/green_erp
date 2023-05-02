package com.green.erp.controller;

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
import org.springframework.web.bind.annotation.RequestParam;

import com.green.erp.dto.BoardFormDto;
import com.green.erp.repository.model.Board;
import com.green.erp.repository.model.BoardReply;
import com.green.erp.repository.model.Category;
import com.green.erp.repository.model.Employees;
import com.green.erp.repository.model.Notice;
import com.green.erp.service.BoardReplyService;
import com.green.erp.service.BoardService;
import com.green.erp.service.NoticeService;
import com.green.erp.utile.Define;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService boardService;
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private BoardReplyService boardReplyService;

	@Autowired
	private HttpSession session;

	@ModelAttribute("headerNoticeList")
	public List<Notice> getheaderNoticeList() {
		List<Notice> headerNoticeList = noticeService.findWithNameOrderBy();
		return headerNoticeList;
	}

	@GetMapping("/list")
	public String getBoardList(@RequestParam(value = "curPage", defaultValue = "0") Integer curPage,
			@RequestParam(value = "page", defaultValue = "1") Integer page,
			@RequestParam(value = "boardViewCount", defaultValue = "5") Integer viewCount, Model model) {

		// 현재 페이지 게시글 번호
		int pageCount = curPage;
		// 현재 페이지 번호
		int pageNumber = page;
		// 전체 게시글의 개수
		int boardCountAll = boardService.findBoardCount();
		int boardViewCount = viewCount;
		int lastPageNumber;
		int lastPageCount;
		int boardSize = boardService.findBoardCount();
		List<Board> boardList = boardService.findBoardListByPage(pageCount, boardViewCount);

		if (boardSize % Define.PAGEBOARDCOUNT != 0 || boardSize == 0) {
			lastPageCount = (boardSize / boardViewCount) * boardViewCount;
			lastPageNumber = boardSize / boardViewCount + 1;
		} else {
			lastPageCount = (boardSize / boardViewCount - 1) * boardViewCount;
			lastPageNumber = boardSize / boardViewCount;
		}

		model.addAttribute("boardCountAll", boardCountAll);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("pageNumber", pageNumber);
		model.addAttribute("lastPageCount", lastPageCount);
		model.addAttribute("lastPageNumber", lastPageNumber);
		model.addAttribute("boardList", boardList);
		model.addAttribute("boardViewCount", boardViewCount);

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

		String content = boardFormDto.getContent().replaceAll("\r\n", "<BR>");
		boardFormDto.setContent(content);
		Employees employees = (Employees) session.getAttribute(Define.PRINCIPAL);
		boardFormDto.setEmpId(employees.getId());
		boardService.createBoard(boardFormDto);

		return "redirect:/board/list";
	}

	@GetMapping("/post/{id}")
	public String getBoard(@PathVariable Integer id, Model model) {

		boardService.updateViews(id);

		Board board = boardService.findById(id);
		List<BoardReply> replyList = boardReplyService.findBoardReplyListById(id);

		model.addAttribute("board", board);
		model.addAttribute("replyList", replyList);

		return "board/post";
	}

	@GetMapping("/delete/{id}")
	public String deleteBoard(@PathVariable Integer id) {

		boardService.deleteBoard(id);

		return "redirect:/board/list";
	}

	@GetMapping("/update/{id}")
	public String updateBoard(@PathVariable Integer id, Model model) {

		boardService.updateViews(id);
		Board board = boardService.findById(id);
		String content = board.getContent().replaceAll("<BR>", "\r\n");
		board.setContent(content);
		model.addAttribute(board);

		return "board/update";
	}

	@PostMapping("/updateProc")
	public String updateBoardProc(BoardFormDto boardFormDto) {

		String content = boardFormDto.getContent().replaceAll("\r\n", "<BR>");
		boardFormDto.setContent(content);
		boardService.updateBoard(boardFormDto);

		return "redirect:/board/list";
	}
}
