package com.lec.helloworld.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.helloworld.service.NoticeService;
import com.lec.helloworld.vo.Notice;

@Controller
public class MainController {
	
   @Autowired
   private NoticeService noticeService;
   
   @RequestMapping(value="main", method = {RequestMethod.GET, RequestMethod.POST})
   public String main(Model model, String pageNum, Notice notice) {
	  model.addAttribute("noticeMain", noticeService.noticeMain(notice, pageNum, model));
      return "main/main";
   }
}
