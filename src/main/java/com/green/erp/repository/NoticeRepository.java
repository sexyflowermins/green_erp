package com.green.erp.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.erp.dto.NoticeFormDto;
import com.green.erp.repository.model.Notice;

@Mapper
public interface NoticeRepository {

	public int insert(NoticeFormDto noticeFormDto);
	public int updateById();
	public int deleteById();
	public Notice findById(Integer id);
	public List<Notice> findAll();
}
