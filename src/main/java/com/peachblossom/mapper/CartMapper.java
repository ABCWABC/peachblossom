package com.peachblossom.mapper;

import java.util.List;

import com.peachblossom.domain.CartListVO;
import com.peachblossom.domain.CartVO;

public interface CartMapper {
	
	public void cartAdd(CartVO vo);
	
	public List<CartListVO> cartList(String mb_id);
	
	public void cartDel(Integer cart_code);

}
