package com.green.erp.repository.model;

import lombok.Data;

@Data
public class Employees {
	
	private Integer id;
	private String name;
	private String password;
	private String email;
	private Integer age;
	private String address;
	private String hireDate;
	private String resignDate;
	private Integer department;
	private Integer grade;
	private String uploadFileName;
	private String gname;
	private String dname;
	
}
