package com.peachblossom.sevice;

import java.util.List;

import com.peachblossom.domain.CategoryVO;
import com.peachblossom.domain.Criteria;
import com.peachblossom.domain.ProductVO;

public interface AdminProductService {
	
	public int product_insert(ProductVO vo);
	
	public List<CategoryVO> mainCategory();
	
	public List<CategoryVO> subCategory(Integer cate_code);
	
	public List<ProductVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	public ProductVO product_modify(Integer pro_num);
	
	public int product_modifyOk(ProductVO vo);

}
