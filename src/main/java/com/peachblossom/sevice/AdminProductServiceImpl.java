package com.peachblossom.sevice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.peachblossom.domain.CategoryVO;
import com.peachblossom.domain.Criteria;
import com.peachblossom.domain.ProductVO;
import com.peachblossom.mapper.AdminProductMapper;

import lombok.Setter;

public class AdminProductServiceImpl implements AdminProductService {
	
	@Setter(onMethod_ = @Autowired)
	private AdminProductMapper mapper;

	@Override
	public int product_insert(ProductVO vo) {
		return mapper.product_insert(vo);
	}

	@Override
	public List<CategoryVO> mainCategory() {
		return mapper.mainCategory();
	}

	@Override
	public List<CategoryVO> subCategory(Integer cate_code) {
		return mapper.subCategory(cate_code);
	}

	@Override
	public List<ProductVO> getListWithPaging(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

	@Override
	public ProductVO product_modify(Integer pro_num) {
		return mapper.product_modify(pro_num);
	}

	@Override
	public int product_modifyOk(ProductVO vo) {
		return mapper.product_modifyOk(vo);
	}

}
