package com.lec.helloworld.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TicketRes {

	private String trcode;
	private String mid;
	private Timestamp trorderdate;
	private int totprice;
	private boolean trresult;
}
