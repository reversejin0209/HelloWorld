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
	public String ticketList(TicketRes ticketRes, String trdname, Date trddate, String[] trdtype, int[] trdcnt,
			HttpSession session, Model model) {
		trService.ticketReserve(ticketRes, trdname, trddate, trdtype, trdcnt, session, model);
		return "ticket/ticketReservate";
	}

}
