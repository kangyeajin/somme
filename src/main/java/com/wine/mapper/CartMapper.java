package com.wine.mapper;

import java.util.List;

import com.wine.model.CartVO;

public interface CartMapper {
	// 회원 아이디로 전체 제품목록 얻어오기 ok
	public List<CartVO> selectCartByuserid(String userid);
	
	// 회원 아이디로 payment가 진행 된(result가 2인) 제품 목록 가져오기 ok
	public List<CartVO> selectPaymentByuserid(String userid);
	
	// 회원 아이디로 check된(result가 3인) 제품 목록 가져오기 ok
	//public List<CartVO> selectResult3Byuserid(String userid);
	
	// 회원 아이디로 check된(cartno에 맞는) 제품 목록 가져오기
	public CartVO selectcheckList(String cartno);
	
	//전체 cart 조회 ok
	public List<CartVO> selectCartAll();
	
	//insert ok
	public int addCart(CartVO cVo);
	
	/* 카트 삭제 ok*/
	public int deleteCart(int cartno);
	
	/* 전체 카트 삭제 */
	public int deleteAllCart(String userid);
	
	/* 카트 수량 수정 ok*/
	public int modifyCount(CartVO cart);

	/* 체크한 장바구니 번호의 result값 3으로 수정 ok*/
	public int modifyCountANDResult(int cartno);
	
	//-----다중 삭제 ok
	//public void multiDelete(String cartno);
	
	// 회원 아이디로 배송정보 얻어오기 ok
	public List<CartVO> selectAddrByuserid(String userid);
	
	//------------------------------------------------------
	
	/* 카트 확인 - 회원정보와 상품 정보를 넘겨서 해당하는 row가 있는지 확인
	 * 한가지 자료형밖에 처리 할 수 없음 뭉쳐서 던져줘야 함 String userid, String prodno */
	public CartVO checkCart(CartVO cart);

	//주문 확인 (구매한 상품만 상품평 작성 가능)
	public CartVO checkPayment(CartVO cart);
	
	//detail페이지에서 기존 수량에 수량 추가 int no, String newNo, int cartno ok
	public int updateCart(CartVO cart);

	//------------------------------------------------------
	
	public CartVO sumPrice(String userid);
	
	/* 주문 테이블로 넘어간 카트 삭제 */
	public int deleteCartbyuserid(String userid);
	
}
