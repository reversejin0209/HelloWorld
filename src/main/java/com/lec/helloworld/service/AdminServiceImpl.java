package com.lec.helloworld.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.helloworld.dao.AdminDao;
import com.lec.helloworld.dao.MemberDao;
import com.lec.helloworld.util.Paging;
import com.lec.helloworld.vo.Admin;
import com.lec.helloworld.vo.Member;
@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private QnaBoardService qBoardService;
	
	@Override 
	public Admin getAdmin(String adid) { // 관리자 아이디로 관리자 정보 받기
		return adminDao.getAdmin(adid);
	}
	
	@Override // 관리자 로그인 확인
	public String adLoginCheck(String adid, String adpw, HttpSession httpsession, Model model) {
		// 
		Admin admin = adminDao.getAdmin(adid);
		String result = null;
		if(admin != null && admin.getAdpw().equals(adpw)) {
			result = "로그인 성공";
			httpsession.setAttribute("admin", admin);
		}else {
			result = "아이디 또는 비밀번호 실패";
		}
		return result;
	}

	@Override
	public void adLogout(HttpSession httpsession) { // 관리자 로그아웃
		httpsession.invalidate();
	}

	@Override
	public List<Member> memberList(String pageNum, Member member, Model model) {
		Paging paging = new Paging(memberDao.memberTotCnt(member), pageNum, 10, 10);
		member.setStartRow(paging.getStartRow());
		member.setEndRow(paging.getEndRow());
		model.addAttribute("paging", paging);
		return memberDao.memberList(member);
	}

	@Override
	public int deleteMember(String mid, Model model) {
		int result = 0;
		try {
			result = adminDao.deletemember(mid);
			model.addAttribute("deleteMember", "회원 삭제 완료했습니다");
		}catch(Exception e) {
			model.addAttribute("deleteMember", "회원 삭제 실패했습니다");
		}
		return result;
	}

	@Override
	public int memberTotCnt(Member member) {
		return memberDao.memberTotCnt(member);
	}
	
	/* 관리자페이지 */
	@RequestMapping(value = "aMypage", method = RequestMethod.GET)
	public String mMypage(HttpSession httpsession, Model model) {
		model.addAttribute("qnaList", qBoardService.qnaBoardMainList());
		return "member/mMypage";
	}
	
}
