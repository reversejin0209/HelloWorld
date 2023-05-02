package com.lec.helloworld.service;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.lec.helloworld.vo.TicketRes;

public interface TicketResService {
	// 주문 추가
	public void ticketReserve(TicketRes ticketRes, String trdname, Date trddate, String[] trdtype, int[] trdcnt, HttpSession session, Model model);
	
	// 주문 목록 출력
	public List<TicketRes> tOrderList(TicketRes ticketRes);
	
	// 주문 상세보기 목록 출력
	public List<TicketRes> getTOrderDetail(int trcode);
	
	// 주문 취소
	public int tOrderCancel(int trcode);
	
	// 관리자: 입장 시 사용 티켓으로 변경
	public int usedTicket(int trdcode);
	
}
