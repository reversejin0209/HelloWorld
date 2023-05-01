package com.lec.helloworld.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {
	private String mid;
	private String mmail;
	private String mpw;
	private String mname;
	private String mtel;
	private String mvisit;
	private int mwith;

	// member_grade
	private String grade;
	private int lowvi;
	private int highvi;
	private int disc;

	// paging
	private int startRow;
	private int endRow;
}
