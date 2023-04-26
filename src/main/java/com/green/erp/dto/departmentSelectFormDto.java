package com.green.erp.dto;

import lombok.Data;

@Data
public class departmentSelectFormDto {

	private Integer id;
	private String name;
	private String email;
	private Integer age;
	private String address;
	// 입사일
	private String hireDate;
	// 부서명
	private String department;
	// 직급
	private String grade;
	
}
