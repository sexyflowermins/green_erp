package com.green.erp.repository.model;

import lombok.Data;

@Data
public class Schedule {
    private Integer id;
    private Integer emp_id;
    private String title;
    private String content;
    private String startDate;
    private String endDate;
}