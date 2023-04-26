package com.green.erp.repository;

import org.apache.ibatis.annotations.Mapper;

import com.green.erp.dto.SignInFormDto;
import com.green.erp.dto.SignUpFormDto;
import com.green.erp.dto.UpdateInformationDto;
import com.green.erp.repository.model.Employees;

@Mapper
public interface EmployeesRepository {
	
	public Employees findByUsernameAndPassword(SignInFormDto signInFormDto);
	public Employees selectById(int id);
	public int insert(SignUpFormDto signUpFormDto);
	public int update(SignUpFormDto signUpFormDto);
	public int selectByDepartment(SignUpFormDto signUpFormDto);
	public int changeMyInfo(UpdateInformationDto updateInformationDto);
}
