package com.lec.helloworld.service;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.lec.helloworld.vo.TicketRes;

public interface TicketResService {
	// 주문 추가
	public void ticketReserve(TicketRes ticketRes, String trdname, Date trddate, String[] trdtype, int[] trdcnt, HttpSession session, Model model);
	
	// 회원, 관리자: 주문 목록 출력
	public List<TicketRes> tOrderList(HttpSession session, TicketRes ticketRes, String pageNum, Model model);
	
	// 주문 정보 조회
	public TicketRes getOrderDetail(long trcode);
	
	// 주문 내역 조회
	public List<TicketRes> getTOrderDetail(long trcode);
	
	// 회원: 주문 취소
	public void tOrderCancel(long trcode, Model model);
	
	// 관리자: 입장 시 사용 티켓으로 변경
	public int usedTicket(int trdcode);

	
}
