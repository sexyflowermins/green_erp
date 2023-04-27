package com.green.erp.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.erp.repository.model.Department;
import com.green.erp.repository.model.Employees;

@Mapper
public interface adminRepository {

	
	public List<Department> findAll();
	public List<Department> findByDepartment(String name);
	public List<Employees> findByEmployees(Employees employees);
	public Employees findById(Integer id);
	public int updateemployees(Employees employees);
	public int deleteEmpoyees(Integer id);
	
}
