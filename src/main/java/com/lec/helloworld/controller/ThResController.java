package com.lec.helloworld.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.helloworld.service.ThResService;

@Controller
@RequestMapping(value="thRes")
public class ThResController {
	
	@Autowired
	private ThResService thresService;
	
	/* 예약 진행 */
	@RequestMapping(value="thReserve", method=RequestMethod.GET)
	public String thReserveView(String thrdate, String thrcode) {
		return "thRes/thResInsert";
	}
	
}
