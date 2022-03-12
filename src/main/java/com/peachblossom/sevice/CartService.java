package com.peachblossom.sevice;

import java.util.List;

import com.peachblossom.domain.CartListVO;
import com.peachblossom.domain.CartVO;

public interface CartService {
	
	public void cartAdd(CartVO vo);
	
	public List<CartListVO> cartList(String mb_id);
	
	public void cartDel(Integer cart_code);
	
	public void cartAllDel(String mb_id);

}
