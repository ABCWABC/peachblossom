package com.peachblossom.mapper;

import java.util.List;

import com.peachblossom.domain.CategoryVO;
import com.peachblossom.domain.Criteria;
import com.peachblossom.domain.ProductVO;

public interface AdminProductMapper {

	public int product_insert(ProductVO vo);
	
	public List<CategoryVO> mainCategory();
	
	public List<CategoryVO> subCategory(Integer cate_code);
	
	public List<ProductVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	public ProductVO product_modify(Integer pro_num);
	
	public int product_modifyOk(ProductVO vo);
	
	public int product_delete(Integer pro_num);
	
}
