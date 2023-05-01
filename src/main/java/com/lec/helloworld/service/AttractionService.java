package com.lec.helloworld.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.helloworld.vo.Attraction;

public interface AttractionService {
	public List<Attraction> mainAtc(Attraction attraction, String pageNum);
	public List<Attraction> ListAtc(Attraction attraction, String pageNum);
	public int totCntAtc(Attraction attraction);
	public Attraction DetailAtc(int atcode);
	public int InsertAtc(Attraction attraction, MultipartHttpServletRequest mRequest);
	public int ModifyAtc(Attraction attraction, MultipartHttpServletRequest mRequest);
	public int DeleteAtc(int atcode);
}
