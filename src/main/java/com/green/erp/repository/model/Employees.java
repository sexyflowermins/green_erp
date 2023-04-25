package com.green.erp.repository.model;

import lombok.Data;

@Data
public class Employees {
	
	private Integer id;
	private String password;
	private String email;
	private Integer age;
	private String address;
	private String hireDate;
	private String resignDate;
	private String department;
	private String grade;
	private String name;
}
