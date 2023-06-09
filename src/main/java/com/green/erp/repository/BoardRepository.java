package com.green.erp.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.green.erp.dto.BoardFormDto;
import com.green.erp.repository.model.Board;
import com.green.erp.repository.model.Category;

@Mapper
public interface BoardRepository {
	
	public int insert(BoardFormDto boardFormDto);
	public List<Board> findLimit();
	public List<Board> findAll();
	public Board findById(int id);
	public int updateByForm(BoardFormDto boardFormDto);
	public int updateViews(int id);
	public int deleteById(int id);
	public Board findBoardCount();
	public List<Board> findListByPage(@Param("page")int page,@Param("boardViewCount")int boardViewCount);
	public List<Board> findByCategory();
}
