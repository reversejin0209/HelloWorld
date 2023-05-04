package com.lec.helloworld.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.helloworld.service.AdminService;
import com.lec.helloworld.vo.Member;

@Controller
@RequestMapping(value = "admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	// 관리자 로그인, 로그아웃
	@RequestMapping(value = "adLogin", method = RequestMethod.GET)
	public String adloginCheck() {
		return "admin/adLogin";
	}
	@RequestMapping(value = "adLogin", method = RequestMethod.POST)
	public String adloginCheck(String adid, String adpw, String after, Model model , HttpSession httpsession) {
		String adLoginResult = adminService.adLoginCheck(adid, adpw, httpsession);
		if(adLoginResult.equals("관리자 로그인성공")) {
			return "main/main";
		} else {
			model.addAttribute("adLoginResult", adLoginResult);
			return "main/main";
		}
	}
	
	@RequestMapping(value = "adLogout", method=RequestMethod.GET)
	public String adLogout(HttpSession httpSession) {
		adminService.adLogout(httpSession);
		return "main/main";
	}

	// 관리자 페이지 이동
	@RequestMapping(value = "aMypage", method=RequestMethod.GET)
	public String aMypage(HttpSession httpSession) {
		return "admin/aMypage";
	}
	
	@RequestMapping(value = "allView", method=RequestMethod.GET)
	public String memberList(Member member, String pageNum, Model model) {
		model.addAttribute("memberList", adminService.memberList(pageNum, member, model));
		return "admin/allView";
	}
	@RequestMapping(value = "deleteMember", method=RequestMethod.GET)
	public String deleteMember(String mid, Model model) {
		model.addAttribute("dtMember", adminService.deleteMember(mid, model));
		return "main/main";
	}
}