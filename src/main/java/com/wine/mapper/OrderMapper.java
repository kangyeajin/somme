package com.wine.mapper;

import java.util.ArrayList;

import com.wine.model.CartVO;
import com.wine.model.OrderVO;
import com.wine.model.prodCriteria;

public interface OrderMapper {

	//주문번호 생성하기  int로 null을 받을 수 없음 Integer사용
	public Integer MaxOrderNo();
	
	//payment에 주문 추가
	public void insertPayment(String userid);

	//order_detail 주문 상세 입력
	public void insertOrderDetail(CartVO cVo);
	
	//장바구니에서 주문 진행된 값 체크
	public void cartResult2(int cartno);
	
	// 현재 진행 중인 주문 내역만 조회
	public ArrayList<Integer> ordernoList(String id);
	
	// 진행완료된 주문 내역만 조회
	public ArrayList<Integer> orderOKnoList(String id);
	
	// 현재 진행 중인 반품 내역만 조회
	public ArrayList<Integer> ordercancelList(String id);
	
	// 반품완료된 주문 내역만 조회
	public ArrayList<Integer> ordercancelOKList(String id);
	
	// 사용자가 주문 내역 검색
	public ArrayList<OrderVO> listOrderById(OrderVO ordervo);
	
	// result가 1이거나 2인 상품 조회
	public ArrayList<OrderVO> listOrderResult12(OrderVO ordervo);
	
	// result가 3이거나 4인 상품 조회
	public ArrayList<OrderVO> listOrderResult34(OrderVO ordervo);
	
	
	/* 관리자 모드에서 사용되는 메소드 -------------------------------------------------- */
	// 주문 관련 메소드 ---------------------------------------------------------------
	
	// 주문자 이름으로 주문 리스트 검색(result가 1이나 2)
	public ArrayList<OrderVO> listOrder(prodCriteria cri);
	
	//주문 상태 변경(주문처리완료 result를 2로 )
	public void updateOrderResult(String detailno);
	
	/* 주문취소 */
	public int orderdelete(OrderVO ordervo);
	
    // 반품 관련 메소드 ---------------------------------------------------------------
	
	/* 반품신청(result 3)*/
	public void updateCancelResult(int orderno);
	
	/* 반품신청 처리 완료(result 4) - 관리자*/
	public void updateCancelOKResult(String detailno);
	
	// 반품자 이름으로 주문 리스트 검색(result가 3이나 4)
	public ArrayList<OrderVO> cancellistOrder(prodCriteria cri);

	//주문 레코드 갯수
	public int getTotalCount(prodCriteria cri);
	
	//반품 레코드 갯수
	public int getCancelTotalCount(prodCriteria cri);
	
	//검색 - map중첩사용; Map<key,value>
	// public List<OrderVO> searchTest(Map<String, Map<String,String>> map);
}
