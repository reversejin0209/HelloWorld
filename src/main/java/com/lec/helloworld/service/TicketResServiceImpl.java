package com.lec.helloworld.service;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.lec.helloworld.dao.TicketResDao;
import com.lec.helloworld.dao.TicketResDetailDao;
import com.lec.helloworld.vo.Member;
import com.lec.helloworld.vo.TicketRes;
import com.lec.helloworld.vo.TicketResDetail;

@Service
public class TicketResServiceImpl implements TicketResService {
	
	@Autowired
	TicketResDao ticketResDao;

	@Autowired
	TicketResDetailDao ticketResDetailDao;
	
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
	public List<TicketRes> tOrderList(TicketRes ticketRes) {
		// 주문 목록 출력
		return null;
	}

	@Override
	public List<TicketRes> getTOrderDetail(int trcode) {
		// 주문 상세 목록
		return null;
	}

	@Override
	public int tOrderCancel(int trcode) {
		// 주문 취소
		return 0;
	}

	@Override
	public int usedTicket(int trdcode) {
		// 사용 티켓으로 변경
		return 0;
	}


}
