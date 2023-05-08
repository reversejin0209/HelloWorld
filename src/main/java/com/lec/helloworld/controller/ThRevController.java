package com.lec.helloworld.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.helloworld.service.ThRevService;
import com.lec.helloworld.vo.ThRev;

@Controller
@RequestMapping(value="thRev")
public class ThRevController {

	@Autowired
	ThRevService threvService;
	
	/* 공연 리뷰 쓰기 */
	@RequestMapping(value="thRevWrite", method=RequestMethod.GET)
	public String thRevWriteView(String thrcode, Model model) {
		model.addAttribute("writeViewResult", threvService.thRevWriteView(thrcode));
		return "thRevBoard/thRevWrite";
	}
	
	/* 공연 리뷰 DB 작성 */
	@RequestMapping(value="thRevWrite", method=RequestMethod.POST)
	public String thRevWrite(ThRev threv, Model model) {
		model.addAttribute("thRevWriteResult", threvService.thRevWrite(threv));
		return "member/mMypage";
	}
	
	/* 공연 리뷰 자세히 보기 */
	@RequestMapping(value="thRevContent", method=RequestMethod.GET)
	public String thRevContent(ThRev threv, Model model) {
		model.addAttribute("thRevContentResult", threvService.thRevContent(threv));
		return "thRevBoard/thRevContent";
	}
	
	/* 마이페이지 리뷰 리스트 */
	@RequestMapping(value="mthRevList", method=RequestMethod.GET)
	public String mthRevList(ThRev threv, String pageNum, Model model) {
		model.addAttribute("thRevList", threvService.mthRevList(threv, pageNum, model));
		return "thRevBoard/mthRevList";
	}
	
}
