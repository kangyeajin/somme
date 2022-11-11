package com.wine.mapper;

import java.util.List;

import com.wine.model.AttachVO;

public interface AttachMapper {
	public void insert(AttachVO qVo);
	public void delete(String uuid);
	public List<AttachVO> findByNoticeno(Long noticeno);
	public List<AttachVO> findByQnano(Long qnano);
	public List<AttachVO> findByReviewno(Long reviewno);
	public List<AttachVO> findByEventno(Long eventno);
	
	public void NoticeDeleteAll(Long noticeno);
	public void QnaDeleteAll(Long qna);
	public void ReviewDeleteAll(Long reviewno);
	public void EventDeleteAll(Long eventno);
}
