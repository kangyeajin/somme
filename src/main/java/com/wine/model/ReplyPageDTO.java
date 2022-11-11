package com.wine.model;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class ReplyPageDTO {
	//댓글 갯수
	private int replyCnt;
	//댓글 목록
	private List<ReplyVO> list;
}
