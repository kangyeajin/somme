package com.wine.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wine.mapper.OrderMapper;
import com.wine.model.CartVO;
import com.wine.model.OrderVO;
import com.wine.model.prodCriteria;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper mapper;
	

	@Override
	public Integer MaxOrderNo() {
		return mapper.MaxOrderNo();
	}
	
	@Override
	public void insertPayment(String userid) {
		mapper.insertPayment(userid);
	}
	
	@Override
	public void insertOrderDetail(CartVO cVo) {
		mapper.insertOrderDetail(cVo);
	}

	@Override
	public void cartResult2(int cartno) {
		mapper.cartResult2(cartno);
	}
	
	@Override
	public ArrayList<Integer> ordernoList(String id) {
		return mapper.ordernoList(id);
	}
	@Override
	public ArrayList<Integer> orderOKnoList(String id) {
		return mapper.orderOKnoList(id);
	}
	
	@Override
	public ArrayList<OrderVO> listOrderById(OrderVO ordervo){
		return mapper.listOrderById(ordervo);
	}
	
	@Override
	public ArrayList<OrderVO> listOrderResult12(OrderVO ordervo) {
		return mapper.listOrderResult12(ordervo);
	}
	
	@Override
	public ArrayList<OrderVO> listOrderResult34(OrderVO ordervo) {
		return mapper.listOrderResult34(ordervo);
	}
	
	@Override
	public ArrayList<Integer> ordercancelList(String id) {
		return mapper.ordercancelList(id);
	}

	@Override
	public ArrayList<Integer> ordercancelOKList(String id) {
		return mapper.ordercancelOKList(id);
	}

	@Override
	public ArrayList<OrderVO> listOrder(prodCriteria cri) {
		return mapper.listOrder(cri);
	}
	
	@Override
	public void updateOrderResult(String detailno) {
		mapper.updateOrderResult(detailno);
	}

	@Override
	public void orderdelete(OrderVO ordervo) {
		mapper.orderdelete(ordervo);
	}

	@Override
	public void updateCancelResult(int orderno) {
		mapper.updateCancelResult(orderno);
	}

	@Override
	public void updateCancelOKResult(String detailno) {
		mapper.updateCancelOKResult(detailno);
	}

	@Override
	public ArrayList<OrderVO> cancellistOrder(prodCriteria cri) {
		return mapper.cancellistOrder(cri);
	}

	@Override
	public int getTotalCount(prodCriteria cri) {
		return mapper.getTotalCount(cri);
	}

	@Override
	public int getCancelTotalCount(prodCriteria cri) {
		return mapper.getCancelTotalCount(cri);
	}


}
