package com.green.erp.repository;

import org.apache.ibatis.annotations.Mapper;

import com.green.erp.dto.SignInFormDto;
import com.green.erp.repository.model.Employees;

@Mapper
public interface EmployeesRepository {
	
	public Employees findByUsernameAndPassword(SignInFormDto signInFormDto);
	public Employees selectById(SignInFormDto signInFormDto);
}
