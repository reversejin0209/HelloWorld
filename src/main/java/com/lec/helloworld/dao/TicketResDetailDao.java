package com.lec.helloworld.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.helloworld.vo.TicketRes;
import com.lec.helloworld.vo.TicketResDetail;

@Mapper
public interface TicketResDetailDao {
	
	// 주문 상세 목록 추가
	public int addTOrderDetail(TicketResDetail ticketResDetail);
	
	// 주문 내역 조회
	public List<TicketRes> getTOrderDetail(long trcode);
	
	// 관리자: 입장 시 사용 티켓으로 변경
	public int usedTicket(int trdcode);
	
}
