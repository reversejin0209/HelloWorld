package com.lec.helloworld.service;

import java.util.List;

import com.lec.helloworld.vo.QnaBoard;

public interface QnaBoardService {
	public List<QnaBoard> qnaBoardList(QnaBoard qnaBoard, String pageNum);
	public int totCntQna(QnaBoard qnaBoard);
}
