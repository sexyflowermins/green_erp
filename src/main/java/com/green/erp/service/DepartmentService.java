package com.green.erp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.erp.repository.DepartmentRepository;
import com.green.erp.repository.model.Department;
import com.green.erp.repository.model.Notice;

@Service
public class DepartmentService {
	
	@Autowired
	private DepartmentRepository departmentRepository;
	
	public Department findById(int id) {

		Department department = departmentRepository.findById(id);
		if (department == null) {
			System.out.println("실패");
		}

		return department;
	}
	
}
