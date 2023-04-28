package com.lec.helloworld.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.helloworld.service.TheaterService;

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
	
}
