package com.green.erp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.green.erp.dto.SignInFormDto;
import com.green.erp.handler.exception.CustomRestfullException;
import com.green.erp.repository.EmployeesRepository;
import com.green.erp.repository.model.Employees;

@Service
public class EmployeesService {
	
	@Autowired
	private EmployeesRepository employeesRepository; 
	
	public Employees signIn(SignInFormDto signInFormDto) {
		Employees employeesEntity = employeesRepository.findByUsernameAndPassword(signInFormDto);
		if(employeesEntity == null) {
			throw new CustomRestfullException("아이디 혹은 비번이 틀렸습니다",HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return employeesEntity;
	}
	
	public Employees selectIdForName(SignInFormDto signInFormDto) {
		Employees employeesEntity = employeesRepository.selectById(signInFormDto);
		if(employeesEntity == null) {
			throw new CustomRestfullException("사번을 잘못 입력 했습니다",HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return employeesEntity;
	}
	
}
