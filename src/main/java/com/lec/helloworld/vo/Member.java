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
	private int    mwith;
	private String grade;
}
