package com.lec.helloworld.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.helloworld.vo.QnaBoard;

@Mapper
public interface QnaBoardDao {
	
	// 게시글 목록
	public List<QnaBoard> qnaBoardList(QnaBoard qnaBoard);
	
	// 게시글 총 갯수
	public int totCntQna(QnaBoard qnaBoard);
	
	// 게시글 조회 수 +1
	public void hitUpQna(int qanum);
	
	// 게시글 상세보기
	public QnaBoard contentQna(int qanum);
	
	// 게시글 작성
	public int writeQna(QnaBoard qnaBoard);
	
	// 게시글 수정
	public int modifyQna(QnaBoard qnaBoard);
	
	// 답변글 작성 전 작업
	public void replyStepQna(QnaBoard qnaBoard);
	
	// 답변글 작성
	public int replyQna(QnaBoard qnaBoard);
	
	// 게시글 삭제(답변글까지 삭제)
	public int deleteQna(int qagroup);
}
