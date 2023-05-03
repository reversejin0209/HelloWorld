package com.lec.helloworld.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.helloworld.vo.Theater;

@Mapper
public interface TheaterDao {
	public List<Theater> theaterList(int thschedule);
	public Theater theaterContent(String thname);
	public int theaterInsert(Theater theater);
	public int theaterCntChk(int thschedule);
	public int theaterDelete(String thcode);
}
