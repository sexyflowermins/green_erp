package com.green.erp.service;

import java.util.List;

import org.h2.mvstore.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.green.erp.dto.BoardFormDto;
import com.green.erp.repository.BoardRepository;
import com.green.erp.repository.CategoryRepository;
import com.green.erp.repository.model.Board;
import com.green.erp.repository.model.Category;

@Service
public class BoardService {
	
	@Autowired
	private BoardRepository boardRepository;
	@Autowired
	private CategoryRepository categoryRepository;

	@Transactional
	public void createBoard(BoardFormDto boardFormDto) {

		int result = boardRepository.insert(boardFormDto);
		if (result != 1) {
			System.out.println("실패");
		}
	}

	@Transactional
	public List<Board> findAll() {
		List<Board> boardList = boardRepository.findAll();
		if (boardList == null) {
			System.out.println("실패");
		}

		return boardList;
	}
	
	@Transactional
	public List<Category> findCategoryCount(){
		
		List<Category> countList = categoryRepository.findCategoryCount();
		if (countList == null) {
			System.out.println("실패");
		}

		return countList;
	}
	
	@Transactional
	public List<Category> findCategoryAll() {
		List<Category> categoryList = categoryRepository.findCategoryAll();
		
		if (categoryList == null) {
			System.out.println("실패");
		}

		return categoryList;
	}
	
	@Transactional
	public List<Board> findLimit() {
		List<Board> boardList = boardRepository.findLimit();
		if (boardList == null) {
			System.out.println("실패");
		}

		return boardList;
	}
	
	@Transactional
	public Board findById(int id) {

		Board board = boardRepository.findById(id);
		if (board == null) {
			System.out.println("실패");
		}

		return board;
	}

	@Transactional
	public int updateBoard(BoardFormDto boardFormDto) {

		int resultRowCount = boardRepository.updateByForm(boardFormDto);

		if (resultRowCount != 1) {
			System.out.println("실패");
		}

		return resultRowCount;
	}

	@Transactional
	// 조회수 올리기 기능
	public int updateViews(int id) {
		int resultRowCount = boardRepository.updateViews(id);

		if (resultRowCount != 1) {
			System.out.println("실패");
		}

		return resultRowCount;
	}

	@Transactional
	public int deleteBoard(int id) {
		int resultRowCount = boardRepository.deleteById(id);

		if (resultRowCount != 1) {
			System.out.println("실패");
		}

		return resultRowCount;
	}
	
	@Transactional
	public int findBoardCount() {
		int boardCount = boardRepository.findBoardCount().getCount();

		return boardCount;
	}
	
	@Transactional
	public List<Board> findBoardListByPage(int page,int boardViewCount){
		
		List<Board> boardList = boardRepository.findListByPage(page,boardViewCount);
		if (boardList == null) {
			System.out.println("실패");
		}

		return boardList;
	}
	
	@Transactional
	public List<Board> findBoardCountByCategory(){
		List<Board> categoryList = boardRepository.findByCategory();
		
		if (categoryList == null) {
			System.out.println("실패");
		}

		return categoryList;
	}
}
