package com.green.erp.dto;

import lombok.Data;

@Data
public class ScheduleDto {
   private int id;
   private int empId;
   private String title;
   private String content;
   private String startDate;
   private String endDate;
}