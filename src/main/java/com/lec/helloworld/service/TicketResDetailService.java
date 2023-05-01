package com.lec.helloworld.service;

import org.springframework.ui.Model;

import com.lec.helloworld.vo.TicketResDetail;

public interface TicketResDetailService {
	public int tResDetail(TicketResDetail ticketResDetail);
	public TicketResDetail tResGetContent(int trcode, Model model);
	public int tResCancel(int trcode, Model model);
}
