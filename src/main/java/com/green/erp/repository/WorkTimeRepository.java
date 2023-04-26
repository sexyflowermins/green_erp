package com.green.erp.repository;

import org.apache.ibatis.annotations.Mapper;

import com.green.erp.dto.StartTimeFormDto;

@Mapper
public interface WorkTimeRepository {

	public int insertByStartTime(StartTimeFormDto startTimeFormDto);
	
}
