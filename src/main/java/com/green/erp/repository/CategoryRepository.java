package com.green.erp.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.erp.repository.model.Category;

@Mapper
public interface CategoryRepository {

	public List<Category> findCategoryCount();
	public List<Category> findCategoryAll();	
}
