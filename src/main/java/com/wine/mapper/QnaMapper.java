package com.wine.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.wine.model.Criteria;
import com.wine.model.QnaVO;
import com.wine.model.prodCriteria;

public interface QnaMapper {
	
	public List<QnaVO> getListA(prodCriteria cri);
	public List<QnaVO> getListWithPaging(Criteria cri);
	public int pageTotal(Criteria cri);
	public int pageTotalA(prodCriteria cri);
	public QnaVO getDetail(Long qnano);
	public void readCount(Long qnano);
	public int insert(QnaVO qVo);
	public int delete(Long qnano);
	public int update(QnaVO qVo);
	public QnaVO pwdCheck(QnaVO qVo);
	public void qnaAnswer(@Param("reply")String reply, @Param("qnano")Long qnano);
	public QnaVO getPagePrev(Long qnano);
	public QnaVO getPageNext(Long qnano);
	
	public void insertSelectKey(QnaVO qVo);
}
