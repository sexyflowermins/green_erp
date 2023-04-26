package com.green.erp.dto;

import lombok.Data;

@Data
public class SignUpFormDto {
	
	private Integer id;
	private String name;
	private String email;
	private Integer age;
	private String address;
	// 입사일
	private String hireDate;
	// 부서명
	private int department;
	// 직급
	private int grade;
}
