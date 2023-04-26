package com.lec.helloworld.service;

import javax.servlet.http.HttpSession;

import com.lec.helloworld.vo.Member;

public interface MemberService {
	public Member memberGetDetail(String mid);
	public String loginChk(String mid, String mpw, HttpSession httpSession);
	public void logout(HttpSession httpSession);
	public int memberJoin(Member member, HttpSession httpSession);
	public int memberIdConfirm(String mid);
	public int memberTelConfirm(String mtel);
	public int memberEmConfirm(String mmail);
	public int memberModify(Member member, HttpSession httpSession);
	public int memberWithdrawal(String mid);
}
