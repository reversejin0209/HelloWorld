package com.lec.helloworld.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.helloworld.service.MemberService;
import com.lec.helloworld.service.TicketResService;
import com.lec.helloworld.vo.Member;
import com.lec.helloworld.vo.TicketRes;

@Controller
@RequestMapping(value = "member")
public class MemberController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private TicketResService trservice;

	/* 로그인 */
	@RequestMapping(value = "mLogin", method = RequestMethod.GET)
	public String mLoginChkView() {
		return "member/login";
	}

	@RequestMapping(value = "mLogin", method = RequestMethod.POST)
	public String mLoginChk(String mid, String mpw, Model model, HttpSession httpSession) {
		String loginResult = memberService.loginChk(mid, mpw, httpSession);
		if (loginResult.equals("로그인 성공")) {
			return "main/main";
		} else {
			model.addAttribute("loginResult", loginResult);
			return "main/main";
		}
	}

	/* 로그아웃 */
	@RequestMapping(value = "mLogout", method = RequestMethod.GET)
	public String mLogout(String after, HttpSession httpSession) {
		memberService.logout(httpSession);
		return after;
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

	/* 관리자페이지 */
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

	// 마이페이지
	/* 나의 티켓 예매 목록 */
	@RequestMapping(value = "tOrderList", method = { RequestMethod.GET, RequestMethod.POST })
	public String myTicketList(HttpSession session, TicketRes ticketRes, String pageNum, Model model) {
		model.addAttribute("ticketList", trservice.tOrderList(session, ticketRes, pageNum, model));
		return "member/myTicketList";
	}

	/* 나의 티켓 상세보기 */
	@RequestMapping(value = "tOrderContent", method = RequestMethod.GET)
	public String myTicketContent(long trcode, Model model) {
		model.addAttribute("order", trservice.getOrderDetail(trcode));
		model.addAttribute("ticketList", trservice.getTOrderDetail(trcode));
		return "member/myTicketContent";
	}
	
	/* 주문 취소 */
	@RequestMapping(value = "tOrderCancel", method = RequestMethod.GET)
	public String myTicketCancel(long trcode, Model model) {
		trservice.tOrderCancel(trcode, model);
		return "forward: tOrderList.do";
	}
}
