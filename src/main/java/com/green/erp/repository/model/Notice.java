package com.green.erp.repository.model;

import lombok.Data;

@Data
public class Notice {
	private Integer id;
	private Integer empId;
	private String title;
	private String content;
	private String dateTime;
}
