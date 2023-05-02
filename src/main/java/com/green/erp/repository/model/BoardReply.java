package com.green.erp.repository.model;

import lombok.Data;

@Data
public class BoardReply {

	private Integer id;
	private Integer empId;
	private Integer boardId;
	private String content;
	private String employeesName;
}
