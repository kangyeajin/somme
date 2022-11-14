package com.wine.service;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import com.wine.model.Criteria;
import com.wine.model.NoticeVO;
import com.wine.model.AttachVO;
import com.wine.model.QnaVO;
import com.wine.model.ReviewVO;
import com.wine.model.prodCriteria;

public interface ReviewService {
	public List<ReviewVO> getListA(prodCriteria cri);
	public List<ReviewVO> getList(Criteria cri);
	public List<ReviewVO> getList();
	public int getTotal(Criteria cri);
	public int getTotalA(prodCriteria cri);
	public ReviewVO getDetail(Long reviewno);
	public void readCount(Long reviewno);
	public List<ReviewVO> getListP(String prodno);
	public void insert(ReviewVO rVo);
	public boolean delete(Long reviewno);
	public ReviewVO pwdCheck(ReviewVO rVo);
	public void bestSelect(@RequestParam("reviewno")Long reviewno, @RequestParam("best")String best);
	public ReviewVO getPagePrev(Long reviewno, String prodno);
	public ReviewVO getPageNext(Long reviewno, String prodno);
	public boolean update(ReviewVO rVo);
	
	//첨부파일 목록 가져오기
	public List<AttachVO> gettAttachList(Long reviewno);
	
}
