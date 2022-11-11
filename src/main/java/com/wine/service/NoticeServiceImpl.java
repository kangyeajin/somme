package com.wine.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wine.mapper.AttachMapper;
import com.wine.mapper.NoticeMapper;
import com.wine.model.AttachVO;
import com.wine.model.Criteria;
import com.wine.model.NoticeVO;
import com.wine.model.prodCriteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service	//비즈니스영역을 담당하는 객체임을 표시
@Log4j
public class NoticeServiceImpl implements NoticeService {
	@Setter(onMethod_ = @Autowired)
	private NoticeMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private AttachMapper attachMapper;

	@Override
	public List<NoticeVO> getListA(prodCriteria cri) {
		log.info("getListA.........");
		return mapper.getListA(cri);
	}
	@Override
	public List<NoticeVO> getList(Criteria cri) {
		log.info("getList.........");
		return mapper.getListWithPaging(cri);
	}

	@Override
	public NoticeVO getDetail(Long noticeno) {
		log.info("getDetail.........");
		return mapper.getDetail(noticeno);
	}

	@Override
	public void readCount(Long noticeno) {
		log.info("readCount.........");
		mapper.readCount(noticeno);
	}

	@Transactional
	@Override
	public void insert(NoticeVO nVo) {
		log.info("insert.........");
		mapper.insertSelectKey(nVo);
		
		//첨부파일이 없으면 return
		if (nVo.getAttachList() == null || nVo.getAttachList().size() <= 0) {
			return;
		}

		log.info("insert......ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ" + nVo.getNoticeno());
		//첨부파일 갯수만큼 bno넣어줌
		nVo.getAttachList().forEach(attach -> {
			attach.setNoticeno(nVo.getNoticeno());
			attachMapper.insert(attach);
		});
	}

	@Override
	public boolean delete(Long noticeno) {
		attachMapper.NoticeDeleteAll(noticeno);
		return mapper.delete(noticeno) == 1;
	}
	@Override
	public int getTotal(Criteria cri) {
		return mapper.pageTotal(cri);
	}
	@Override
	public NoticeVO getPagePrev(Long noticeno) {
		return mapper.getPagePrev(noticeno);
	}
	@Override
	public NoticeVO getPageNext(Long noticeno) {
		return mapper.getPageNext(noticeno);
	}
	@Override
	public List<AttachVO> gettAttachList(Long noticeno) {
		return attachMapper.findByNoticeno(noticeno);
	}
	
	@Transactional
	@Override
	public boolean update(NoticeVO nVo) {
		//일단 첨부파일 싹 지워
		attachMapper.NoticeDeleteAll(nVo.getNoticeno());
		
		boolean updateResult = mapper.update(nVo) == 1; //성공했으면 1,아니면0
		//update 성공했고, 첨부파일이 있으면
		if(updateResult && nVo.getAttachList() != null && nVo.getAttachList().size()>0) {
			//첨부파일 하나씩 다시 insert
			nVo.getAttachList().forEach(attach ->{
				attach.setNoticeno(nVo.getNoticeno());
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
