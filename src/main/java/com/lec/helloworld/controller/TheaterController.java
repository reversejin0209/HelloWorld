package com.lec.helloworld.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.helloworld.service.TheaterService;
import com.lec.helloworld.vo.Theater;

@Controller
@RequestMapping(value="theater")
public class TheaterController {
	
	@Autowired
	private TheaterService theaterService;
	
	@RequestMapping(value="theaterList", method = RequestMethod.GET)
	public String theaterList(int thschedule, String schWord, Model model) {
		model.addAttribute("theaterList", theaterService.theaterList(thschedule, schWord));
		return "theater/theaterList";
	}
	
	@RequestMapping(value="theaterContent", method = RequestMethod.GET)
	public String theaterContent(String thname, Model model) {
		model.addAttribute("thcon", theaterService.theaterContent(thname));
		return "theater/theaterContent";
	}
	
	@RequestMapping(value="theaterInsert", method = RequestMethod.GET)
	public String theaterInsertView() {
		return "theater/theaterInsertView";
	}
	
	@RequestMapping(value="theaterInsert", method = RequestMethod.POST)
	public String theaterInsert(Theater theater, MultipartHttpServletRequest mRequest, Model model) {
		theaterService.theaterInsert(theater, mRequest, model);
		return "admin/aMypage";
	}
	
	@RequestMapping(value="theaterCntChk", method = {RequestMethod.GET, RequestMethod.POST})
	public String theaterCntChk(int thschedule, Model model) {
		model.addAttribute("thConfirmResult", theaterService.theaterCntChk(thschedule));
		return "theater/theaterConfirm";
	}
	
	@RequestMapping(value="theaterDelete", method = RequestMethod.GET)
	public String theaterDelete(String thcode, Model model) {
		model.addAttribute("theaterDelete", theaterService.theaterDelete(thcode));
		return "admin/aMypage";
	}
	
}
