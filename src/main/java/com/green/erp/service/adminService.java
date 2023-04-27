package com.green.erp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.erp.repository.adminRepository;
import com.green.erp.repository.model.Department;
import com.green.erp.repository.model.Employees;

@Service
public class adminService {

	@Autowired
	adminRepository adminRepository;

	// 부서 전체 목록조회
	public List<Department> findAllDepartment(){
		List<Department> list = adminRepository.findAll();
		return list;
	}
		//부서 선택 조회
		public List<Department> findByDepartment(String name){
			name = "%"+name+"%";
			List<Department> list = adminRepository.findByDepartment(name);
			return list;
			
		}
	//사원 목록 조회
		public List<Employees> selectDepartment(Employees employees){
			List<Employees> list = adminRepository.findByEmployees(employees);
			return list;
		}
		// 개인정보 조회
		public Employees selectByEmplyees(Integer id) {
			Employees employeesEntity = adminRepository.findById(id);
			return employeesEntity;
		}
		// 개인정보 수정
		public int updateemployees(Employees employees) {
			int result = adminRepository.updateemployees(employees);
			return result;
		}
		
		// 사원 모든 정보 삭제
		public int deleteEmpoyees(Integer id) {
			int result = adminRepository.deleteEmpoyees(id);
			return result;
		}
		
}
