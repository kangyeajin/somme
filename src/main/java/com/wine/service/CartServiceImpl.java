package com.wine.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wine.mapper.CartMapper;
import com.wine.model.CartVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class CartServiceImpl implements CartService {
	
	@Setter(onMethod_ = {@Autowired})
	private CartMapper mapper;
	
	@Override
	public List<CartVO> cartList(String userid) {
		return mapper.selectCartByuserid(userid);
	}

	@Override
	public List<CartVO> PaymentList(String userid) {
		return mapper.selectPaymentByuserid(userid);
	}

	@Override
	public CartVO selectcheckList(String cartno) {
		return mapper.selectcheckList(cartno);
	}
	
	@Override
	public boolean addCart(CartVO cVo) {
		return mapper.addCart(cVo) == 1 ;
	}

	@Override
	public boolean deleteCart(int cartno) {
		return mapper.deleteCart(cartno) == 1 ;
	}

	@Override
	public boolean deleteAllCart(String userid) {
		return mapper.deleteAllCart(userid) == 1 ;
	}

	@Override
	public boolean modifyCount(CartVO cart) {
		return mapper.modifyCount(cart) == 1 ;
	}

	@Override
	public boolean modifyResult(int cartno) {
		return mapper.modifyCountANDResult(cartno) == 1;
	}

	@Override
	public List<CartVO> AddrList(String userid) {
		return mapper.selectAddrByuserid(userid);
	}

	@Override
	public CartVO checkCart(CartVO cart) {
		return mapper.checkCart(cart);
	}

	@Override
	public void updateCart(CartVO cart) {
		mapper.updateCart(cart);
	}

	@Override
	public void deleteCartbyuserid(String userid) {
		mapper.deleteCartbyuserid(userid);
	}

	@Override
	public CartVO sumPrice(String userid) {
		return mapper.sumPrice(userid);
	}

	@Override
	public List<CartVO> CartListAll() {
		return mapper.selectCartAll();
				
	}

	@Override
	public CartVO checkPayment(CartVO cart) {
		return mapper.checkPayment(cart);
	}



}
