package com.lec.helloworld.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.helloworld.service.MemberService;
import com.lec.helloworld.service.TicketService;
import com.lec.helloworld.vo.Member;

@Controller
@RequestMapping(value = "member")
public class MemberController {

	@Autowired
	private MemberService memberService;

	/* 로그인 */
	@RequestMapping(value = "mLogin", method = RequestMethod.GET)
	public String mLoginChkView() {
		return "member/login";
	}

	@RequestMapping(value = "mLogin", method = RequestMethod.POST)
	public String mLoginChk(String mid, String mpw, HttpSession httpSession, String after, Model model) throws UnsupportedEncodingException {
		// String loginResult = memberService.loginChk(mid, mpw, httpSession);
		memberService.loginChk(mid, mpw, httpSession, model);
		
		if(after.equals("")) {
			return "forward:../main.do";
		} else {
			String afterPre = after.substring(0, after.indexOf("=")+1);
			String afterPost = after.substring(after.indexOf("=")+1);
			afterPost = URLEncoder.encode(afterPost, "utf-8");
			return "redirect:" + afterPre + afterPost;
		}
	}

	/* 로그아웃 */
	@RequestMapping(value = "mLogout", method = RequestMethod.GET)
	public String mLogout(String after, HttpSession httpSession) {
		memberService.logout(httpSession);
		return "forward:../"+after;
	}

	/* 회원가입 */
	@RequestMapping(value = "mJoin", method = RequestMethod.GET)
	public String mJoinView() {
		return "member/mJoin";
	}

	@RequestMapping(value = "mJoin", method = RequestMethod.POST)
	public String mJoin(Member member, Model model, HttpSession httpSession) {
		model.addAttribute("joinResult", memberService.memberJoin(member, httpSession));
		memberService.logout(httpSession);
		return "member/login";
	}

	@RequestMapping(value = "mIdConfirm", method = { RequestMethod.GET, RequestMethod.POST })
	public String midConfirm(String mid, Model model) {
		model.addAttribute("idConfirmResult", memberService.memberIdConfirm(mid));
		return "member/mIdConfirm";
	}

	@RequestMapping(value = "mTelConfirm", method = { RequestMethod.GET, RequestMethod.POST })
	public String mTelConfirm(String mtel, Model model) {
		model.addAttribute("telConfirmResult", memberService.memberTelConfirm(mtel));
		return "member/mTelConfirm";
	}

	@RequestMapping(value = "mEmConfirm", method = { RequestMethod.GET, RequestMethod.POST })
	public String mEmConfirm(String mmail, Model model) {
		model.addAttribute("emailConfirmResult", memberService.memberEmConfirm(mmail));
		return "member/mMailConfirm";
	}

	/* 마이페이지 */
	@RequestMapping(value = "mMypage", method = RequestMethod.GET)
	public String mMypage() {
		return "member/mMypage";
	}

	/* 회원정보 수정 */
	@RequestMapping(value = "mModify", method = RequestMethod.GET)
	public String mModifyView() {
		return "member/mModify";
	}

	@RequestMapping(value = "mModify", method = RequestMethod.POST)
	public String mModify(Member member, String oldMpw, Model model, HttpSession httpSession,
			HttpServletRequest request) {
		model.addAttribute("modifyResult", memberService.memberModify(member, oldMpw, httpSession));
		return "main/main";
	}

	/* 회원 탈퇴 */
	@RequestMapping(value = "mWithdrawal", method = { RequestMethod.GET, RequestMethod.POST })
	public String mWithdrawal(String mid, HttpSession httpSession, Model model) {
		model.addAttribute("withdrawalResult", memberService.memberWithdrawal(mid));
		memberService.logout(httpSession);
		return "main/main";
	}

}
