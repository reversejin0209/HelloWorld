package com.lec.helloworld.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;

import com.lec.helloworld.vo.TicketRes;
import com.lec.helloworld.vo.TicketResDetail;

@Mapper
public interface TicketResDao {

	// 주문 추가
	public int tOrderReserve(TicketRes ticketRes);
	
	// 주문 조회
	public List<TicketRes> tOrderList();
	
	// 주문 총 수량
	public int tOrderTotCnt(String mid);
	
	// 주문 취소
	public int tOrderCancel(int trcode);
	
}
