package com.lec.helloworld.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.helloworld.vo.QnaBoard;

@Mapper
public interface QnaBoardDao {
	public List<QnaBoard> qnaBoardList(QnaBoard qnaBoard);
	public int totCntQna(QnaBoard qnaBoard);
	public void hitUpQna(int qanum);
	public QnaBoard contentQna(int qanum);
	public int writeQna(QnaBoard qnaBoard);
	public int modifyQna(QnaBoard qnaBoard);
	public void replyStepQna(QnaBoard qnaBoard);
	public int replyQna(QnaBoard qnaBoard);
	public int deleteQna(int qagroup);
}
