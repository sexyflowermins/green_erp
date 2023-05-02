package com.green.erp.dto;

import lombok.Data;

@Data
public class BoardReplyFormDto {
	private Integer id;
	private Integer empId;
	private Integer boardId;
	private String content;
}
