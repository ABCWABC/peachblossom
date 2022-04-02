package com.peachblossom.mapper;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.peachblossom.domain.CartListVO;
import com.peachblossom.domain.CartVO;

public interface CartMapper {
	
	public void cartAdd(CartVO vo);
	
	public List<CartListVO> cartList(String mb_id);
	
	public void cartDel(Integer cart_code);
	
	public void cartAllDel(String mb_id);

	public void cartAmountModify(Integer pro_num, int cart_amount, String mb_id);
}
