package com.lec.helloworld.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.helloworld.vo.Attraction;
@Mapper
public interface AttractionDao {
	public List<Attraction> mainAtc(Attraction attraction);
	public List<Attraction> ListAtc(Attraction attraction);
	public int totCntAtc(Attraction attraction);
	public Attraction DetailAtc(int atcode);
	public int InsertAtc(Attraction attraction);
	public int ModifyAtc(Attraction attraction);
	public int DeleteAtc(int atcode);
}
