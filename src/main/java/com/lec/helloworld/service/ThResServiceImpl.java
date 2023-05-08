package com.lec.helloworld.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.lec.helloworld.dao.ThResDao;
import com.lec.helloworld.util.Paging;
import com.lec.helloworld.vo.ThRes;

@Service
public class ThResServiceImpl implements ThResService {
	
	@Autowired
	private ThResDao thresDao;
	
	@Override
	public boolean thResInsert(ThRes thres, String thrdateStr, String thprice, String[] seatCode) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		thres.setThrtotprice(Integer.parseInt(thprice) * seatCode.length);
		try {
			thres.setThrdate(formatter.parse(thrdateStr));
		} catch (ParseException e) {
			System.out.println(e.getMessage());
		}
		Integer tempResult = thresDao.thResInsert(thres);
		if(tempResult == 1) {
			thres.setThrcode(thresDao.thrcodeChk(thres));
		} else {
			System.out.println(thresDao.thResInsert(thres));
			return false;
		}
		System.out.println("thrcode 확인");
		int arrayCnt = seatCode.length;
		System.out.println(arrayCnt);
		int reserveCnt = 0;
		for(String seatcode : seatCode) {
			thres.setSeatcode(seatcode);
			System.out.println("좌석 예약 정보 : " + thres);
			reserveCnt += thresDao.seatReserve(thres);
		}
		System.out.println("for문 완료");
		if(arrayCnt == reserveCnt) {
			return true;
		} else {
		 	return false;
		}
	}
	
	@Override
	public int reserveChk(ThRes thres, String thrdatetemp) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		try {
			thres.setThrdate(formatter.parse(thrdatetemp));
		} catch (ParseException e) {
			System.out.println(e.getMessage());
		}
		return thresDao.reserveChk(thres);
	}

	@Override
	public List<String> seatList(ThRes thres) {
		ArrayList<String> seatDbList = (ArrayList<String>) thresDao.seatList(thres);
		ArrayList<String> seats = new ArrayList<String>();
		for(int i=0 ; i<40 ; i++) {
			if(i < 10) {
				if(seatDbList.contains("A"+(i+1))) {
					//System.out.print("a"+(i+1)+"는 예약됨 ");
					seats.add("A"+i);
				} else {
					//System.out.print("a"+(i+1)+"는 예약안 됨 ");
					seats.add("");
				}
			} else if(i < 20) {
				if(seatDbList.contains("B"+((i-10)+1))) {
					//System.out.print("a"+(i+1)+"는 예약됨 ");
					seats.add("B"+i);
				} else {
					//System.out.print("a"+(i+1)+"는 예약안 됨 ");
					seats.add("");
				}
			} else if(i < 30) {
				if(seatDbList.contains("C"+((i-20)+1))) {
					//System.out.print("a"+(i+1)+"는 예약됨 ");
					seats.add("C"+i);
				} else {
					//System.out.print("a"+(i+1)+"는 예약안 됨 ");
					seats.add("");
				}
			} else if(i < 40) {
				if(seatDbList.contains("D"+((i-30)+1))) {
					//System.out.print("a"+(i+1)+"는 예약됨 ");
					seats.add("D"+i);
				} else {
					//System.out.print("a"+(i+1)+"는 예약안 됨 ");
					seats.add("");
				}
			}
		}
		return seats;
	}

	@Override
	public List<ThRes> thResList(ThRes thres, String pageNum, Model model) {
		Paging paging = new Paging(thresDao.thResListCnt(thres), pageNum, 5, 5);
		thres.setStartRow(paging.getStartRow());
		thres.setEndRow(paging.getEndRow());
		model.addAttribute("paging", paging);
		return thresDao.thResList(thres);
	}

	@Override
	public ThRes thResContent(String thrcode, Model model) {
		return thresDao.thResContent(thrcode);
	}

	@Override
	public List<ThRes> thResContentSeat(String thrcode, Model model) {
		return thresDao.thResContentSeat(thrcode);
	}

	@Override
	public boolean thResCancel(String thrcode) {
		int cancelChk = thresDao.thResCancelChk(thrcode);
		if(cancelChk != 0) {
			thresDao.thResCancelSeat(thrcode);
			thresDao.thResCancel(thrcode);
			return true;
		} else {
			return false;
		}
	}

	@Override
	public int theaterDelete(String thcode) {
		List<ThRes> thrcodeList = thresDao.getThrcode(thcode);
		System.out.println("서비스 진입 list : " + thrcodeList);
		int thrcodelength = thrcodeList.size();
		int templength = 0;
		for(ThRes thrcode : thrcodeList) {
			thresDao.deleteSeat(thrcode.getThrcode());
			thresDao.deleteThRev(thrcode.getThrcode());
			templength += 1;
		}
		System.out.println("for문 완료");
		if(thrcodelength==templength) {
			thresDao.deleteThRes(thcode);
		}
		System.out.println("if문 완료");
		return thresDao.theaterDelete(thcode);
	}

}
