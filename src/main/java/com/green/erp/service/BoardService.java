package com.green.erp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.erp.dto.BoardFormDto;
import com.green.erp.repository.BoardRepository;
import com.green.erp.repository.model.Board;
import com.green.erp.repository.model.CategoryCount;

@Service
public class BoardService {
	
	@Autowired
	private BoardRepository boardRepository;

	public void createBoard(BoardFormDto boardFormDto) {

		int result = boardRepository.insert(boardFormDto);
		if (result != 1) {
			System.out.println("실패");
		}
	}

	public List<Board> findAll() {
		List<Board> boardList = boardRepository.findAll();
		if (boardList == null) {
			System.out.println("실패");
		}

		return boardList;
	}
	
	public List<CategoryCount> findCategoryCount(){
		
		List<CategoryCount> countList = boardRepository.findCategoryCount();
		if (countList == null) {
			System.out.println("실패");
		}

		return countList;
	}
	
	public List<Board> findLimit() {
		List<Board> boardList = boardRepository.findLimit();
		if (boardList == null) {
			System.out.println("실패");
		}

		return boardList;
	}
	
	public Board findById(int id) {

		Board board = boardRepository.findById(id);
		if (board == null) {
			System.out.println("실패");
		}

		return board;
	}

	public int updateNotice(BoardFormDto boardFormDto) {

		int resultRowCount = boardRepository.updateByForm(boardFormDto);

		if (resultRowCount != 1) {
			System.out.println("실패");
		}

		return resultRowCount;
	}

	// 조회수 올리기 기능
	public int updateViews(int id) {
		int resultRowCount = boardRepository.updateViews(id);

		if (resultRowCount != 1) {
			System.out.println("실패");
		}

		return resultRowCount;
	}

	public int deleteNotice(int id) {
		int resultRowCount = boardRepository.deleteById(id);

		if (resultRowCount != 1) {
			System.out.println("실패");
		}

		return resultRowCount;
	}
}
