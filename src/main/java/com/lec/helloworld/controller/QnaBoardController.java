package com.lec.helloworld.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.helloworld.service.QnaBoardService;
import com.lec.helloworld.vo.QnaBoard;

@Controller
@RequestMapping(value = "qnaBoard")
public class QnaBoardController {

	@Autowired
	private QnaBoardService qBoardService;

	@RequestMapping(value = "qBoardList", method = { RequestMethod.GET, RequestMethod.POST })
	public String qBoardList(QnaBoard qnaBoard, String pageNum, Model model) {
		model.addAttribute("qnaList", qBoardService.qnaBoardList(qnaBoard, pageNum, model));
		return "qnaBoard/qBoardList";
	}

	@RequestMapping(value = "qBoardContent", method = RequestMethod.GET)
	public String qBoardContent(int qanum, Model model) {
		model.addAttribute("qna", qBoardService.contentQna(qanum));
		return "qnaBoard/qBoardContent";
	}

	@RequestMapping(value = "qBoardWrite", method = RequestMethod.GET)
	public String qBoardWrite() {
		return "qnaBoard/qBoardWrite";
	}

	@RequestMapping(value = "qBoardWrite", method = RequestMethod.POST)
	public String qBoardWrite(QnaBoard qnaBoard, HttpServletRequest request, Model model) {
		qBoardService.writeQna(qnaBoard, request, model);
		return "forward:qBoardList.do";
	}

	@RequestMapping(value = "qBoardModify", method = RequestMethod.GET)
	public String qBoardModify(int qanum, Model model) {
		model.addAttribute("modifyQna", qBoardService.contentQna(qanum));
		return "qnaBoard/qBoardModify";
	}

	@RequestMapping(value = "qBoardModify", method = RequestMethod.POST)
	public String qBoardModify(QnaBoard qnaBoard, HttpServletRequest request, Model model) {
		qBoardService.modifyQna(qnaBoard, request, model);
		return "forward:qBoardList.do";
	}

	@RequestMapping(value = "qBoardDelete", method = RequestMethod.GET)
	public String qBoardDelete(int qagroup, Model model) {
		model.addAttribute("deleteResult", qBoardService.deleteQna(qagroup, model));
		return "forward:qBoardList.do";
	}

}
