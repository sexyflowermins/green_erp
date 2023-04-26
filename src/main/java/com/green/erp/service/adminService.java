package com.green.erp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.erp.repository.adminRepository;
import com.green.erp.repository.model.Employees;

@Service
public class adminService {

	@Autowired
	adminRepository adminRepository;

	
	public List<Employees> findAllDepartment(){
		List<Employees> list = adminRepository.findAll();
		return list;
	}
	
		public List<Employees> findByDepartment(String department){
			department = "%"+department+"%";
			List<Employees> list = adminRepository.findByDepartment(department);
			
			System.out.println(department);
			return list;
		}
		public List<Employees> selectDepartment(){
			//department = "%"+department+"%";
			List<Employees> list = adminRepository.findAll();
			return list;
		}
}
