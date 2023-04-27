package com.lec.helloworld.service;

import java.util.List;

import com.lec.helloworld.vo.Theater;

public interface TheaterService {
	public List<Theater> theaterList(int thschedule, String schWord);
}
