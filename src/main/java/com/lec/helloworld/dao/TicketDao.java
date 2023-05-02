package com.lec.helloworld.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.helloworld.vo.Ticket;

@Mapper
public interface TicketDao {
	
	// 티켓 목록 출력
	public List<Ticket> ticketList();
	
	// 티켓 상세보기 
	public Ticket getTicket(String tname);
	
	// 티켓 구분(대인, 청소년, 유아) 출력
	public List<Ticket> ticketContent(String tname);
}
