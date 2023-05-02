package com.green.erp.repository.model;

import java.time.Year;

import lombok.Data;

@Data
public class MySalary {
	
	private Integer id;
	private String name;
	private Year toyear1;
	private String evaluation;
	private int rate;
	private Integer lastYearSalary;
	private Integer bonus;
	private Integer thisYearSalary;
	
	
}
