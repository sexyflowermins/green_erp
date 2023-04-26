package com.green.erp.dto;

import lombok.Data;

@Data
public class UpdateInformationDto {
	
	private Integer id;
	private String name;
	private String password;
	private String email;
	private Integer age;
	private String address;
}
