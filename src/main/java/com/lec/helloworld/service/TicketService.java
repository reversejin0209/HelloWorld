package com.lec.helloworld.service;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.lec.helloworld.vo.Ticket;
import com.lec.helloworld.vo.TicketRes;
import com.lec.helloworld.vo.TicketResDetail;

public interface TicketService {

	// 티켓 리스트
	public List<Ticket> ticketList();

	// 티켓 정보 조회
	public Ticket getTicket(String tname);

	// 티켓 상세 옵션 출력
	public List<Ticket> ticketContent(String tname);

	// 주문 추가
	public void ticketReserve(TicketRes ticketRes, String trdname, Date trddate, String[] trdtype, int[] trdcnt,
			HttpSession session, Model model);

	// 회원, 관리자: 주문 목록 출력
	public List<TicketRes> tOrderList(HttpSession session, TicketRes ticketRes, String pageNum, Model model);

	// 주문 정보 조회
	public TicketRes getOrderDetail(long trcode);

	// 주문 내역 조회
	public List<TicketRes> getTOrderDetail(long trcode);

	// 회원: 주문 취소
	public void tOrderCancel(long trcode, Model model);

	// 관리자: 티켓 상품 정보 전체 출력
	public List<TicketResDetail> tOrderDetailList(TicketResDetail ticketResDetail, String pageNum, Model model);

	// 관리자: 입장 시 사용 티켓으로 변경
	public void usedTicket(int trdcode, String mid);
}
