package com.green.erp.repository;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ScheduleRepository {
   
   public int insert();
   public int updateById();
   public int deleteById();
   
}