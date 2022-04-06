package com.peachblossom.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.peachblossom.domain.CategoryVO;
import com.peachblossom.domain.Criteria;
import com.peachblossom.domain.ProductVO;

public interface UserProductMapper {

	public List<CategoryVO> mainCategory();
	
	public List<CategoryVO> subCategory(Integer cate_code);
	
	public List<ProductVO> getListWithPaging(@Param("cate_code") Integer cate_code, @Param("cri") Criteria cri);
	
	public int getTotalCount(Integer cate_code);
	
	public ProductVO productDetail(Integer pro_num);
	
	public List<ProductVO> productListByCategory(Integer cate_code);
	
	public List<ProductVO> productNewList();
	
	public List<ProductVO> productBestList();
}
