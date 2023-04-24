package com.lec.helloworld.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lec.helloworld.service.QnaBoardService;
import com.lec.helloworld.util.Paging;
import com.lec.helloworld.vo.QnaBoard;

@Controller
@RequestMapping(value = "qnaBoard")
public class QnaBoardController {

	@Autowired
	private QnaBoardService qBoardService;
	
	@RequestMapping(value = "qBoardList")
	public String qBoardList(QnaBoard qnaBoard, String pageNum, Model model) {
		model.addAttribute("qnaList", qBoardService.qnaBoardList(qnaBoard, pageNum));
		model.addAttribute("paging", new Paging(qBoardService.totCntQna(qnaBoard), pageNum, 10, 10));
		return "qnaBoard/qBoardList";
	}
}
