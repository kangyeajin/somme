package com.wine.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.wine.model.Criteria;
import com.wine.model.QnaVO;
import com.wine.model.ReviewVO;
import com.wine.model.prodCriteria;

public interface ReviewMapper {
	//베스트리뷰 목록
	public List<ReviewVO> getList();
	//페이징 목록
	public List<ReviewVO> getListWithPaging(Criteria cri);
	//전체 게시글 수(페이징)
	public int pageTotal(Criteria cri);
	//admin 전체글수
	public int pageTotalA(prodCriteria cri);
	//상세페이지
	public ReviewVO getDetail(Long reviewno);
	//조회수
	public void readCount(Long reviewno);
	public List<ReviewVO> getListP(String prodno);
	//admin 페이징목록
	public List<ReviewVO> getListA(prodCriteria cri);
	
	public int insert(ReviewVO rVo);
	public int delete(Long reviewno);
	public int update(ReviewVO rVo);
	//게시글 수정/삭제시 비밀번호 체크
	public ReviewVO pwdCheck(ReviewVO rVo);
	//admin 베스트 리뷰 선정
	public void bestSelect(@Param("reviewno")Long reviewno, @Param("best")String best);
	//상세페이지 이전글
	public ReviewVO getPagePrev(@Param("reviewno")Long reviewno, @Param("prodno")String prodno);
	//상세페이지 다음글
	public ReviewVO getPageNext(@Param("reviewno")Long reviewno, @Param("prodno")String prodno);

	//게시글 번호 먼저 구해오기
	public void insertSelectKey(ReviewVO rVo);
}
