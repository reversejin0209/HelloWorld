package com.lec.helloworld.service;

import java.util.List;

import com.lec.helloworld.vo.ThRes;

public interface ThResService {
	public boolean thResInsert(ThRes thres, String thrdateStr, String thprice, String[] seatCode);
	public int reserveChk(ThRes thres, String thrdatetemp);
	public List<String> seatList(ThRes thres);
}
