package com.wine.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wine.mapper.AttachMapper;
import com.wine.mapper.EventMapper;
import com.wine.model.AttachVO;
import com.wine.model.EventVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class EventServiceImpl implements EventService {
	@Setter(onMethod_ = @Autowired)
	private EventMapper mapper;

	@Setter(onMethod_ = @Autowired)
	private AttachMapper attachMapper;
	
	@Override
	public List<EventVO> getList() {
		return mapper.getList();
	}

	@Transactional
	@Override
	public void insert(EventVO eVo) {
		mapper.insertSelectKey(eVo);
		
		//첨부파일이 없으면 return
		if (eVo.getAttachList() == null || eVo.getAttachList().size() <= 0) {
			return;
		}

		log.info("insert......ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ" + eVo.getEventno());
		//첨부파일 갯수만큼 bno넣어줌
		eVo.getAttachList().forEach(attach -> {
			attach.setEventno(eVo.getEventno());
			attachMapper.insert(attach);
		});
	}

	@Override
	public void delete(Long eventno) {
		attachMapper.EventDeleteAll(eventno);
		mapper.delete(eventno);
	}

	@Override
	public void upload(Long eventno, Long upload) {
		mapper.upload(eventno,upload);
	}

	@Override
	public List<EventVO> uploadList() {
		return mapper.uploadList();
	}

	@Override
	public List<AttachVO> eventGettAttachList(Long eventno) {
		return attachMapper.findByEventno(eventno);
	}

	@Transactional
	@Override
	public boolean update(EventVO eVo) {
		//일단 첨부파일 싹 지워
		attachMapper.EventDeleteAll(eVo.getEventno());
		
		boolean updateResult = mapper.update(eVo) == 1; //성공했으면 1,아니면0
		//update 성공했고, 첨부파일이 있으면
		if(updateResult && eVo.getAttachList() != null && eVo.getAttachList().size()>0) {
			//첨부파일 하나씩 다시 insert
			eVo.getAttachList().forEach(attach ->{
				attach.setEventno(eVo.getEventno());
				attachMapper.insert(attach);
			});
		}
		return updateResult;
	}

	@Override
	public EventVO getDetail(Long eventno) {
		return mapper.getDetail(eventno);
	}

}
