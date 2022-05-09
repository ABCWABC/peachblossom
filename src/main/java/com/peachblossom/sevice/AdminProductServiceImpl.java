package com.peachblossom.sevice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peachblossom.domain.CategoryVO;
import com.peachblossom.domain.Criteria;
import com.peachblossom.domain.ProductVO;
import com.peachblossom.mapper.AdminProductMapper;

import lombok.Setter;

@Service
public class AdminProductServiceImpl implements AdminProductService {
	
	@Setter(onMethod_ = @Autowired)
	private AdminProductMapper mapper;

	/** 관리자 페이지에서 제품을 등록한다. */
	@Override
	public int product_insert(ProductVO vo) throws Exception {
		return mapper.product_insert(vo);
	}

	/** 관리자 페이지에서 1차카테고리를 가져온다. */
	@Override
	public List<CategoryVO> mainCategory() throws Exception {
		return mapper.mainCategory();
	}

	/** 관리자 페이지에서 2차카테고리를 가져온다. */
	@Override
	public List<CategoryVO> subCategory(Integer cate_code) throws Exception {
		return mapper.subCategory(cate_code);
	}

	/** 관리자 페이지에서 제품리스트를 가져온다. */
	@Override
	public List<ProductVO> getListWithPaging(Criteria cri) throws Exception {
		return mapper.getListWithPaging(cri);
	}

	/** 관리자 페이지에서 제품리스트 총갯수를 계산한다. */
	@Override
	public int getTotalCount(Criteria cri) throws Exception {
		return mapper.getTotalCount(cri);
	}

	/** 관리자 페이지에서 제품수정페이지를 가져온다. */
	@Override
	public ProductVO product_modify(Integer pro_num) throws Exception {
		return mapper.product_modify(pro_num);
	}

	/** 관리자 페이지에서 등록한 제품을 수정한다. */
	@Override
	public int product_modifyOk(ProductVO vo) throws Exception {
		return mapper.product_modifyOk(vo);
	}

	/** 관리자 페이지에서 등록한 제품을 삭제한다. */
	@Override
	public int product_delete(Integer pro_num) throws Exception {
		return mapper.product_delete(pro_num);
	}

}
