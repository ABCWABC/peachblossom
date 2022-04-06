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

	@Override
	public void cartAdd(CartVO vo) {
		mapper.cartAdd(vo);
	}

	@Override
	public List<CartListVO> cartList(String mb_id) {
		return mapper.cartList(mb_id);
	}

	@Override
	public void cartDel(Integer cart_code) {
		mapper.cartDel(cart_code);
	}

	@Override
	public void cartAllDel(String mb_id) {
		mapper.cartAllDel(mb_id);
	}

	@Override
	public void cartAmountModify(CartVO vo) {
		mapper.cartAmountModify(vo);
	}
}
