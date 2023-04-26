package com.green.erp.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.erp.dto.departmentSelectFormDto;
import com.green.erp.repository.model.Employees;

@Mapper
public interface adminRepository {

	
	public List<Employees> findAll();
	public List<Employees> findByDepartment(String department);
	
}
