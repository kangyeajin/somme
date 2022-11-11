package com.wine.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.wine.model.EventVO;

public interface EventMapper {

	public List<EventVO> getList();
	public void insert(EventVO eVo);
	public void delete(Long eventno);
	public void upload(@Param("eventno")Long eventno, @Param("upload")Long upload);
	public void insertSelectKey(EventVO eVo);
	public int update(EventVO eVo);
	
	//user page
	public List<EventVO> uploadList();
	public EventVO getDetail(Long eventno);
}
