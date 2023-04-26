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
	private String thrcode;
	private String thrtitle;
	private String thrcontent;
	private Date thrrdate;
}
