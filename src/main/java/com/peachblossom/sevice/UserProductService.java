package com.peachblossom.sevice;

import java.util.List;

import com.peachblossom.domain.CategoryVO;
import com.peachblossom.domain.Criteria;
import com.peachblossom.domain.ProductVO;

public interface UserProductService {
	
	public List<CategoryVO> mainCategory();
	
	public List<CategoryVO> subCategory(Integer cate_code);
	
	public List<ProductVO> getListWithPaging(Integer cate_code, Criteria cri);
	
	public int getTotalCount(Integer cate_code);
	
}
