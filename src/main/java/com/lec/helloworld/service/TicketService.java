package com.lec.helloworld.service;

import java.util.List;

import org.springframework.ui.Model;

import com.lec.helloworld.vo.Ticket;

public interface TicketService {
	public List<Ticket> ticketList();
	public Ticket getTicket(String tname);
	public List<Ticket> ticketContent(String tname);
}
