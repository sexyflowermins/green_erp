package com.green.erp.repository.model;

import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;

import lombok.Data;

@Data
public class WorkTime {
	
	private Integer id;
	private Integer empId;
	private Time startTime;
	private Time endTime;
	private Date today;
	

}
