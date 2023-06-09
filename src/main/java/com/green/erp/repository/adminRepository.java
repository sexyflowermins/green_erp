package com.green.erp.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.erp.dto.DepartmentCountDto;
import com.green.erp.dto.GradeCountDto;
import com.green.erp.dto.RatingDto;
import com.green.erp.dto.SalaryDto;
import com.green.erp.dto.SalaryHistoryDto;
import com.green.erp.repository.model.Department;
import com.green.erp.repository.model.Employees;
import com.green.erp.repository.model.Grade;
import com.green.erp.repository.model.MySalary;
import com.green.erp.repository.model.SalaryHistory;
import com.green.erp.repository.model.WorkTime;

@Mapper
public interface adminRepository {

	

	public List<Employees> findByEmployees(Employees employees);
	// 개인정보 조회
	public Employees findById(Integer id);
	
	public int updateemployees(Employees employees);
	public int insertSalaryHistory(SalaryHistoryDto salaryHistoryDto );
	public List<Grade> serchGrade();

	public int deleteworkTime(Integer id);
	public int deleteNotice(Integer id);
	public int deleteSchedule(Integer id);
	public int deleteBoard(Integer id);
	public int deleteEmpoyees(Integer id);
	public List<SalaryDto> selectSalary();
	public List<RatingDto> selectRating();
	public List<DepartmentCountDto> departmentList();
	public List<GradeCountDto> gradeCount();
	public List<WorkTime> selectWorkTime(Integer empId);
	public List<SalaryHistory> selectSalaryHistory(Integer id);
	public int updateImage(Employees employees);
}
