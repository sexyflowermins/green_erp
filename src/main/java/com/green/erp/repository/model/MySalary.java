package com.green.erp.repository.model;

import lombok.Data;

@Data
public class MySalary {
	
	private Integer id;
	private String name;
	private String toyear1;
	private String evaluation;
	private int rate;
	private Integer lastYearSalary;
	private Integer bonus;
	private Integer thisYearSalary;
	
}
