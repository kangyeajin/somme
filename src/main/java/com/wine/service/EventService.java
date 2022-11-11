package com.wine.service;

import java.util.List;

import com.wine.model.AttachVO;
import com.wine.model.EventVO;

public interface EventService {

	public List<EventVO> getList();
	public void insert(EventVO eVo);
	public void delete(Long eventno);
	public void upload(Long eventno, Long upload);
	public List<EventVO> uploadList();
	public boolean update(EventVO eVo);
	public EventVO getDetail(Long eventno);

	//첨부파일 목록 가져오기
	public List<AttachVO> eventGettAttachList(Long eventno);
}
