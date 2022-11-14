package com.wine.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wine.mapper.AttachMapper;
import com.wine.mapper.ReviewMapper;
import com.wine.model.Criteria;
import com.wine.model.AttachVO;
import com.wine.model.ReviewVO;
import com.wine.model.prodCriteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service // 비즈니스영역을 담당하는 객체임을 표시
@Log4j
public class ReviewServiceImpl implements ReviewService {

	@Setter(onMethod_ = @Autowired)
	private ReviewMapper mapper;

	@Setter(onMethod_ = @Autowired)
	private AttachMapper attachMapper;

	@Override
	public List<ReviewVO> getList() {
		return mapper.getList();
	}
	
	@Override
	public List<ReviewVO> getList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}

	@Override
	public ReviewVO getDetail(Long reviewno) {
		return mapper.getDetail(reviewno);
	}

	@Override
	public void readCount(Long reviewno) {
		mapper.readCount(reviewno);
	}

	@Override
	public List<ReviewVO> getListP(String prodno) {
		return mapper.getListP(prodno);
	}

	@Override
	public boolean delete(Long reviewno) {
		attachMapper.ReviewDeleteAll(reviewno);
		return mapper.delete(reviewno) == 1;
	}

	@Transactional
	@Override
	public void insert(ReviewVO rVo) {

		log.info("insert......" + rVo);

		mapper.insertSelectKey(rVo);

		// 첨부파일이 없으면 return
		if (rVo.getAttachList() == null || rVo.getAttachList().size() <= 0) {
			return;
		}

		log.info("insert......ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ" + rVo.getReviewno());
		// 첨부파일 갯수만큼reviewno넣어줌
		rVo.getAttachList().forEach(attach -> {
			attach.setReviewno(rVo.getReviewno());
			attachMapper.insert(attach);
		});
	}

	@Override
	public ReviewVO pwdCheck(ReviewVO rVo) {
		return mapper.pwdCheck(rVo);
	}

	@Override
	public List<ReviewVO> getListA(prodCriteria cri) {
		return mapper.getListA(cri);
	}

	@Override
	public void bestSelect(Long reviewno, String best) {
		mapper.bestSelect(reviewno, best);
	}

	@Override
	public int getTotal(Criteria cri) {
		return mapper.pageTotal(cri);
	}

	@Override
	public ReviewVO getPagePrev(Long reviewno, String prodno) {
		return mapper.getPagePrev(reviewno, prodno);
	}

	@Override
	public ReviewVO getPageNext(Long reviewno, String prodno) {
		return mapper.getPageNext(reviewno, prodno);
	}

	@Override
	public List<AttachVO> gettAttachList(Long reviewno) {
		log.info("gettAttachList reviewno" + reviewno);
		// 게시글번호와 동일한 첨부파일을 모두 가져옴
		return attachMapper.findByReviewno(reviewno);
	}

	@Override
	public boolean update(ReviewVO rVo) {
		// 일단 첨부파일 싹 지워
		attachMapper.ReviewDeleteAll(rVo.getReviewno());

		boolean updateResult = mapper.update(rVo) == 1; // 성공했으면 1,아니면0
		// update 성공했고, 첨부파일이 있으면
		if (updateResult && rVo.getAttachList() != null && rVo.getAttachList().size() > 0) {
			// 첨부파일 하나씩 다시 insert
			rVo.getAttachList().forEach(attach -> {
				attach.setReviewno(rVo.getReviewno());
				attachMapper.insert(attach);
			});
		}
		return updateResult;
	}

	@Override
	public int getTotalA(prodCriteria cri) {
		return mapper.pageTotalA(cri);
	}


}
