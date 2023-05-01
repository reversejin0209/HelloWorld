package com.lec.helloworld.dao;

import org.apache.ibatis.annotations.Mapper;

import com.lec.helloworld.vo.TicketResDetail;

@Mapper
public interface TicketResDetailDao {
	public int tResDetail(TicketResDetail ticketResDetail);
	public TicketResDetail tResGetContent(int trcode);
	public int tResCancel(int trcode);
}
