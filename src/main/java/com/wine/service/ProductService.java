package com.wine.service;

import java.util.ArrayList;
import java.util.List;

import com.wine.model.ProductVO;
import com.wine.model.prodCriteria;

public interface ProductService {

	//상품 전체 출력 ok
	public List<ProductVO> selectAllProducts();
	
	// 상품번호로 상품 정보 한개 얻어오기 ok
	public ProductVO selectProductByCode(String prodno);
	
	//상품 종류별 리스트 얻어오기 kind 
	public ArrayList<ProductVO> listKindProduct(String kind);
	
	//상품 종류별 리스트 얻어오기kind_con 
	public ArrayList<ProductVO> listKind_conProduct(String kind);
	
	//상품 이름으로 검색 조회
	public ArrayList<ProductVO> listProductSearch(String search);
	
	//---------관리자 모드에서 사용되는 메소드--------------
	
	//main에서 사용되는 상품 출력 ok
	public List<ProductVO> selectMainProducts();
	
	public void insertProduct(ProductVO pVo);
	
    public void deleteProduct(String code);
    
    public boolean updateProduct(ProductVO productVO);
    
    public boolean multiDelete(String prodno);
    
  //전체 레코드 갯수
  	public int getTotal(prodCriteria cri);
      
  	public List<ProductVO> adminProdPaging(prodCriteria cri);

    
}
