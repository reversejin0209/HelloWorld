package com.lec.helloworld.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.helloworld.service.AttractionService;
import com.lec.helloworld.util.Paging;
import com.lec.helloworld.vo.Attraction;

@Controller
@RequestMapping(value = "attraction")
public class AttractionController {
	
	@Autowired
	private AttractionService attractionService;
	
	@RequestMapping(value="mainAtc", method=RequestMethod.GET)
	public String mainAtc(Attraction attraction, String pageNum, Model model) {
		model.addAttribute("mainAtc", attractionService.mainAtc(attraction, pageNum));
		model.addAttribute("paging", new Paging(attractionService.totCntAtc(attraction), pageNum, 10, 10));
		return "attraction/listAtc";
	}
	@RequestMapping(value="listAtc", method=RequestMethod.GET)
	public String ListAtc(Attraction attraction, String pageNum, Model model) {
		model.addAttribute("ListAtc", attractionService.ListAtc(attraction, pageNum));
		model.addAttribute("paging", new Paging(attractionService.totCntAtc(attraction), pageNum, 10, 10));
		return "attraction/listAtc";
	}
	@RequestMapping(value="detailAtc", method=RequestMethod.GET)
	public String DetailAtc(int atcode, Model model) {
		model.addAttribute("detailAtc", attractionService.DetailAtc(atcode));
		return "attraction/detailAtc";
	}
	
}