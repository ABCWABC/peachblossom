package com.peachblossom.sevice;

import java.util.List;

import org.springframework.stereotype.Service;

import com.peachblossom.domain.CategoryVO;
import com.peachblossom.domain.Criteria;
import com.peachblossom.domain.ProductVO;
import com.peachblossom.mapper.UserProductMapper;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class UserProductServiceImpl implements UserProductService {
	
	private UserProductMapper mapper;

	/** 1차카테고리를 출력한다. */
	@Override
	public List<CategoryVO> mainCategory() throws Exception {
		return mapper.mainCategory();
	}

	/** 1차카테고리 선택시 2차카테고리를 출력한다. */
	@Override
	public List<CategoryVO> subCategory(Integer cate_code) throws Exception {
		return mapper.subCategory(cate_code);
	}

	/** 제품 2차카테고리페이지를 출력한다. - 카테고리 선택시 */
	@Override
	public List<ProductVO> getListWithPaging(Integer cate_code, Criteria cri) throws Exception {
		return mapper.getListWithPaging(cate_code, cri);
	}
	
	/** 제품 2차카테고리페이지를 출력한다. - 카테고리 선택시 */
	@Override
	public List<ProductVO> getListWithPagingSearch(Criteria cri) throws Exception {
		return mapper.getListWithPagingSearch(cri);
	}
	
	/** 제품 2차카테고리페이지의 총 갯수를 계산한다. - 카테고리 선택시 */
	@Override
	public int getTotalCountSearch(Criteria cri) throws Exception {
		return mapper.getTotalCountSearch(cri);
	}

	/** 제품 2차카테고리페이지의 총 갯수를 계산한다. - 검색시 */
	@Override
	public int getTotalCount(Integer cate_code) throws Exception {
		return mapper.getTotalCount(cate_code);
	}

	/** 제품 상세페이지를 출력한다. */
	@Override
	public ProductVO productDetail(Integer pro_num) throws Exception {
		return mapper.productDetail(pro_num);
	}

	/** 제품 2차카테고리페이지를 출력한다. - 사용X */
	@Override
	public List<ProductVO> productListByCategory(Integer cate_code) throws Exception {
		return mapper.productListByCategory(cate_code);
	}

	/** 메인페이지에서 신상품 부문을 출력한다. */
	@Override
	public List<ProductVO> productNewList() throws Exception {
		return mapper.productNewList();
	}

	/** 메인페이지에서 베스트 부문을 출력한다. */
	@Override
	public List<ProductVO> productBestList() throws Exception {
		return mapper.productBestList();
	}

}
