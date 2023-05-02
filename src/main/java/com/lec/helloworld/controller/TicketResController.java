package com.lec.helloworld.controller;

import java.sql.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.helloworld.service.TicketResService;
import com.lec.helloworld.vo.Member;
import com.lec.helloworld.vo.TicketRes;

@Controller
@RequestMapping(value = "ticketRes")
public class TicketResController {

	@Autowired
	private TicketResService trService;
	
	// 티켓 예약 주문
	@RequestMapping(value = "tOrderReserve", method = RequestMethod.GET)
	public String ticketList(TicketRes ticketRes, String trdname, Date trddate, String[] trdtype, int[] trdcnt, HttpSession session, Model model) {
		Member member = (Member)session.getAttribute("member");

		// 주문 생성
		if(member != null) {
			trService.ticketReserve(ticketRes, trdname, trddate, trdtype, trdcnt, session, model);
		} else {
			model.addAttribute("failMsg", "티켓 구매 서비스는 로그인 후 이용 가능합니다.");
			return "member/login";
		}
		return "ticket/test";
	}
	
}
