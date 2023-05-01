package com.lec.helloworld.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "ticket")
public class TicketController {

	@RequestMapping(value = "ticketList", method = RequestMethod.GET)
	public String ticketList() {
		return "ticket/ticketList";
	}
}
