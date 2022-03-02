package com.peachblossom.sevice;

import java.util.List;

import org.springframework.stereotype.Service;

import com.peachblossom.domain.CategoryVO;
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

}
