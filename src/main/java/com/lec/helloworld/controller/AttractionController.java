package com.lec.helloworld.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.helloworld.service.AttractionService;
import com.lec.helloworld.util.Paging;
import com.lec.helloworld.vo.Attraction;
import com.lec.helloworld.vo.QnaBoard;

@Controller
@RequestMapping(value = "attraction")
public class AttractionController {
	
	@Autowired
	private AttractionService attractionService;
	
	/* 메인페이지용
	 * @RequestMapping(value="mainAtc", method=RequestMethod.GET) public String
	 * mainAtc(Attraction attraction, String pageNum, Model model) {
	 * model.addAttribute("mainAtc", attractionService.mainAtc(attraction,
	 * pageNum)); model.addAttribute("paging", new
	 * Paging(attractionService.totCntAtc(attraction), pageNum, 10, 10)); return
	 * "attraction/listAtc"; }
	 */
	@RequestMapping(value="listAtc", method={ RequestMethod.GET, RequestMethod.POST })
	public String listAtc(Attraction attraction, String pageNum, Model model) {
		model.addAttribute("listAtc", attractionService.listAtc(attraction, pageNum, model));
		return "attraction/listAtc";
	}
	
	@RequestMapping(value="detailAtc", method=RequestMethod.GET)
	public String detailAtc(int atcode, Model model) {
		model.addAttribute("detailAtc", attractionService.detailAtc(atcode));
		return "attraction/detailAtc";
	}
	
	@RequestMapping(value = "insertAtc", method = RequestMethod.GET)
	public String insertAtc() {
		return "attraction/insertAtc";
	}

	@RequestMapping(value = "insertAtc", method = RequestMethod.POST)
	public String insertAtc(Attraction attraction, MultipartHttpServletRequest mRequest, Model model) {
		attractionService.insertAtc(attraction, mRequest, model);
		return "forward:listAtc.do";
	}
	
	@RequestMapping(value = "modifyAtc", method = RequestMethod.GET)
	public String modifyAtc(int atcode, Model model) {
		model.addAttribute("modifyAtc", attractionService.detailAtc(atcode));
		return "attraction/modifyAtc";
	}
	
	@RequestMapping(value = "modifyAtc", method = RequestMethod.POST)
	public String modifyAtc(Attraction attraction, MultipartHttpServletRequest mRequest, Model model) {
		attractionService.modifyAtc(attraction, mRequest, model);
		return "forward:listAtc.do";
	}
	
	@RequestMapping(value = "deleteAtc", method = RequestMethod.GET)
	public String deleteAtc(int atcode, Model model) {
		attractionService.deleteAtc(atcode, model);
		return "forward:listAtc.do";
	}
}