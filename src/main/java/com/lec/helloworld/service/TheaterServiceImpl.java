package com.lec.helloworld.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.helloworld.dao.TheaterDao;
import com.lec.helloworld.vo.Theater;

@Service
public class TheaterServiceImpl implements TheaterService {
	
	@Autowired
	TheaterDao theaterDao;
	private String backupPath = "D:/webPro/project/helloWorld/helloworld/src/main/webapp/theaterFileUp/";
	
	@Override
	public List<Theater> theaterList(int thschedule) {
		return theaterDao.theaterList(thschedule);
	}

}
