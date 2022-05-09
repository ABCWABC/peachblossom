package com.peachblossom.sevice;

import java.util.List;

import com.peachblossom.domain.CategoryVO;
import com.peachblossom.domain.Criteria;
import com.peachblossom.domain.ProductVO;

public interface AdminProductService {
	
	/** 관리자 페이지에서 제품을 등록한다. */
	public int product_insert(ProductVO vo) throws Exception;
	
	/** 관리자 페이지에서 1차카테고리를 가져온다. */
	public List<CategoryVO> mainCategory() throws Exception;
	
	/** 관리자 페이지에서 2차카테고리를 가져온다. */
	public List<CategoryVO> subCategory(Integer cate_code) throws Exception;
	
	/** 관리자 페이지에서 제품리스트를 가져온다. */
	public List<ProductVO> getListWithPaging(Criteria cri) throws Exception;
	
	/** 관리자 페이지에서 제품리스트 총갯수를 계산한다. */
	public int getTotalCount(Criteria cri) throws Exception;
	
	/** 관리자 페이지에서 제품수정페이지를 가져온다. */
	public ProductVO product_modify(Integer pro_num) throws Exception;
	
	/** 관리자 페이지에서 등록한 제품을 수정한다. */
	public int product_modifyOk(ProductVO vo) throws Exception;
	
	/** 관리자 페이지에서 등록한 제품을 삭제한다. */
	public int product_delete(Integer pro_num) throws Exception;

}
