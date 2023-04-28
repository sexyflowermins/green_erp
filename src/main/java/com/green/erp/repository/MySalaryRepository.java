package com.green.erp.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.erp.repository.model.MySalary;

@Mapper
public interface MySalaryRepository {
	
	public List<MySalary> findByMySalary(Integer id);
	
}
