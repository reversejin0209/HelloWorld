package com.lec.helloworld.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "qnaBoard")
public class QnaBoardController {

	@RequestMapping(value = "qBoardList", method = RequestMethod.GET)
	public String qBoardList() {
		return "qnaBoard/qBoardList";
	}
}
