package com.lec.helloworld.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.helloworld.dao.ThResDao;
import com.lec.helloworld.vo.ThRes;

@Service
public class thResServiceImpl implements ThResService {
	
	@Autowired
	private ThResDao thresDao;
	
	@Override
	public int thResInsert(ThRes thres) {
		return thresDao.thResInsert(thres);
	}

}
