package com.lec.helloworld.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TicketResDetail {

	private int trdcode;
	private String trcode;
	private String trdname;
	private String trdtype;
	private int trdcnt;
	private Date trddate;
	private int trdresult;

	// ticket
	private String timg;

	// ticket_res
	private String mid;
	private int trresult;

	// paging
	private int startRow;
	private int endRow;
}
