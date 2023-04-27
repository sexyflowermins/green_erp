package com.green.erp.repository.model;

import lombok.Data;

@Data
public class Schedule {
    private int id;
    private int emp_id;
    private String title;
    private String content;
    private String startDate;
    private String endDate;
}