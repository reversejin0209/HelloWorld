package com.lec.helloworld.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.helloworld.vo.Notice;

@Mapper
public interface NoticeDao {
	public int totCntNotice();
	public List<Notice> noticeList(Notice notice);
	public int noticeWriteView(Notice notice);
	public Notice noticeContent(int nno);
	public int noticeModifyView(Notice notice);
	public int noticeDelete(int nno);
}
