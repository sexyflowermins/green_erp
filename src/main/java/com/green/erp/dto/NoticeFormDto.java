package com.green.erp.dto;

import lombok.Data;

@Data
public class NoticeFormDto {
	private Integer empId; 
	private String title;
	private String content;
	private String dateTime;
}
