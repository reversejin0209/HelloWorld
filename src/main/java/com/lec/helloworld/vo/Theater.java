package com.lec.helloworld.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Theater {
	private String thcode;
	private String thname;
	private String thcontent;
	private String thtime;
	private String thloc;
	private String thseat;
	private int thprice;
	private String thimg1;
	private int thschedule;
	
}
