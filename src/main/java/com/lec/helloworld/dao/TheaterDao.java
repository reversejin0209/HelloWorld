package com.lec.helloworld.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.helloworld.vo.Theater;

@Mapper
public interface TheaterDao {
	public List<Theater> theaterList(int thschedule);
}
