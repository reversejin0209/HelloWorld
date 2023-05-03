package com.lec.helloworld.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.helloworld.vo.Notice;

@Mapper
public interface NoticeDao {
	
	public List<Notice> noticeMain(Notice notice);
	public List<Notice> noticeList(Notice notice);
	public int totCntNotice(Notice notice);
	public int noticeWrite(Notice notice);
	public Notice noticeContent(int nno);
	public int noticeModify(Notice notice);
	public int noticeDelete(int nno);
	public int noticeNext(int nno);
	public int noticePre(int nno);
	
}
