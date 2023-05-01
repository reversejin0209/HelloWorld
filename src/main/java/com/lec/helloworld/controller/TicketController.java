package com.lec.helloworld.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.helloworld.service.TicketService;

@Controller
@RequestMapping(value = "ticket")
public class TicketController {
	
	@Autowired
	private TicketService tService;

	@RequestMapping(value = "ticketList", method = RequestMethod.GET)
	public String ticketList(Model model) {
		model.addAttribute("ticketList", tService.ticketList());
		return "ticket/ticketList";
	}
	
	@RequestMapping(value = "ticketContent", method = RequestMethod.GET)
	public String ticketContent(String tname, Model model) {
		model.addAttribute("ticket", tService.getTicket(tname));
		model.addAttribute("ticketType", tService.ticketContent(tname));
		return "ticket/ticketContent";
	}
}
