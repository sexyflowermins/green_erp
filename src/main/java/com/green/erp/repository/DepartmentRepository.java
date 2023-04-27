package com.green.erp.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.erp.repository.model.Department;

@Mapper
public interface DepartmentRepository {
	public Department findById(int id);
}
