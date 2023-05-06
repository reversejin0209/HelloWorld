package com.lec.helloworld.service;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.helloworld.vo.ThRes;
import com.lec.helloworld.vo.Theater;

public interface TheaterService {
	public List<Theater> theaterList(int thschedule, String schDate);
	public Theater theaterContent(String thname, String schDate, String thcode, int thseat);
	public void theaterInsert(Theater theater, MultipartHttpServletRequest mRequest, Model model);
	public int theaterCntChk(int thschedule);
	public int theaterDelete(String thcode);
	public int seatChk(ThRes thres, String schDate);
}
