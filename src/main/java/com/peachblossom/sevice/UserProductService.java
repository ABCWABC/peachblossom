package com.peachblossom.sevice;

import java.util.List;

import com.peachblossom.domain.CategoryVO;

public interface UserProductService {
	
	public List<CategoryVO> mainCategory();
	
	public List<CategoryVO> subCategory(Integer cate_code);

}
