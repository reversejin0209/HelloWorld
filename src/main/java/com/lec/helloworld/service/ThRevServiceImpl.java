package com.lec.helloworld.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.lec.helloworld.dao.ThResDao;
import com.lec.helloworld.dao.ThRevDao;
import com.lec.helloworld.util.Paging;
import com.lec.helloworld.vo.ThRev;

@Service
public class ThRevServiceImpl implements ThRevService {

	@Autowired
	ThRevDao threvDao;
	
	@Autowired
	ThResDao thresDao;
	
	@Override
	public int thRevWriteView(String thrcode) {
		int resultChk = thresDao.thResCancelChk(thrcode);
		if(resultChk != 1) {
			return 0;
		} else {
			return 1;
		}
	}	
	
	@Override
	public int thRevWrite(ThRev threv) {
		int resultWrite = threvDao.thRevWrite(threv);
		if(resultWrite == 1) {
			return threvDao.thRevWriteUpdate(threv);
		} else {
			return 0;
		}
	}
	
	@Override
	public ThRev thRevContent(ThRev threv) {
		return threvDao.mthRevContent(threv);
	}
	
	@Override
	public List<ThRev> mthRevList(ThRev threv, String pageNum, Model model) {
		Paging paging = new Paging(threvDao.mthRevListTotCnt(threv), pageNum, 5, 5);
		threv.setStartRow(paging.getStartRow());
		threv.setEndRow(paging.getEndRow());
		model.addAttribute("paging", paging);
		return threvDao.mthRevList(threv);
	}

	@Override
	public List<ThRev> thRevList(ThRev threv, String pageNum, Model model) {
		Paging paging = new Paging(threvDao.thRevListTotCnt(threv), pageNum, 5, 5);
		threv.setStartRow(paging.getStartRow());
		threv.setEndRow(paging.getEndRow());
		model.addAttribute("paging", paging);
		return threvDao.thRevList(threv);
	}

	@Override
	public List<ThRev> thRevMainList() {
		return threvDao.thRevMainList();
	}


}
