package com.wine.service;

import java.util.List;

import com.wine.model.AttachVO;
import com.wine.model.Criteria;
import com.wine.model.NoticeVO;
import com.wine.model.prodCriteria;

public interface NoticeService {
	public List<NoticeVO> getListA(prodCriteria cri);
	public int getTotalA(prodCriteria cri);
	//Criteria를 파라미터로 처리하도록 매개변수로 넣어줌
	public List<NoticeVO> getList(Criteria cri);
	public int getTotal(Criteria cri);
	public NoticeVO getDetail(Long noticeno);
	public void readCount(Long noticeno);
	public NoticeVO getPagePrev(Long noticeno);
	public NoticeVO getPageNext(Long noticeno);
	public boolean update(NoticeVO nVo);
	
//	admin
	public void insert(NoticeVO nVo);
	public boolean delete(Long noticeno);
	//첨부파일 목록 가져오기
	public List<AttachVO> gettAttachList(Long bno);
}
