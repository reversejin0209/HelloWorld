package com.lec.helloworld.service;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.helloworld.vo.Notice;

public interface NoticeService {
	public List<Notice> noticeMain(Notice notice, String pageNum, Model model);
	public List<Notice> noticeList(Notice notice, String pageNum, Model model);
	public int totCntNotice(Notice notice);
	public int noticeWrite(Notice notice, MultipartHttpServletRequest mRequest);
	public Notice noticeContent(int nno);
	public int noticeModify(Notice notice,MultipartHttpServletRequest mRequest);
	public int noticeDelete(int nno, Model model);
	public int noticeNext(int nno);
	public int noticePre(int nno);
}
