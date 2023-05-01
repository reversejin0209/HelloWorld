package com.lec.helloworld.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Admin {
	
	// admin
	private String adid;
	private String adpw;
	private String adname;
	private String adnum;
	private String ademail;
	
	// paging
	private int startRow;
	private int endRow;
}
