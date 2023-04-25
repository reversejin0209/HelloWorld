package com.lec.helloworld.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.helloworld.vo.QnaBoard;

@Mapper
public interface QnaBoardDao {
	public List<QnaBoard> qnaBoardList(QnaBoard qnaBoard);
	public int totCntQna(QnaBoard qnaBoard);
}
