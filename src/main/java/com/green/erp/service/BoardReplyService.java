package com.green.erp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.green.erp.dto.BoardReplyFormDto;
import com.green.erp.repository.BoardReplyRepository;
import com.green.erp.repository.model.BoardReply;

@Service
public class BoardReplyService {
	
	@Autowired
	private BoardReplyRepository boardReplyRepository;
	
	@Transactional
	public void createBoardReply(BoardReplyFormDto boardReplyFormDto) {
		
		int result = boardReplyRepository.insert(boardReplyFormDto);
		if(result != 1) {
			System.out.println("실패");
		}
	}
	
	@Transactional
	public List<BoardReply> findBoardReplyListById(int id){
		List<BoardReply> replyList = boardReplyRepository.findListByBoardId(id);
		
		if(replyList == null) {
			System.out.println("실패");
		}
		
		return replyList;
	}
	
	@Transactional
	public BoardReply findBoardReplyById(int id){
		BoardReply reply = boardReplyRepository.findByBoardId(id);
		
		if(reply == null) {
			System.out.println("실패");
		}
		
		return reply;
	}
	
	@Transactional
	public void deleteBoardReplyById(int id) {
		int result = boardReplyRepository.deleteById(id);
		if(result != 1) {
			System.out.println("실패");
		}
	}
}
