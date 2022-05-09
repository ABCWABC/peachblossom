package com.peachblossom.sevice;

import java.util.List;

import com.peachblossom.domain.CategoryVO;
import com.peachblossom.domain.Criteria;
import com.peachblossom.domain.ProductVO;

public interface UserProductService {
	
	/** 1차카테고리를 출력한다. */
	public List<CategoryVO> mainCategory() throws Exception;
	
	/** 1차카테고리 선택시 2차카테고리를 출력한다. */
	public List<CategoryVO> subCategory(Integer cate_code) throws Exception;
	
	/** 제품 2차카테고리페이지를 출력한다. - 카테고리 선택시 */
	public List<ProductVO> getListWithPaging(Integer cate_code, Criteria cri) throws Exception;
	
	/** 제품 2차카테고리페이지를 출력한다. - 검색시 */
	public List<ProductVO> getListWithPagingSearch(Criteria cri) throws Exception;
	
	/** 제품 2차카테고리페이지의 총 갯수를 계산한다. - 카테고리 선택시 */
	public int getTotalCount(Integer cate_code) throws Exception;
	
	/** 제품 2차카테고리페이지의 총 갯수를 계산한다. - 검색시 */
	public int getTotalCountSearch(Criteria cri) throws Exception;
	
	/** 제품 상세페이지를 출력한다. */
	public ProductVO productDetail(Integer pro_num) throws Exception;
	
	/** 제품 2차카테고리페이지를 출력한다. - 사용X */
	public List<ProductVO> productListByCategory(Integer cate_code) throws Exception;
	
	/** 메인페이지에서 신상품 부문을 출력한다. */
	public List<ProductVO> productNewList() throws Exception;
	
	/** 메인페이지에서 베스트 부문을 출력한다. */
	public List<ProductVO> productBestList() throws Exception;
}
