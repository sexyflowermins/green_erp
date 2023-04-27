package com.green.erp.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.erp.dto.BoardFormDto;
import com.green.erp.repository.model.Board;
import com.green.erp.repository.model.CategoryCount;

@Mapper
public interface BoardRepository {
	
	public int insert(BoardFormDto boardFormDto);
	public List<Board> findLimit();
	public List<Board> findAll();
	public List<CategoryCount> findCategoryCount();
	public Board findById(int id);
	// 업데이트 폼 필요
	public int updateByForm(BoardFormDto boardFormDto);
	public int updateViews(int id);
	public int deleteById(int id);
}
