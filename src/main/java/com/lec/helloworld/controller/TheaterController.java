package com.lec.helloworld.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.helloworld.service.ThRevService;
import com.lec.helloworld.service.TheaterService;
import com.lec.helloworld.vo.ThRes;
import com.lec.helloworld.vo.ThRev;
import com.lec.helloworld.vo.Theater;

@Controller
@RequestMapping(value="theater")
public class TheaterController {
	
	@Autowired
	private TheaterService theaterService;
	
	@Autowired
	private ThRevService threvService;
	
	/* 공연 목록 */
	@RequestMapping(value="theaterList", method = RequestMethod.GET)
	public String theaterList(int thschedule, String schDate, Model model) {
		model.addAttribute("theaterList", theaterService.theaterList(thschedule, schDate));
		return "theater/theaterList";
	}
	
	/* 공연 상세보기 */
	@RequestMapping(value="theaterContent", method = RequestMethod.GET)
	public String theaterContent(ThRev threv, String pageNum, String thname, String schDate, String thcode, int thseat, int thprice, ThRes thres, Model model) {
		model.addAttribute("thcon", theaterService.theaterContent(thname, schDate, thcode, thseat));
		model.addAttribute("seatChk", theaterService.seatChk(thres, schDate));
		model.addAttribute("thRevList", threvService.thRevList(threv, pageNum, model));
		return "theater/theaterContent";
	}
	
	/* 공연 추가 뷰단 */
	@RequestMapping(value="theaterInsert", method = RequestMethod.GET)
	public String theaterInsertView() {
		return "theater/theaterInsertView";
	}
	
	/* 공연 추가 */
	@RequestMapping(value="theaterInsert", method = RequestMethod.POST)
	public String theaterInsert(Theater theater, MultipartHttpServletRequest mRequest, Model model) {
		theaterService.theaterInsert(theater, mRequest, model);
		model.addAttribute("insertResult", "공연 추가가 완료되었습니다.");
		return "admin/aMypage";
	}
	
	/* 공연 갯수 확인 */
	@RequestMapping(value="theaterCntChk", method = {RequestMethod.GET, RequestMethod.POST})
	public String theaterCntChk(int thschedule, Model model) {
		model.addAttribute("thConfirmResult", theaterService.theaterCntChk(thschedule));
		return "theater/theaterConfirm";
	}
	
	/* 공연 삭제 */
	@RequestMapping(value="theaterDelete", method = RequestMethod.GET)
	public String theaterDelete(String thcode, Model model) {
		model.addAttribute("theaterDelete", theaterService.theaterDelete(thcode));
		return "admin/aMypage";
	}
	
}
