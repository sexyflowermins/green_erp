package com.green.erp.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.erp.dto.BoardReplyFormDto;
import com.green.erp.repository.model.BoardReply;

@Mapper
public interface BoardReplyRepository {

	public int insert(BoardReplyFormDto boardReplyFormDto);
	public List<BoardReply> findListByBoardId(int id);
	public BoardReply findByBoardId(int id);
	public int deleteById(int id);
}
