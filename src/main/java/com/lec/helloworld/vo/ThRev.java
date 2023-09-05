package com.lec.helloworld.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ThRev {
	private int thrnum;
	private String mid;
	private String thrcode;
	private String thrtitle;
	private String thrcontent;
	private Date thrrdate;
	private String thcode;
	// 페이징
	private int startRow;
	private int endRow;
	// 메인 출력 용도
	private String thname;
}
