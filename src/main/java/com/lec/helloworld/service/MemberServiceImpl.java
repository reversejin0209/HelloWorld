package com.lec.helloworld.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.helloworld.dao.MemberDao;
import com.lec.helloworld.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao memberDao;
	
	@Override
	public Member memberGetDetail(String mid) {
		return memberDao.memberGetDetail(mid);
	}

	@Override
	public String loginChk(String mid, String mpw, HttpSession httpSession) {
		Member member = memberDao.memberGetDetail(mid);
		String result = null;
		if(member != null && member.getMpw().equals(mpw)) {
			result = "로그인 성공";
			httpSession.setAttribute("member", member);
		} else {
			result = "ID 혹은 PW 오류";
		}
		return result;
	}

	@Override
	public void logout(HttpSession httpSession) {
		httpSession.invalidate();
	}

	@Override
	public int memberJoin(Member member) {
		int result = memberDao.memberJoin(member);
		return result;
	}

	@Override
	public int memberIdConfirm(String mid) {
		return memberDao.memberIdConfirm(mid);
	}

	@Override
	public int memberTelConfirm(String mtel) {
		return memberDao.memberTelConfirm(mtel);
	}

	@Override
	public int memberEmConfirm(String mmail) {
		return memberDao.memberEmConfirm(mmail);
	}

}
