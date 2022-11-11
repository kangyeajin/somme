package com.wine.mapper;

import org.apache.ibatis.annotations.Param;

import com.wine.model.WorkerVO;

public interface WorkerMapper {
	
	public WorkerVO adminlogin(@Param("id")String id, @Param("pwd")String pwd);
	
}
