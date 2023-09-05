package com.lec.helloworld.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.helloworld.vo.ThRes;

@Mapper
public interface ThResDao {
	public int thResInsert(ThRes thres);
	public int seatReserve(ThRes thres);
	public String thrcodeChk(ThRes thres);
	public int reserveChk(ThRes thres);
	public List<String> seatList(ThRes thres);
	public int seatChk(ThRes thres);
	public int thResListCnt(ThRes thres);
	public List<ThRes> thResList(ThRes thres);
	public ThRes thResContent(String thrcode);
	public List<ThRes> thResContentSeat(String thrcode);
	public int thResCancelChk(String thrcode);
	public int thResCancelSeat(String thrcode);
	public int thResCancel(String thrcode);
	public List<ThRes> getThrcode(String thcode);
	public int deleteSeat(String thrcode);
	public int deleteThRev(String thrcode);
	public int deleteThRes(String thcode);
	public int theaterDelete(String thcode);
}
