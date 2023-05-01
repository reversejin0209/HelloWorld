package com.lec.helloworld.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.lec.helloworld.dao.TicketDao;
import com.lec.helloworld.vo.Ticket;

@Service
public class TicketServiceImpl implements TicketService {

	@Autowired
	TicketDao ticketDao;
	
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


}
