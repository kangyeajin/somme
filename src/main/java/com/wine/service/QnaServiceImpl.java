package com.wine.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wine.mapper.AttachMapper;
import com.wine.mapper.QnaMapper;
import com.wine.model.Criteria;
import com.wine.model.AttachVO;
import com.wine.model.QnaVO;
import com.wine.model.prodCriteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service // 비즈니스영역을 담당하는 객체임을 표시
@Log4j
public class QnaServiceImpl implements QnaService {

	@Setter(onMethod_ = @Autowired)
	private QnaMapper mapper;

	@Setter(onMethod_ = @Autowired)
	private AttachMapper attachMapper;

	@Override
	public List<QnaVO> getListA(prodCriteria cri) {
		log.info("getList.........");
		return mapper.getListA(cri);
	}

	@Override
	public List<QnaVO> getList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}

	@Transactional
	@Override
	public void insert(QnaVO qVo) {

		log.info("insert......" + qVo);

		mapper.insertSelectKey(qVo);

		// 첨부파일이 없으면 return
		if (qVo.getAttachList() == null || qVo.getAttachList().size() <= 0) {
			return;
		}

		log.info("insert......ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ" + qVo.getQnano());
		// 첨부파일 갯수만큼 bno넣어줌
		qVo.getAttachList().forEach(attach -> {
			attach.setQnano(qVo.getQnano());
			attachMapper.insert(attach);
		});
	}

	@Override
	public QnaVO getDetail(Long qnano) {
		return mapper.getDetail(qnano);
	}

	@Override
	public void readCount(Long qnano) {
		mapper.readCount(qnano);
	}

	/*
	 * @Override public boolean insert(QnaVO qVo) { log.info("insert.........");
	 * return mapper.insert(qVo) == 1; }
	 */
	@Override
	public boolean delete(Long qnano) {
		attachMapper.QnaDeleteAll(qnano);
		return mapper.delete(qnano) == 1;
	}

	@Override
	public QnaVO pwdCheck(QnaVO qVo) {
		log.info("pwdCheck.........");
		return mapper.pwdCheck(qVo);
	}

	@Override
	public void qnaAnswer(String reply, Long qnano) {
		mapper.qnaAnswer(reply, qnano);
	}

	@Override
	public int getTotal(Criteria cri) {
		return mapper.pageTotal(cri);
	}

	@Override
	public QnaVO getPagePrev(Long qnano) {
		return mapper.getPagePrev(qnano);
	}

	@Override
	public QnaVO getPageNext(Long qnano) {
		return mapper.getPageNext(qnano);
	}

	@Override
	public List<AttachVO> gettAttachList(Long qnano) {
		log.info("gettAttachList qnano" + qnano);
		// 게시글번호와 동일한 첨부파일을 모두 가져옴
		return attachMapper.findByQnano(qnano);
	}

	@Transactional
	@Override
	public boolean update(QnaVO qVo) {
		// 일단 첨부파일 싹 지워
		attachMapper.QnaDeleteAll(qVo.getQnano());

		boolean updateResult = mapper.update(qVo) == 1; // 성공했으면 1,아니면0
		// update 성공했고, 첨부파일이 있으면
		if (updateResult && qVo.getAttachList() != null && qVo.getAttachList().size() > 0) {
			// 첨부파일 하나씩 다시 insert
			qVo.getAttachList().forEach(attach -> {
				attach.setQnano(qVo.getQnano());
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
