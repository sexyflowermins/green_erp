package com.green.erp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.erp.dto.BoardReplyFormDto;
import com.green.erp.repository.BoardReplyRepository;
import com.green.erp.repository.model.BoardReply;

@Service
public class BoardReplyService {
	
	@Autowired
	private BoardReplyRepository boardReplyRepository;
	
	public void createBoardReply(BoardReplyFormDto boardReplyFormDto) {
		
		int result = boardReplyRepository.insert(boardReplyFormDto);
		if(result != 1) {
			System.out.println("실패");
		}
	}
	
	public List<BoardReply> findBoardReplyListById(int id){
		List<BoardReply> replyList = boardReplyRepository.findListByBoardId(id);
		
		if(replyList == null) {
			System.out.println("실패");
		}
		
		return replyList;
	}
	
	public void deleteBoardReplyById(int id) {
		int result = boardReplyRepository.deleteById(id);
		if(result != 1) {
			System.out.println("실패");
		}
	}
}
