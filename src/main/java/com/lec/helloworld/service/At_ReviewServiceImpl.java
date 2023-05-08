package com.lec.helloworld.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.lec.helloworld.dao.At_ReviewDao;
import com.lec.helloworld.util.Paging;
import com.lec.helloworld.vo.At_Review;
import com.lec.helloworld.vo.Member;

@Service
public class At_ReviewServiceImpl implements At_ReviewService {
	
	@Autowired
	private At_ReviewDao at_ReviewDao;
	
	@Override
	public List<At_Review> atRevList(String pageNum, At_Review at_Review, Model model) {
		Paging paging = new Paging(at_ReviewDao.totCntatRev(at_Review), pageNum, 5, 10);
		at_Review.setStartRow(paging.getStartRow());
		at_Review.setEndRow(paging.getEndRow());
		model.addAttribute("paging", paging);
		return at_ReviewDao.atRevList(at_Review);
	}

	@Override
	public int totCntatRev(At_Review at_Review) {						
		return at_ReviewDao.totCntatRev(at_Review);
	}

	@Override
	public At_Review atRevContent(int arvnum) {
		at_ReviewDao.hitUpatRev(arvnum);
		return at_ReviewDao.atRevContent(arvnum);
	}

	@Override
	public void atRevWrite(At_Review at_Review, HttpServletRequest request,  Model model) {
		at_Review.setArvip(request.getRemoteAddr());
		String mid = null;
		Member member = (Member)request.getSession().getAttribute("member");
		if(member!=null) {
			mid = member.getMid();
		}
		at_Review.setMid(mid);
		at_Review.setArvip(request.getLocalAddr());
		try {
			at_ReviewDao.atRevWrite(at_Review);
			model.addAttribute("successMsg", "리뷰 작성이 완료되었습니다");
			System.out.println(at_Review);
		} catch (Exception e) {
			System.out.println(at_Review);
			model.addAttribute("failMsg", "리뷰 작성에 실패하였습니다");
			System.out.println(e.getMessage());
		}
	}
	
	@Override
	public int atRevDelete(int arvnum, Model model) {
		int result = 0;
		try {
			result = at_ReviewDao.atRevDelete(arvnum);
			model.addAttribute("successMsg", "리뷰 삭제가 완료되었습니다");
		} catch (Exception e) {
			model.addAttribute("failMsg", "리뷰 삭제가 실패했습니다");
		}
		return result;
	}
}
