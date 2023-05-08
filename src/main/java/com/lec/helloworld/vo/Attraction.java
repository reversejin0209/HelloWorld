package com.lec.helloworld.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Attraction {
	
	// Attraction
	private int atcode;
	private String atname;
	private String atcontent;
	private String ataddr;
	private String atpost;
	private String atimage;
	private Date atrdate;
	private int atold;
	private int atheight;
	private int atweight;
	private double atlat;
	private double atlng;
	private String atyoutube;
	private int atnop;
	private String zname;
	private String zplace;
	
	// paging
	private int startRow;
	private int endRow;
	
	// search (item & word)
	private String schItem;
	private int schOld;
	private int schHeight;
	private int schAtnop;
}
