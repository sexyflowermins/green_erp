package com.green.erp.dto;

import lombok.Data;

@Data
public class BoardFormDto {
	private Integer id;
	private Integer empId; 
	private Integer category;
	private String title;
	private String content;
	private String dateTime;
}
