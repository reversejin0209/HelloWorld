package com.lec.helloworld.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Ticket {
	
	private String tcode;
	private String tname;
	private String tsub;
	private String ttype;
	private int tprice;
	private String tcontent;
	private String timg;
}
