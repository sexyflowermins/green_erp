package com.green.erp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.green.erp.dto.ScheduleDto;
import com.green.erp.handler.exception.CustomRestfullException;
import com.green.erp.repository.ScheduleRepository;
import com.green.erp.repository.model.Schedule;

@Service
public class ScheduleService {

    @Autowired
    private ScheduleRepository scheduleRepository;

    @Transactional
    public void addSchedule(ScheduleDto dto) {
        Schedule schedule = new Schedule();
        schedule.setTitle(dto.getTitle());
        schedule.setStartDate(dto.getStartDate());
        schedule.setEndDate(dto.getEndDate());
        schedule.setContent(dto.getContent());
        int resultRowCount = scheduleRepository.addSchedule(dto);
        if(resultRowCount != 1) {
            throw new CustomRestfullException("일정 등록 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    public List<Schedule> selectSchedule() {
        List<Schedule> list = scheduleRepository.selectSchedule();
        return list;
    }

    public Schedule selectScheduleDetail(Integer id) {
        Schedule scheduleEntity = scheduleRepository.selectScheduleDetail(id);
        return scheduleEntity;
    }

    public int deleteSchedule(Integer id) {
        int resultRowCount = scheduleRepository.deleteSchedule(id);
        return resultRowCount;
    }

    @Transactional
    public int updateSchedule(ScheduleDto dto, Integer id) {
        int scheduleEntity = scheduleRepository.updateSchedule(dto, id);
        return scheduleEntity;
    }


}
