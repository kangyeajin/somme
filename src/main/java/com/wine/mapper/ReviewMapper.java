package com.wine.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.wine.model.Criteria;
import com.wine.model.QnaVO;
import com.wine.model.ReviewVO;
import com.wine.model.prodCriteria;

public interface ReviewMapper {
	public List<ReviewVO> getList();
	public List<ReviewVO> getListWithPaging(Criteria cri);
	public int pageTotal(Criteria cri);
	public int pageTotalA(prodCriteria cri);
	public ReviewVO getDetail(Long reviewno);
	public void readCount(Long reviewno);
	public List<ReviewVO> getListP(String prodno);
	public List<ReviewVO> getListA(prodCriteria cri);
	public int insert(ReviewVO rVo);
	public int delete(Long reviewno);
	public int update(ReviewVO rVo);
	public ReviewVO pwdCheck(ReviewVO rVo);
	public void bestSelect(@Param("reviewno")Long reviewno, @Param("best")String best);
	public ReviewVO getPagePrev(@Param("reviewno")Long reviewno, @Param("prodno")String prodno);
	public ReviewVO getPageNext(@Param("reviewno")Long reviewno, @Param("prodno")String prodno);

	public void insertSelectKey(ReviewVO rVo);
}
