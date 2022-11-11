package com.wine.model;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {

  private Long replyno;
  private Long reviewno;
  private Long nth;
  private Long reReplyno;
  private Long reSum;

  private String reply;
  private String replyer;
  private Date replyDate;
  private Date updateDate;

}
