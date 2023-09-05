package com.lec.helloworld.controller;

import java.sql.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.helloworld.service.TicketService;
import com.lec.helloworld.vo.Member;
import com.lec.helloworld.vo.TicketRes;
import com.lec.helloworld.vo.TicketResDetail;

@Controller
@RequestMapping(value = "ticket")
public class TicketController {

	@Autowired
	private TicketService tService;

	// 티켓 목록 출력
	@RequestMapping(value = "ticketList", method = RequestMethod.GET)
	public String ticketList(Model model) {
		model.addAttribute("ticketList", tService.ticketList());
		return "ticket/ticketList";
	}

	// 티켓 상세보기
	@RequestMapping(value = "ticketContent", method = RequestMethod.GET)
	public String ticketContent(String tname, Model model) {
		model.addAttribute("ticket", tService.getTicket(tname));
		model.addAttribute("ticketList", tService.ticketContent(tname));
		return "ticket/ticketContent";
	}

	// 티켓 예매
	@RequestMapping(value = "tOrderReserve", method = RequestMethod.GET)
	public String ticketList(TicketRes ticketRes, String trdname, Date trddate, String[] trdtype, int[] trdcnt,
			HttpSession session, Model model) {
		tService.ticketReserve(ticketRes, trdname, trddate, trdtype, trdcnt, session, model);
		model.addAttribute("order", tService.getOrderDetail(0));
		model.addAttribute("ticketList", tService.getTOrderDetail(0));
		return "ticket/ticketReservate";
	}

	// 회원: 마이페이지
	/* 나의 티켓 예매 목록 */
	@RequestMapping(value = "myTicketList", method = { RequestMethod.GET, RequestMethod.POST })
	public String myTicketList(HttpSession session, TicketRes ticketRes, String pageNum, Model model) {
		model.addAttribute("ticketList", tService.tOrderList(session, ticketRes, pageNum, model));
		return "member/myTicketList";
	}

	/* 나의 티켓 상세보기 */
	@RequestMapping(value = "myTicketContent", method = RequestMethod.GET)
	public String myTicketContent(long trcode, Member member, Model model) {
		// 주문 상세
		model.addAttribute("order", tService.getOrderDetail(trcode));
		// 주문 상품 정보
		model.addAttribute("ticketList", tService.getTOrderDetail(trcode));
		return "member/myTicketContent";
	}

	/* 주문 취소 */
	@RequestMapping(value = "tOrderCancel", method = RequestMethod.GET)
	public String myTicketCancel(long trcode, Model model) {
		tService.tOrderCancel(trcode, model);
		return "forward: tOrderList.do";
	}
	
	// 관리자: 마이페이지
	/* 전회원 예매 내역 확인*/
	@RequestMapping(value = "orderTicketList", method = RequestMethod.GET)
	public String orderTicketList(HttpSession session, TicketRes ticketRes, String pageNum, Model model) {
		model.addAttribute("ticketList", tService.tOrderList(session, ticketRes, pageNum, model));
		return "admin/orderTicketList";
	}

	/* 전회원 예매 정보 출력 */
	@RequestMapping(value = "tOrderDetailList", method = RequestMethod.GET)
	public String tOrderDetailList(TicketResDetail ticketResDetail, String pageNum, Model model) {
		model.addAttribute("ticketDetailList", tService.tOrderDetailList(ticketResDetail, pageNum, model));
		return "admin/orderTicketDetailList";
	}

	/* 티켓 사용 */
	@RequestMapping(value = "usedTicket", method = RequestMethod.GET)
	public String usedTicket(int trdcode, String mid, Model model) {
		tService.usedTicket(trdcode, mid);
		return "redirect: tOrderDetailList.do";
	}
}
