package com.green.erp.repository;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserRepository {

	int insert();
	
}	
