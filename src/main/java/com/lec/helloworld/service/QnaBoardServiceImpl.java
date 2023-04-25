package com.lec.helloworld.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.helloworld.dao.QnaBoardDao;
import com.lec.helloworld.util.Paging;
import com.lec.helloworld.vo.QnaBoard;

@Service
public class QnaBoardServiceImpl implements QnaBoardService {
	
	@Autowired
	private QnaBoardDao qnaBoardDao;
	
	@Override
	public List<QnaBoard> qnaBoardList(QnaBoard qnaBoard, String pageNum) {
		Paging page = new Paging(qnaBoardDao.totCntQna(qnaBoard), pageNum, 10, 10);
		qnaBoard.setStartRow(page.getStartRow());
		qnaBoard.setEndRow(page.getEndRow());
		return qnaBoardDao.qnaBoardList(qnaBoard);
	}

	@Override
	public int totCntQna(QnaBoard qnaBoard) {
		return qnaBoardDao.totCntQna(qnaBoard);
	}


}
