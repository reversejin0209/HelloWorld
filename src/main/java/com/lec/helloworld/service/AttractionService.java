package com.lec.helloworld.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.helloworld.vo.Attraction;

public interface AttractionService {
	/* public List<Attraction> mainAtc(Attraction attraction, String pageNum); */
	public List<Attraction> listAtc(Attraction attraction, String pageNum, Model model);
	public int totCntAtc(Attraction attraction);
	public Attraction detailAtc(int atcode);
	public void insertAtc(Attraction attraction, MultipartHttpServletRequest mRequest, Model model);
	public void modifyAtc(Attraction attraction, MultipartHttpServletRequest mRequest, Model model);
	public int deleteAtc(int atcode, Model model);
	public void imageUpAtc(HttpServletRequest request, HttpServletResponse response, MultipartHttpServletRequest multiFile);
}

