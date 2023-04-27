package com.green.erp.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.green.erp.dto.ScheduleDto;
import com.green.erp.repository.model.Schedule;

@Mapper
public interface ScheduleRepository {

    public int addSchedule(ScheduleDto dto);
    public List<Schedule> selectSchedule();
    public Schedule selectScheduleDetail(int id);
    // 파리미터 갯수가 2 개 이상이면 @Param
    public int updateSchedule(@Param("dto")ScheduleDto dto, @Param("id") int id);
    public int deleteSchedule(int id);

}