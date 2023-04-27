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
	public List<Theater> theaterList(int thschedule, String schWord) {
		if(schWord!="" && thschedule == 2) {
			thschedule = Integer.parseInt(schWord.substring(8))%2;
		}
		return theaterDao.theaterList(thschedule);
	}

}
