package com.lec.helloworld.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.helloworld.vo.Ticket;

@Mapper
public interface TicketDao {
	public List<Ticket> ticketList();
	public Ticket getTicket(String tname);
	public List<Ticket> ticketContent(String tname);
}
