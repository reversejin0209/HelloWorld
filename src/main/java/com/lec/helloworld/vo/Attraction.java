package com.lec.helloworld.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Attraction {
	private int atcode;
	private String atname;
	private String atcontent;
	private String ataddr;
	private String atimage;
	private Date atrdate;
	private int atold;
	private int atheight;
	private int atweight;
	private double atlat;
	private double atlng;
	private String atyoutube;
	private int atnop;
	private String adid;
	private String zname;
	
	// paging
	private int startRow;
	private int endRow;
	
	// admin
	private String writer;
	
	// search
	private String schItem;
	private String schWord;
}
