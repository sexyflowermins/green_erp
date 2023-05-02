package com.green.erp.repository.model;


import lombok.Data;

@Data
public class SalaryHistory {
	private Integer id; // 아이디 
	private String name; // 이름 
	private String grade; // 직급 
	private Integer salaryId; // 호봉
	private String evaluation; // 평가 
	private String toyear; // 년도 
	private Integer performancePay; // 성과급 
	private Integer lastYearSalary;
	private Integer thisYearPfPay; // 올해 성과급 
	private Integer thisYearSalary; // 올해 연봉
}
