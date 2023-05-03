package com.lec.helloworld.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Notice {
	
	// notice
	private int nno;
	private String ntitle;
	private String ncontent;
	private Date nrdate;
	private String adid;
	private String adname;
	private String ntype;
	
	// admin
	private String writer;
	
	// search
	private String schItem;
	private String schWord;
	
	// paging
	private int startRow;
	private int endRow;
	
	// pre * next
	private int prewrite;
	private int nextwrite;
}
