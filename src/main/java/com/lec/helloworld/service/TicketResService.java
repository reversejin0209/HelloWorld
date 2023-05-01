package com.lec.helloworld.service;

import java.util.List;

import org.springframework.ui.Model;

import com.lec.helloworld.vo.TicketRes;

public interface TicketResService {
	public int ticketReserve(TicketRes ticketRes);
	public List<TicketRes> tOrderList(TicketRes ticketRes, Model model);
	// public int tOrderTotCnt(String mid);
}
