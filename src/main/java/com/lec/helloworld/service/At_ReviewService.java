package com.lec.helloworld.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.lec.helloworld.vo.At_Review;

public interface At_ReviewService {
	public List<At_Review> atRevList(String pageNum, At_Review at_Review, Model model);
	public int totCntatRev(At_Review at_Review);
	//public void hitUpatRev(int arvnum);
	public At_Review atRevContent(int arvnum);
	public void atRevWrite(At_Review at_Review, HttpServletRequest request, Model model);
	public int atRevDelete(int arvnum, Model model);
}
