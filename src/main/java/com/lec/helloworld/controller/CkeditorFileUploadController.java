package com.lec.helloworld.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.helloworld.service.AttractionService;
import com.lec.helloworld.service.QnaBoardService;

@Controller
public class CkeditorFileUploadController {

	@Autowired
	private QnaBoardService qnaBoardService;
	
	@Autowired
	private AttractionService attractionService;
	
	@RequestMapping(value="fileupload", method=RequestMethod.POST)
	@ResponseBody
	public void communityImageUpload(HttpServletRequest req, HttpServletResponse resp, MultipartHttpServletRequest multiFile){
		qnaBoardService.imageUpload(req, resp, multiFile);
	}
	
	
	@RequestMapping(value="fileUpAtc", method=RequestMethod.POST)
	@ResponseBody 
	public void attractionImageUpload(HttpServletRequest request,HttpServletResponse response, MultipartHttpServletRequest multiFile) {
	  attractionService.imageUpAtc(request, response, multiFile); }
	 
}
