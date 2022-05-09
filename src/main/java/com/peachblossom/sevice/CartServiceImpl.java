package com.peachblossom.sevice;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.peachblossom.domain.CartListVO;
import com.peachblossom.domain.CartVO;
import com.peachblossom.mapper.CartMapper;

@Service
public class CartServiceImpl implements CartService {
	
	@Inject
	private CartMapper mapper;

	/** 장바구니에 추가한다. */
	@Override
	public void cartAdd(CartVO vo) throws Exception {
		mapper.cartAdd(vo);
	}

	/** 장바구니 리스트를 가져온다. */
	@Override
	public List<CartListVO> cartList(String mb_id) throws Exception {
		return mapper.cartList(mb_id);
	}

	/** 장바구니 리스트를 전체 삭제한다. */
	@Override
	public void cartDel(Integer cart_code) throws Exception {
		mapper.cartDel(cart_code);
	}

	/** 장바구니 리스트를 선택 삭제한다. */
	@Override
	public void cartAllDel(String mb_id) throws Exception {
		mapper.cartAllDel(mb_id);
	}

	/** 장바구니 수량을 변경한다. */
	@Override
	public void cartAmountModify(CartVO vo) throws Exception {
		mapper.cartAmountModify(vo);
	}
}
