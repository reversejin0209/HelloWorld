package com.lec.helloworld.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

	// 게시글 목록
	@RequestMapping(value = "qBoardList", method = { RequestMethod.GET, RequestMethod.POST })
	public String qBoardList(QnaBoard qnaBoard, String pageNum, Model model) {
		model.addAttribute("qnaList", qBoardService.qnaBoardList(qnaBoard, pageNum, model));
		return "qnaBoard/qBoardList";
	}

	// 게시글 상세보기
	@RequestMapping(value = "qBoardContent", method = RequestMethod.GET)
	public String qBoardContent(int qanum, Model model) {
		model.addAttribute("qna", qBoardService.contentQna(qanum));
		return "qnaBoard/qBoardContent";
	}

	// 게시글 작성: GET
	@RequestMapping(value = "qBoardWrite", method = RequestMethod.GET)
	public String qBoardWrite() {
		return "qnaBoard/qBoardWrite";
	}

	// 게시글 작성: POST
	@RequestMapping(value = "qBoardWrite", method = RequestMethod.POST)
	public String qBoardWrite(QnaBoard qnaBoard, HttpServletRequest request, Model model) {
		qBoardService.writeQna(qnaBoard, request, model);
		return "forward:qBoardList.do";
	}

	// 게시글 수정: GET
	@RequestMapping(value = "qBoardModify", method = RequestMethod.GET)
	public String qBoardModify(int qanum, Model model) {
		model.addAttribute("modifyQna", qBoardService.contentQna(qanum));
		return "qnaBoard/qBoardModify";
	}

	// 게시글 수정: POST
	@RequestMapping(value = "qBoardModify", method = RequestMethod.POST)
	public String qBoardModify(QnaBoard qnaBoard, HttpServletRequest request, Model model) {
		qBoardService.modifyQna(qnaBoard, request, model);
		return "forward:qBoardList.do";
	}

	// 게시글 삭제
	@RequestMapping(value = "qBoardDelete", method = RequestMethod.GET)
	public String qBoardDelete(int qagroup, Model model) {
		model.addAttribute("deleteResult", qBoardService.deleteQna(qagroup, model));
		return "redirect:qBoardList.do";
	}

	// 답변글 작성: GET
	@RequestMapping(value = "qBoardReply", method = RequestMethod.GET)
	public String boardReply(int qanum, Model model) {
		model.addAttribute("qanum", qanum);
		model.addAttribute("originBoard", qBoardService.contentQna(qanum));
		return "qnaBoard/qBoardReply";
	}

	// 답변글 작성: POST
	@RequestMapping(value = "qBoardReply", method = RequestMethod.POST)
	public String boardReply(QnaBoard qnaBoard, HttpServletRequest request, Model model) {
		qBoardService.replyQna(qnaBoard, request, model);
		return "forward:qBoardList.do";
	}

	// 회원: 마이페이지 > 내가 작성한 문의
	@RequestMapping(value = "myQnaBoardList", method = RequestMethod.GET)
	public String myQnaBoardList(HttpSession session, QnaBoard qnaBoard, String pageNum, Model model) {
		model.addAttribute("qnaList", qBoardService.myQnaBoardList(session, qnaBoard, pageNum, model));
		return "member/myQnaBoardList";
	}

	// 회원: 마이페이지 > 내가 작성한 문의글 상세보기
	@RequestMapping(value = "myQnaBoardContent", method = RequestMethod.GET)
	public String myQnaBoardContent(int qanum, Model model) {
		model.addAttribute("qna", qBoardService.contentQna(qanum));
		return "member/myQnaBoardContent";
	}
	
	// 관리자: 관리자 페이지 > 작성된 문의 리스트
	@RequestMapping(value = "adQnaBoardList", method = RequestMethod.GET)
	public String adQnaBoardList(QnaBoard qnaBoard, String pageNum, Model model) {
		model.addAttribute("qnaList", qBoardService.qnaBoardList(qnaBoard, pageNum, model));
		return "admin/adQnaBoardList";
	}
}
