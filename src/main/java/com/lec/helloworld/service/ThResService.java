package com.lec.helloworld.service;

import java.util.List;

import org.springframework.ui.Model;

import com.lec.helloworld.vo.ThRes;

public interface ThResService {
	public boolean thResInsert(ThRes thres, String thrdateStr, String thprice, String[] seatCode);
	public int reserveChk(ThRes thres, String thrdatetemp);
	public List<String> seatList(ThRes thres);
	public List<ThRes> thResList(ThRes thres, String pageNum, Model model);
	public ThRes thResContent(String thrcode, Model model);
	public List<ThRes> thResContentSeat(String thrcode, Model model);
	public boolean thResCancel(String thrcode);
	public int theaterDelete(String thcode);
}
