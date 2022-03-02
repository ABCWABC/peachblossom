package com.peachblossom.mapper;

import java.util.List;

import com.peachblossom.domain.CategoryVO;

public interface UserProductMapper {

	public List<CategoryVO> mainCategory();
	
	public List<CategoryVO> subCategory(Integer cate_code);
	
}
