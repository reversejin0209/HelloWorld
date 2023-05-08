package com.lec.helloworld.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.helloworld.service.ThResService;
import com.lec.helloworld.vo.ThRes;

@Controller
@RequestMapping(value="thRes")
public class ThResController {
	
	@Autowired
	private ThResService thresService;
	
	/* 예약 진행 뷰단 */
	@RequestMapping(value="thReserve", method=RequestMethod.GET)
	public String thReserveView(ThRes thres, String thrdatetemp, Model model) {
		model.addAttribute("reserveChk", thresService.reserveChk(thres, thrdatetemp));
		model.addAttribute("seats", thresService.seatList(thres));
		return "thRes/thResInsert";
	}
	
	/* 예약 진행 */
	@RequestMapping(value="thReserve", method=RequestMethod.POST)
	public String thReserve(ThRes thres, String thrdateStr, String[] seatCode, String thprice, Model model) {
		model.addAttribute("thResResult", thresService.thResInsert(thres, thrdateStr, thprice, seatCode));
		model.addAttribute("seatCode", seatCode);
		return "member/mMypage";
	}
	
	/* 좌석 리스트 출력 */
	@RequestMapping(value="seatList", method=RequestMethod.GET)
	public String seatReservation(ThRes thres, Model model, String mid) {
		model.addAttribute("seats", thresService.seatList(thres));
		return "seatList";
	}
	
	/* 내가 예매한 목록 */
	@RequestMapping(value="thResList", method=RequestMethod.GET)
	public String thResList(ThRes thres, String pageNum, Model model) {
		model.addAttribute("thResListResult", thresService.thResList(thres, pageNum, model));
		return "thRes/thResList";
	}
	
	/* 내가 예매한 공연 상세보기 */
	@RequestMapping(value="thResContent", method=RequestMethod.GET)
	public String thResContent(String thrcode, Model model) {
		model.addAttribute("thResContent", thresService.thResContent(thrcode, model));
		model.addAttribute("thResContentSeat", thresService.thResContentSeat(thrcode, model));
		return "thRes/thResContent";
	}
	
	/* 내 예매권 취소 */
	@RequestMapping(value="thResCancel", method=RequestMethod.GET)
	public String thResCancel(String thrcode, Model model) {
		model.addAttribute("thResCancelResult", thresService.thResCancel(thrcode));
		return "member/mMypage";
	}
	
	/* 공연 삭제 */
	@RequestMapping(value="theaterDelete", method=RequestMethod.GET)
	public String theaterDelete(String thcode, Model model) {
		model.addAttribute("thDeleteResult", thresService.theaterDelete(thcode));
		return "admin/aMypage";
	}
	
}