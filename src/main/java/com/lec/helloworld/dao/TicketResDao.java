package com.lec.helloworld.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.ui.Model;

import com.lec.helloworld.vo.TicketRes;

@Mapper
public interface TicketResDao {
	public int ticketReserve(TicketRes ticketRes, Model model);
	public List<TicketRes> tOrderList(TicketRes ticketRes, String pageNum, Model model);
	public int tOrderTotCnt(String mid);
}
