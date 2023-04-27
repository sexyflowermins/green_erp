package com.green.erp.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.erp.dto.EndTimeFormDto;
import com.green.erp.dto.StartTimeFormDto;
import com.green.erp.repository.model.WorkTime;

@Mapper
public interface WorkTimeRepository {

	public int insertByStartTime(StartTimeFormDto startTimeFormDto);
	public WorkTime selectByEmpIdAndToday(Integer id);
	public int updateByEndTime(EndTimeFormDto endTimeFormDto);
	public List<WorkTime> findByWorkList(Integer id);
}
