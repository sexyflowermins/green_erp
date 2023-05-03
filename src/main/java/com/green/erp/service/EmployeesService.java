package com.green.erp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.green.erp.dto.EndTimeFormDto;
import com.green.erp.dto.SignInFormDto;
import com.green.erp.dto.SignUpFormDto;
import com.green.erp.dto.StartTimeFormDto;
import com.green.erp.dto.UpdateInformationDto;
import com.green.erp.handler.exception.CustomRestfullException;
import com.green.erp.repository.EmployeesRepository;
import com.green.erp.repository.MySalaryRepository;
import com.green.erp.repository.WorkTimeRepository;
import com.green.erp.repository.model.Employees;
import com.green.erp.repository.model.MySalary;
import com.green.erp.repository.model.WorkTime;

@Service
public class EmployeesService {
	
	@Autowired
	private EmployeesRepository employeesRepository; 
	@Autowired
	private WorkTimeRepository workTimeRepository;
	@Autowired
	private MySalaryRepository mySalaryRepository;
	
	@Transactional
	public Employees signIn(SignInFormDto signInFormDto) {
		Employees employeesEntity = employeesRepository.findByUsernameAndPassword(signInFormDto);
		System.out.println(employeesEntity);
		if(employeesEntity == null) {
			throw new CustomRestfullException("아이디 혹은 비번이 틀렸습니다",HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return employeesEntity;
	}
	
	@Transactional
	public Employees selectById(int id) {
		Employees employeesEntity = employeesRepository.selectById(id);
		if(employeesEntity == null) {
			throw new CustomRestfullException("사번을 잘못 입력 했습니다",HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return employeesEntity;
	}
	
	@Transactional
	public void createEmployees(SignUpFormDto signUpFormDto) {
		int result = employeesRepository.insert(signUpFormDto);
		if (result != 1) {
			throw new CustomRestfullException("회원 가입 실패", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@Transactional
	public void changeInfo(UpdateInformationDto updateInformationDto) {
		
		int resultRowCount = employeesRepository.changeMyInfo(updateInformationDto);
		if(resultRowCount != 1) {
			throw new CustomRestfullException("정보 변경 실패", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@Transactional
	public WorkTime findByStartWork(Integer id) {
		WorkTime WorkTimeEntity = workTimeRepository.selectByEmpIdAndToday(id);
		return WorkTimeEntity;
	}
	
	@Transactional
	public int start(StartTimeFormDto startTimeFormDto) {
		int resultRowCount = workTimeRepository.insertByStartTime(startTimeFormDto);
		if(resultRowCount != 1) {
			throw new CustomRestfullException("출근 등록 실패", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return resultRowCount;
	}
	
	@Transactional
	public int end(EndTimeFormDto endTimeFormDto) {
		int resultRowCount = workTimeRepository.updateByEndTime(endTimeFormDto);
		if(resultRowCount != 1) {
			throw new CustomRestfullException("퇴근 등록 실패", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return resultRowCount;
	}
	
	@Transactional
	public List<WorkTime> findByWorkList(Integer id){
		List<WorkTime> WorkList = workTimeRepository.findByWorkList(id);
		return WorkList;
	}
	
	@Transactional
	public List<MySalary> mySalaryList(Integer id){  
		List<MySalary> resultSalary = mySalaryRepository.findByMySalary(id);
		return resultSalary;
	}
}
