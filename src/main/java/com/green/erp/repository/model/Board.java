package com.green.erp.repository.model;

import lombok.Data;

@Data
public class Board {
	private Integer id;
	private Integer empId;
	private Integer views;
	private Integer category;
	private String title;
	private String content;
	private String dateTime;
	private String employeesName;
	private String categoryName; 
}
