package com.green.erp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.green.erp.dto.DepartmentCountDto;
import com.green.erp.dto.GradeCountDto;
import com.green.erp.dto.RatingDto;
import com.green.erp.dto.SalaryDto;
import com.green.erp.dto.SalaryHistoryDto;
import com.green.erp.repository.DepartmentRepository;
import com.green.erp.repository.adminRepository;
import com.green.erp.repository.model.Department;
import com.green.erp.repository.model.Employees;
import com.green.erp.repository.model.Grade;
import com.green.erp.repository.model.WorkTime;

@Service
public class adminService {

	@Autowired
	adminRepository adminRepository;
	@Autowired
	DepartmentRepository departmentRepository;

	// 부서 전체 목록조회
	@Transactional
	public List<Department> findAllDepartment() {
		List<Department> list = departmentRepository.findAll();
		return list;
	}

	// 부서 선택 조회
	@Transactional
	public List<Department> findByDepartment(String name) {
		name = "%" + name + "%";
		List<Department> list = departmentRepository.findByDepartment(name);
		return list;

	}

	// 사원 목록 조회
	@Transactional
	public List<Employees> selectDepartment(Employees employees) {
		List<Employees> list = adminRepository.findByEmployees(employees);
		return list;
	}
	@Transactional
	public List<Grade> serchGrade(){
		List<Grade> list = adminRepository.serchGrade();
		return list;
	}

	// 개인정보 조회
	@Transactional
	public Employees selectByEmplyees(Integer id) {
		Employees employeesEntity = adminRepository.findById(id);
		return employeesEntity;
	}

	// 개인정보 수정
	@Transactional
	public int updateemployees(Employees employees) {
		int result = adminRepository.updateemployees(employees);
		return result;
	}
@Transactional
public int insertSalaryHistory(SalaryHistoryDto salaryHistoryDto) {
	int result = adminRepository.insertSalaryHistory(salaryHistoryDto);
	return result;
}
	// 사원 모든 정보 삭제
	// 
	@Transactional
	public int deleteEmpoyees(Integer id) {
		
		int resultRowcount = adminRepository.deleteEmpoyees(id);
		return resultRowcount;
	}
	public WorkTime selectWorkTime(Integer empId) {
        WorkTime workTimeEntity = adminRepository.selectWorkTime(empId);
        return workTimeEntity;
    }

	@Transactional
	public List<SalaryDto> selectSalary( ) {
		List<SalaryDto> list = adminRepository.selectSalary();
		return list;		
	}
	@Transactional
	public List<RatingDto> selectRating(){
		List<RatingDto> list  = adminRepository.selectRating();
		return list;
	}
	
	@Transactional
	public List<DepartmentCountDto>  findByDepartment1(){
		
		List<DepartmentCountDto> departmentList = adminRepository.departmentList();
		return departmentList;
	}
	@Transactional 
	public List<GradeCountDto> gradeCount(){
		List<GradeCountDto> gradecount = adminRepository.gradeCount();
		return gradecount;
	}
		
	}
	

