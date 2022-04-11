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

	@Override
	public List<CategoryVO> mainCategory() {
		return mapper.mainCategory();
	}

	@Override
	public List<CategoryVO> subCategory(Integer cate_code) {
		return mapper.subCategory(cate_code);
	}

	@Override
	public List<ProductVO> getListWithPaging(Integer cate_code, Criteria cri) {
		return mapper.getListWithPaging(cate_code, cri);
	}

	@Override
	public int getTotalCount(Integer cate_code) {
		return mapper.getTotalCount(cate_code);
	}

	@Override
	public ProductVO productDetail(Integer pro_num) {
		return mapper.productDetail(pro_num);
	}

	@Override
	public List<ProductVO> productListByCategory(Integer cate_code) {
		return mapper.productListByCategory(cate_code);
	}

	@Override
	public List<ProductVO> productNewList() {
		return mapper.productNewList();
	}

	@Override
	public List<ProductVO> productBestList() {
		return mapper.productBestList();
	}

	@Override
	public List<ProductVO> getListWithPagingSearch(Criteria cri) {
		return mapper.getListWithPagingSearch(cri);
	}

	@Override
	public int getTotalCountSearch(Criteria cri) {
		return mapper.getTotalCountSearch(cri);
	}

}
