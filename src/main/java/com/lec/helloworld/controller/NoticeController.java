package com.lec.helloworld.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.helloworld.service.NoticeService;
import com.lec.helloworld.vo.Notice;

@Controller
@RequestMapping("notice")	
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping(value="noticeList", method = RequestMethod.GET)
	public String noticeList(String pageNum, Model model, Notice notice) {
		model.addAttribute("noticeList", noticeService.noticeList(notice, pageNum, model));
		return "notice/noticeList";
	}
	
	@RequestMapping(value="noticeContent", method = RequestMethod.GET)
	public String noticeContent(int nno, Model model) {
		model.addAttribute("noticeCn", noticeService.noticeContent(nno));
		return "notice/noticeContent";
	}
	
	@RequestMapping(value="noticeWrite", method = RequestMethod.GET)
	public String noticeWriteView() {
		return "notice/noticeWrite";
	}
	
	@RequestMapping(value="noticeWrite", method = RequestMethod.POST)
	public String noticeWriteView(Notice notice, Model model, MultipartHttpServletRequest mRequest) {
		model.addAttribute("noticeWr", noticeService.noticeWrite(notice, mRequest));
		return "notice/noticeWrite";
	}
	
	@RequestMapping(value="noticeModify", method = RequestMethod.GET)
	public String noticeModifyView() {
		return "notice/noticeModify";
	}
	
	@RequestMapping(value="noticeModify", method = RequestMethod.POST)
	public String noticeModifyView(Notice notice, Model model, MultipartHttpServletRequest mRequest) {
		model.addAttribute("noticeMo", noticeService.noticeModify(notice, mRequest));
		return "notice/noticeModify";
	}
	
	@RequestMapping(value="noticeDelete", method=RequestMethod.GET)
	public String noticeDelete(int nno, Model model) {
		model.addAttribute("noticeDe", noticeService.noticeDelete(nno, model));
		return "forward:noticeList.do";
	}
	
	@RequestMapping(value="noticeNext", method = RequestMethod.GET)
	public String noticeNext(int nno, Model model) {
		model.addAttribute("noticeNext", noticeService.noticeNext(nno));
		return "notice/noticeContent";
	}
	
	@RequestMapping(value="noticePre", method = RequestMethod.GET)
	public String noticePre(int nno, Model model) {
		model.addAttribute("noticePre", noticeService.noticePre(nno));
		return "notice/noticeContent";
	}
}
