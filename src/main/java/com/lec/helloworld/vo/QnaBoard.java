package com.lec.helloworld.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QnaBoard {
	
	// QnaBoard
	private int qanum;
	private String mid;
	private String adid;
	private String qacat;
	private String qatitle;
	private String qacontent;
	private String qapw;
	private Timestamp qardate;
	private int qahit;
	private int qagroup;
	private int qastep;
	private int qaindent;
	private String qaip;
	
	// member & admin
	private String writer;
	
	// search
	private String schItem;
	private String schWord;
	
	// paging
	private int startRow;
	private int endRow;
	
}
