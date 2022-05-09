package com.peachblossom.mapper;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.peachblossom.domain.CartListVO;
import com.peachblossom.domain.CartVO;

public interface CartMapper {
	
	/** 장바구니에 추가한다. */
	public void cartAdd(CartVO vo) throws Exception;
	
	/** 장바구니 리스트를 가져온다. */
	public List<CartListVO> cartList(String mb_id) throws Exception;
	
	/** 장바구니 리스트를 전체 삭제한다. */
	public void cartDel(Integer cart_code) throws Exception;
	
	/** 장바구니 리스트를 선택 삭제한다. */
	public void cartAllDel(String mb_id) throws Exception;

	/** 장바구니 수량을 변경한다. */
	public void cartAmountModify(CartVO vo) throws Exception;
}
