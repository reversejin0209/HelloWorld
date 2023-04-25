package com.lec.helloworld.controller;

<<<<<<< HEAD
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
=======
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lec.helloworld.service.QnaBoardService;
import com.lec.helloworld.util.Paging;
import com.lec.helloworld.vo.QnaBoard;
>>>>>>> fd63761d6249ab010c16fc3c0ca2764353067aee

@Controller
@RequestMapping(value = "qnaBoard")
public class QnaBoardController {

<<<<<<< HEAD
	@RequestMapping(value = "qBoardList", method = RequestMethod.GET)
	public String qBoardList() {
=======
	@Autowired
	private QnaBoardService qBoardService;
	
	@RequestMapping(value = "qBoardList")
	public String qBoardList(QnaBoard qnaBoard, String pageNum, Model model) {
		model.addAttribute("qnaList", qBoardService.qnaBoardList(qnaBoard, pageNum));
		model.addAttribute("paging", new Paging(qBoardService.totCntQna(qnaBoard), pageNum, 10, 10));
>>>>>>> fd63761d6249ab010c16fc3c0ca2764353067aee
		return "qnaBoard/qBoardList";
	}
}
