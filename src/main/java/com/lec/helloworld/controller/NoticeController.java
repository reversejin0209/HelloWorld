package com.lec.helloworld.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.helloworld.service.NoticeService;
import com.lec.helloworld.util.Paging;
import com.lec.helloworld.vo.Notice;

@Controller
@RequestMapping("notice")
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	@RequestMapping(value="noticeList", method = RequestMethod.GET)
	public String noticeList(String pageNum, Model model, Notice notice) {
		model.addAttribute("noticeList", noticeService.noticeList(notice, pageNum));
		model.addAttribute("paging", new Paging(noticeService.totCntNotice(), pageNum, 10, 10));
		return "notice/noticeList";
	}
	@RequestMapping(value="noticeContent", method = RequestMethod.GET)
	public String noticeContent(int nno, Model model) {
		model.addAttribute("noticeCn", noticeService.noticeContent(nno));
		return "notice/noticeContent";
	}
	@RequestMapping(value="noticeWriteView", method = RequestMethod.GET)
	public String noticeWriteView(Notice notice, Model model, MultipartHttpServletRequest mRequest) {
		model.addAttribute("noticeWr", noticeService.noticeWriteView(notice, mRequest));
		return "notice/noticeWriteView";
	}
	@RequestMapping(value="noticeModifyView", method = RequestMethod.GET)
	public String noticeModifyView(Notice notice, Model model, MultipartHttpServletRequest mRequest) {
		model.addAttribute("noticeMo", noticeService.noticeModifyView(notice, mRequest));
		return "notice/noticeModifyView";
	}
	@RequestMapping(value="noticeDelete", method=RequestMethod.GET)
	public String noticeDelete(int nno, Model model) {
		model.addAttribute("noticeDe", noticeService.noticeDelete(nno));
		return "forward:noticeList.do";
	}
}
