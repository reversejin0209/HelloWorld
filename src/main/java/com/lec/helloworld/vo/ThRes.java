package com.lec.helloworld.vo;

import java.sql.Timestamp;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ThRes {
	
	// THEATER_RES
	private String thrcode;
	private String mid;
	private String thcode;
	private int    thrcnt;
	private Timestamp throrderdate;
	private int    thrreview;
	private int    thrtotprice;
	private Date   thrdate;
	
	// THEATER
	private String thname;
	private String thcontent;
	private String thtime;
	private String thloc;
	private int    thprice;
	
	// THEATER_SEAT
	private String seatcode;
	
	// PAGING
	private int startRow;
	private int endRow;
}
