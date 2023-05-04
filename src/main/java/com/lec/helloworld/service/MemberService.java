package com.lec.helloworld.service;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.lec.helloworld.vo.Member;

public interface MemberService {
	public Member memberGetDetail(HttpSession httpSession);
	public void loginChk(String mid, String mpw, HttpSession httpSession, Model model);
	public void logout(HttpSession httpSession);
	public int memberJoin(Member member, HttpSession httpSession);
	public int memberIdConfirm(String mid);
	public int memberTelConfirm(String mtel);
	public int memberEmConfirm(String mmail);
	public int memberModify(Member member, String oldMpw, HttpSession httpSession);
	public int memberWithdrawal(String mid);
}
