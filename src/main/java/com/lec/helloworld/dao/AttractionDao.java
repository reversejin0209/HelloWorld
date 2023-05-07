package com.lec.helloworld.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.helloworld.vo.Attraction;
@Mapper
public interface AttractionDao {
	public List<Attraction> listAtc(Attraction attraction);
	public int totCntAtc(Attraction attraction);
	public Attraction detailAtc(int atcode);
	public int insertAtc(Attraction attraction);
	public int modifyAtc(Attraction attraction);
	public int deleteAtc(int atcode);
}