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
	public String thReserveView(String thrdate, String thrcode, String thcnt) {
		return "thRes/thResInsert";
	}
	
	@RequestMapping(value="thReserve", method=RequestMethod.POST)
	public String thReserve(ThRes thres, Model model) {
		System.out.println("컨트롤러 진입");
		model.addAttribute("thResResult", thresService.thResInsert(thres));
		System.out.println("컨트롤러 빠져나감");
		return "main/main";
	}
	
	/* 좌석 확인 */
	@RequestMapping(value="SeatCodeConfirm", method=RequestMethod.GET)
	public String thSeatConfirm(String seatcode) {
		return "thRes/seatCodeConfirm";
	}
	
}
