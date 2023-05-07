package com.lec.helloworld.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.helloworld.vo.At_Review;
@Mapper
public interface At_ReviewDao {
	public List<At_Review> atRevList(At_Review at_Review);
	public int totCntatRev(At_Review at_Review);
	public void hitUpatRev(int arvnum);
	public At_Review atRevContent(int arvnum);
	public int atRevWrite(At_Review at_Review);
	public int atRevDelete(int arvnum);
}
