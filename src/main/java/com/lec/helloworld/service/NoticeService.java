package com.lec.helloworld.service;

import java.util.List;


import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.helloworld.vo.Notice;

public interface NoticeService {
	public int totCntNotice();
	public List<Notice> noticeList(Notice notice, String pageNum);
	public int noticeWriteView(Notice notice, MultipartHttpServletRequest mRequest);
	public Notice noticeContent(int nno);
	public int noticeModifyView(Notice notice,MultipartHttpServletRequest mRequest);
	public int noticeDelete(int nno);
}
