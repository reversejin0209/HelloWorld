package com.lec.helloworld.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.helloworld.vo.QnaBoard;

public interface QnaBoardService {
	public List<QnaBoard> qnaBoardList(QnaBoard qnaBoard, String pageNum, Model model);
	public int totCntQna(QnaBoard qnaBoard);
	// public void hitUpQna(int qanum);
	public QnaBoard contentQna(int qanum);
	public void writeQna(QnaBoard qnaBoard, HttpServletRequest request, Model model);
	public void modifyQna(QnaBoard qnaBoard, HttpServletRequest request, Model model);
	// public void replyStepQna(QnaBoard qnaBoard);
	public void replyQna(QnaBoard qnaBoard, HttpServletRequest request, Model model);
	public int deleteQna(int qagroup, Model model);
	public void imageUpload(HttpServletRequest req, HttpServletResponse resp, MultipartHttpServletRequest multiFile);

}