package com.lec.helloworld.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.helloworld.vo.QnaBoard;

public interface QnaBoardService {
	// 상위 네다섯개 목록 출력
	public List<QnaBoard> qnaBoardMainList();
	
	// 문의 게시판 목록 출력
	public List<QnaBoard> qnaBoardList(QnaBoard qnaBoard, String pageNum, Model model);
	// public int totCntQna(QnaBoard qnaBoard);

	// 글 상세보기
	public QnaBoard contentQna(int qanum);
	// public void hitUpQna(int qanum);

	// 문의글 작성 : 회원
	public void writeQna(QnaBoard qnaBoard, HttpServletRequest request, Model model);
	
	// 글 수정: 회원+관리자
	public void modifyQna(QnaBoard qnaBoard, HttpServletRequest request, Model model);
	
	// 답변글 작성: 관리자
	// public void replyStepQna(QnaBoard qnaBoard);
	public void replyQna(QnaBoard qnaBoard, HttpServletRequest request, Model model);

	// 글 삭제: 회원+관리자
	public int deleteQna(int qagroup, Model model);
	
	// 마이페이지 내가 작성한 문의: 회원
	public List<QnaBoard> myQnaBoardList(HttpSession session, QnaBoard qnaBoard, String pageNum, Model model);
	
	// CKEDITER
	public void imageUpload(HttpServletRequest req, HttpServletResponse resp, MultipartHttpServletRequest multiFile);

}