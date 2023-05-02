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
	private boolean trdresult;
}
