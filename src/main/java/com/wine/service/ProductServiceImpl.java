package com.wine.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wine.mapper.ProductMapper;
import com.wine.model.ProductVO;
import com.wine.model.prodCriteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ProductServiceImpl implements ProductService {

	@Setter(onMethod_ = {@Autowired})
	private ProductMapper mapper;
	
	@Override
	public List<ProductVO> selectAllProducts() {
		log.info("****selectAllProducts.....");
		List<ProductVO> list = mapper.selectAllProducts();
		return list;
	}

	@Override
	public ProductVO selectProductByCode(String prodno) {
		log.info("****selectProductByCode.....");
		ProductVO prodVO = mapper.selectProductByCode(prodno);
		return prodVO;
	}
	
	@Override
	public List<ProductVO> selectMainProducts() {
		log.info("****selectMainProducts.....");
		List<ProductVO> list = mapper.selectMainProducts();
		return list;
	}

	@Override
	public ArrayList<ProductVO> listKindProduct(String kind) {
		log.info("****listKindProduct.....");
		ArrayList<ProductVO> list = mapper.listKindProduct(kind);
		return list;
	}

	@Override
	public ArrayList<ProductVO> listKind_conProduct(String kind) {
		log.info("****listKind_conProduct.....");
		ArrayList<ProductVO> list = mapper.listKind_conProduct(kind);
		return list;
	}

	@Override
	public ArrayList<ProductVO> listProductSearch(String search) {
		ArrayList<ProductVO> list = mapper.listProductSearch(search);
		return list;
	}

	@Override
	public void insertProduct(ProductVO pVo) {
		log.info("등록 :" + pVo);
		mapper.insertProduct(pVo);
	}

	@Override
	public void deleteProduct(String code) {
		log.info("삭제: " + code);
		mapper.deleteProduct(code);
	}

	@Override
	public boolean updateProduct(ProductVO productVO) {
		log.info("수정");
		return mapper.updateProduct(productVO) == 1;
	}

	@Override
	public boolean multiDelete(String prodno) {
		log.info("다중삭제:" + prodno);
		return mapper.multiDelete(prodno) == 1;

	}
	
	@Override
	public List<ProductVO> adminProdPaging(prodCriteria cri) {
		log.info("criteria: " + cri);
		return mapper.adminProdPage(cri);
	}
	
	@Override
	public int getTotal(prodCriteria cri) {
		return mapper.getTotalCount(cri);
	}

}
