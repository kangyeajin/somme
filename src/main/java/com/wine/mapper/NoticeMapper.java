package com.wine.mapper;

import java.util.List;

import com.wine.model.Criteria;
import com.wine.model.NoticeVO;
import com.wine.model.ReviewVO;
import com.wine.model.prodCriteria;

public interface NoticeMapper {

	public List<NoticeVO> getListA(prodCriteria cri);
	public List<NoticeVO> getListWithPaging(Criteria cri);
	public NoticeVO getDetail(Long noticeno);
	public void readCount(Long noticeno);
	public void insert(NoticeVO nVo);
	public int delete(Long noticeno);
	public int update(NoticeVO nVo);
	public int pageTotal(Criteria cri);
	public int pageTotalA(prodCriteria cri);
	public NoticeVO getPagePrev(Long noticeno);
	public NoticeVO getPageNext(Long noticeno);
	
	public void insertSelectKey(NoticeVO nVo);
}
