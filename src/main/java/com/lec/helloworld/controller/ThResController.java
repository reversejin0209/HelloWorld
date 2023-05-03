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
	
	/* 예약 진행 */
	@RequestMapping(value="thReserve", method=RequestMethod.GET)
	public String thReserveView(ThRes thres, String thrdatetemp, Model model) {
		System.out.println("컨트롤러 진입");
		model.addAttribute("reserveChk", thresService.reserveChk(thres, thrdatetemp));
		System.out.println("컨트롤러 빠져나감" + thres + thresService.reserveChk(thres, thrdatetemp));
		return "thRes/thResInsert";
	}
	
	@RequestMapping(value="thReserve", method=RequestMethod.POST)
	public String thReserve(ThRes thres, String thrdateStr, String[] seatCode, String thprice, Model model) {
		System.out.println("thReserve 컨트롤러 진입" + thres);
		model.addAttribute("thResResult", thresService.thResInsert(thres, thrdateStr, thprice, seatCode));
		model.addAttribute("seatCode", seatCode);
		System.out.println("thReserve 컨트롤러 빠져나감");
		return "member/myPage";
	}
	
	@RequestMapping(value="seatList")
	public String seatReservation(ThRes thres, Model model, String mid) {
		model.addAttribute("seats", thresService.seatList(thres));
		return "seatList";
	}
	
}