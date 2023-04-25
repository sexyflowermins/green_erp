package com.green.erp.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.erp.dto.NoticeFormDto;
import com.green.erp.dto.NoticeUpdateFormDto;
import com.green.erp.repository.model.Notice;

@Mapper
public interface NoticeRepository {

	public int insert(NoticeFormDto noticeFormDto);
	public int updateByForm(NoticeUpdateFormDto noticeUpdateFormDto);
	public int updateViews(int id);
	public int deleteById(int id);
	public Notice findById(int id);
	public List<Notice> findBySearch(String search);
	public List<Notice> findAll();
}
