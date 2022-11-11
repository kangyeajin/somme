package com.wine.service;

import java.util.List;

import com.wine.model.AttachVO;
import com.wine.model.Criteria;
import com.wine.model.QnaVO;
import com.wine.model.prodCriteria;

public interface QnaService {

	String[] qnaList = { "문의 드립니다 :)", "상품 관련 문의 드립니다.", 
			"환불 신청합니다.", "기타", "직접입력" };
	String[] qnaListUpdate = { "변경 시에만 선택해 주세요", "문의 드립니다 :)", "상품 관련 문의 드립니다.", 
			"환불 신청합니다.", "기타", "직접입력" };
	public List<QnaVO> getListA(prodCriteria cri);
	public List<QnaVO> getList(Criteria cri);
	public int getTotal(Criteria cri);
	public int getTotalA(prodCriteria cri);
	public QnaVO getPagePrev(Long qnano);
	public QnaVO getPageNext(Long qnano);
	public QnaVO getDetail(Long qnano);
	public void readCount(Long qnano);
	public boolean delete(Long reviewno);
	public QnaVO pwdCheck(QnaVO qVo);
	public void qnaAnswer(String reply, Long qnano);
	public void insert(QnaVO qVo);
	public boolean update(QnaVO qVo);
	
	//첨부파일 목록 가져오기
	public List<AttachVO> gettAttachList(Long bno);
}
