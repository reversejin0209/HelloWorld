package com.lec.helloworld.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.lec.helloworld.vo.Admin;
import com.lec.helloworld.vo.Member;


public interface AdminService {
	public Admin getAdmin (String adid);
	public String adLoginCheck(String adid, String adpw,  HttpSession httpsession, Model model);
	public void adLogout (HttpSession httpsession);
	public int memberTotCnt(Member member);
	public List<Member> memberList(String pageNum, Member member, Model model);
	public int deleteMember(String mid, Model model);
}
