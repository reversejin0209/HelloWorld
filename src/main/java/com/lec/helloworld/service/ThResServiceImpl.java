package com.lec.helloworld.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.helloworld.dao.ThResDao;
import com.lec.helloworld.vo.ThRes;

@Service
public class ThResServiceImpl implements ThResService {
	
	@Autowired
	private ThResDao thresDao;
	
	@Override
	public boolean thResInsert(ThRes thres, String thrdateStr, String thprice, String[] seatCode) {
		System.out.println("서비스 진입");
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		thres.setThrtotprice(Integer.parseInt(thprice) * seatCode.length);
		try {
			thres.setThrdate(formatter.parse(thrdateStr));
		} catch (ParseException e) {
			System.out.println(e.getMessage());
		}
		Integer tempResult = thresDao.thResInsert(thres);
		System.out.println("예약 테이블 인서트");
		if(tempResult == 1) {
			thres.setThrcode(thresDao.thrcodeChk(thres));
		} else {
			System.out.println(thresDao.thResInsert(thres));
			return false;
		}
		System.out.println("thrcode 셋팅");
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
		System.out.println(thrdatetemp);
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		try {
			thres.setThrdate(formatter.parse(thrdatetemp));
		} catch (ParseException e) {
			System.out.println(e.getMessage());
		}
		System.out.println(thres.getThrdate());
		return thresDao.reserveChk(thres);
	}

	@Override
	public List<String> seatList(ThRes thres) {
		ArrayList<String> seatDbList = (ArrayList<String>) thresDao.seatList(thres);
		System.out.println("seatDbList : " + seatDbList);
		ArrayList<String> seats = new ArrayList<String>();
		for(int i=0 ; i<10 ; i++) {
			if(i>0) {
				if(seatDbList.contains("A"+(i+1))) {
					//System.out.print("a"+(i+1)+"는 예약됨 ");
					seats.add("A"+i);
				} else {
					//System.out.print("a"+(i+1)+"는 예약안 됨 ");
					seats.add("");
				}
			} else if(i>10) {
				if(seatDbList.contains("B"+((i-10)+1))) {
					//System.out.print("a"+(i+1)+"는 예약됨 ");
					seats.add("B"+i);
				} else {
					//System.out.print("a"+(i+1)+"는 예약안 됨 ");
					seats.add("");
				}
			} else if(i>20) {
				if(seatDbList.contains("C"+((i-20)+1))) {
					//System.out.print("a"+(i+1)+"는 예약됨 ");
					seats.add("C"+i);
				} else {
					//System.out.print("a"+(i+1)+"는 예약안 됨 ");
					seats.add("");
				}
			} else if(i>30) {
				if(seatDbList.contains("D"+((i-30)+1))) {
					//System.out.print("a"+(i+1)+"는 예약됨 ");
					seats.add("D"+i);
				} else {
					//System.out.print("a"+(i+1)+"는 예약안 됨 ");
					seats.add("");
				}
			}
		}
		System.out.println("seats : " + seats);
		return seats;
	}

}
