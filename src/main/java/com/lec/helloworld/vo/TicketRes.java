package com.lec.helloworld.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TicketRes {

	// ticketRes
	private long trcode;
	private String mid;
	private Timestamp trorderDate;
	private int trtotPrice;
	private int trresult;
	
	// ticket
	private String tname;
	private String timg;
	
	// member
	private String mname;
	private String mtel;
	private String mmail;
	
	// paging
	private int startRow;
	private int endRow;
}
