package com.lec.helloworld.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.helloworld.service.At_ReviewService;
import com.lec.helloworld.service.AttractionService;
import com.lec.helloworld.util.Paging;
import com.lec.helloworld.vo.At_Review;
import com.lec.helloworld.vo.Attraction;
import com.lec.helloworld.vo.QnaBoard;

@Controller
@RequestMapping(value = "attraction")
public class AttractionController {
	
	@Autowired
	private AttractionService attractionService;
	
	@Autowired
	private At_ReviewService at_ReviewService;
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
	
	@RequestMapping(value = "atRevList", method = { RequestMethod.GET, RequestMethod.POST })
	public String atRevList(String pageNum, At_Review at_Review, Model model) {
		model.addAttribute("arvList", at_ReviewService.atRevList(pageNum, at_Review, model));
		// 평점 옵션
		Map ratingOptions = new HashMap();
		ratingOptions.put(0, "☆☆☆☆☆");
		ratingOptions.put(1, "★☆☆☆☆");
		ratingOptions.put(2, "★★☆☆☆");
		ratingOptions.put(3, "★★★☆☆");
		ratingOptions.put(4, "★★★★☆");
		ratingOptions.put(5, "★★★★★");
		model.addAttribute("ratingOptions", ratingOptions);
		return "attraction/atRevList";
	}
	
	@RequestMapping(value="atRevContent", method=RequestMethod.GET)
	public String atRevContent(int arvnum, Model model) {
		model.addAttribute("atRevContent", at_ReviewService.atRevContent(arvnum));
		// 평점 옵션
		Map ratingOptions = new HashMap();
		ratingOptions.put(0, "☆☆☆☆☆");
		ratingOptions.put(1, "★☆☆☆☆");
		ratingOptions.put(2, "★★☆☆☆");
		ratingOptions.put(3, "★★★☆☆");
		ratingOptions.put(4, "★★★★☆");
		ratingOptions.put(5, "★★★★★");
		model.addAttribute("ratingOptions", ratingOptions);
		return "attraction/atRevContent";
	}
	
	@RequestMapping(value = "atRevWrite", method = RequestMethod.GET)
	public String atRevWrite() {
		return "attraction/atRevWrite";
	}

	@RequestMapping(value = "atRevWrite", method = RequestMethod.POST)
	public String atRevWrite(At_Review at_Review, HttpServletRequest request, Model model) {
		at_ReviewService.atRevWrite(at_Review, request, model);
		return "forward:atRevList.do";
	}
	
	@RequestMapping(value = "atRevDelete", method = RequestMethod.GET)
	public String atRevDelete(int arvnum, Model model) {
		at_ReviewService.atRevDelete(arvnum, model);
		return "forward:atRevList.do";
	}
}