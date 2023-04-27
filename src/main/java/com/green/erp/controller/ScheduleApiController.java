package com.green.erp.controller;

import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.green.erp.dto.ScheduleDto;
import com.green.erp.handler.exception.CustomRestfullException;
import com.green.erp.repository.model.Employees;
import com.green.erp.repository.model.Schedule;
import com.green.erp.service.ScheduleService;
import com.green.erp.utile.Define;

@RestController
public class ScheduleApiController {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	ScheduleService scheduleService;
	
	@PostMapping("/api/addSchedule")
	public ScheduleDto addSchedule(@RequestBody ScheduleDto dto) {
		Employees employees = (Employees)session.getAttribute(Define.PRINCIPAL);
		if(dto.getTitle() == null) {
			throw new CustomRestfullException("제목을 입력 하세요", HttpStatus.BAD_REQUEST);
		}
		if(dto.getContent() == null) {
			throw new CustomRestfullException("내용을 입력 하세요", HttpStatus.BAD_REQUEST);
		}
		
		scheduleService.addSchedule(dto);
		
		return dto;
	}
	
	@GetMapping("/api/scheduleDetail/{id}")
	public Schedule scheduleDetail(@PathVariable int id) {
		Schedule scheduleDetail = scheduleService.selectScheduleDetail(id);
		return scheduleDetail;
	}
	
	@DeleteMapping("/api/deleteSchedule/{id}")
	public String deleteSchedule(@PathVariable int id) {
		Employees employees = (Employees)session.getAttribute(Define.PRINCIPAL);
		int resultRow = scheduleService.deleteSchedule(id);
		return resultRow + "";
	}
	
	@PostMapping("/api/updateSchedule/{id}")
	public String updateSchedule(@RequestBody ScheduleDto dto ,@PathVariable int id) {
		Employees employees = (Employees)session.getAttribute(Define.PRINCIPAL);
		int result = scheduleService.updateSchedule(dto, id);
		return result + "";
	}
	
	
}