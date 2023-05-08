package com.lec.helloworld.service;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.lec.helloworld.dao.TicketDao;
import com.lec.helloworld.dao.TicketResDao;
import com.lec.helloworld.dao.TicketResDetailDao;
import com.lec.helloworld.util.Paging;
import com.lec.helloworld.vo.Member;
import com.lec.helloworld.vo.Ticket;
import com.lec.helloworld.vo.TicketRes;
import com.lec.helloworld.vo.TicketResDetail;

@Service
public class TicketServiceImpl implements TicketService {

	@Autowired
	TicketDao ticketDao;
	
	@Autowired
	TicketResDao ticketResDao;
	
	@Autowired
	TicketResDetailDao ticketResDetailDao;
	
	@Override
	public List<Ticket> ticketList() {
		return ticketDao.ticketList();
	}

	@Override
	public Ticket getTicket(String tname) {
		return ticketDao.getTicket(tname);
	}
	
	@Override
	public List<Ticket> ticketContent(String tname) {
		return ticketDao.ticketContent(tname);
	}

	@Override
	public void ticketReserve(TicketRes ticketRes, String trdname, Date trddate, String[] trdtype, int[] trdcnt,
			HttpSession session, Model model) {
		// 티켓 주문
		Member member = (Member)session.getAttribute("member");
		ticketRes.setMid(member.getMid());
		try {
			// 주문 생성
			ticketResDao.tOrderReserve(ticketRes);

			// 주문 내역 추가
			TicketResDetail ticket = new TicketResDetail();
			ticket.setTrdname(trdname);
			ticket.setTrddate(trddate);
			for(int i = 0; i < trdtype.length; i++) {
				ticket.setTrdtype(trdtype[i]);
				ticket.setTrdcnt(trdcnt[i]);
				ticketResDetailDao.addTOrderDetail(ticket);
			}
			model.addAttribute("successMsg", "티켓 구매가 완료되었습니다.");
		} catch (Exception e) {
			model.addAttribute("failMsg", "티켓 구매가 실패했습니다");
			System.out.println(e.getMessage());
		}
	}

	@Override
	public List<TicketRes> tOrderList(HttpSession session, TicketRes ticketRes, String pageNum, Model model) {
		Member member = (Member)session.getAttribute("member");
		ticketRes.setMid(member.getMid());
		
		// 주문 목록 출력
		Paging paging = new Paging(ticketResDao.tOrderTotCnt(ticketRes), pageNum, 5, 10);
		ticketRes.setStartRow(paging.getStartRow());
		ticketRes.setEndRow(paging.getEndRow());
		model.addAttribute("paging", paging);
		return ticketResDao.tOrderList(ticketRes);
	}


	@Override
	public TicketRes getOrderDetail(long trcode) {
		// 주문 정보 조회
		return ticketResDao.getOrderDetail(trcode);
	}
	
	@Override
	public List<TicketRes> getTOrderDetail(long trcode) {
		// 주문정보 > 주문 내역 조회
		return ticketResDetailDao.getTOrderDetail(trcode);
	}

	@Override
	public void tOrderCancel(long trcode, Model model) {
		// 주문 취소
		try {
			ticketResDao.tOrderCancel(trcode);
			model.addAttribute("successMsg", "주문 취소가 완료되었습니다.");
		} catch (Exception e) {
			model.addAttribute("failMsg", "주문 취소가 실패했습니다. 1:1 게시판에 문의해 주세요");
		}
	}

	@Override
	public int usedTicket(int trdcode) {
		// 사용 티켓으로 변경
		return ticketResDetailDao.usedTicket(trdcode);
	}
	
}
