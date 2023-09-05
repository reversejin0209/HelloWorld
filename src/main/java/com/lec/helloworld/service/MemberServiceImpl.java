package com.lec.helloworld.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.lec.helloworld.dao.MemberDao;
import com.lec.helloworld.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Override
	public Member memberGetDetail(HttpSession session) {
		/* 회원 아이디로 회원 정보 가져오기 */
		Member member = (Member)session.getAttribute("member");
		String mid = member.getMid();
		return memberDao.memberGetDetail(mid);
	}

	@Override
	public void loginChk(String mid, String mpw, HttpSession httpSession, Model model) {
		/* 로그인 확인 */
		Member member = memberDao.memberGetDetail(mid);
		if(member != null) {
			// model.addAttribute("successMsg", "로그인 성공");
			httpSession.setAttribute("member", member);
		} else {
			model.addAttribute("failMsg", "아이디 또는 비밀번호가 일치하지 않습니다.");
		}
	}

	@Override
	public void logout(HttpSession httpSession) {
		/* 로그아웃 */
		httpSession.invalidate();
	}

	@Override
	public int memberJoin(final Member member, HttpSession httpSession) {
		/* 회원 가입 */
//		MimeMessagePreparator message = new MimeMessagePreparator() {
//			String content = "<div style=\"width:500px; margin: 0 auto\">\n" + 
//					"		<h1>"+ member.getMname() +"님의 회원가입 감사합니다</h1>\n" + 
//					"		아무개 사이트에서만 쓰실 수 있는 감사쿠폰을 드립니다<br>\n" + 
//					"		<img src=\"https://t1.daumcdn.net/daumtop_chanel/op/20200723055344399.png\" alt=\"다음 로고\">\n" + 
//					"		<hr color=\"red\">\n" + 
//					"		<span style=\"color:red;\">빨간 글씨 부분</span><br>\n" + 
//					"		<span style=\"color:blue;\">파란 글씨 부분</span><br>\n" + 
//					"		<img src=\"http://localhost:8090/ch19/img/coupon.jpg\" alt=\"쿠폰\"><br>\n" + 
//					"		<p align=\"center\">서울시 어떤구 몰라17길 51 어떤빌딩 2층</p>\n" + 
//					"	</div>";
//			@Override
//			public void prepare(MimeMessage mimeMessage) throws Exception {
//				// 받을 메일
//				mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(member.getMmail()));
//				// 보낼 메일
//				mimeMessage.setFrom(new InternetAddress("qoxmfspt43@gmail.com"));
//				// 메일 제목
//				mimeMessage.setSubject("[HTML 가입인사]" + member.getMname() + "님 가입 감사합니다");
//				// 메일 본문
//				mimeMessage.setText(content, "utf-8", "html");
//			}
//		};
//		mailSender.send(message); // 메일 전송
		httpSession.setAttribute("mid", member.getMid());
		return memberDao.memberJoin(member);
	}

	@Override
	public int memberIdConfirm(String mid) {
		/* ID 중복 확인 */
		return memberDao.memberIdConfirm(mid);
	}

	@Override
	public int memberTelConfirm(String mtel) {
		/* TEL 중복 확인 */
		return memberDao.memberTelConfirm(mtel);
	}

	@Override
	public int memberEmConfirm(String mmail) {
		/* EMAIL 중복 확인 */
		return memberDao.memberEmConfirm(mmail);
	}

	@Override
	public int memberModify(Member member, String oldMpw, HttpSession httpSession) {
		/* 회원 정보 수정 */
		if(member.getMpw()==null || member.getMpw()=="") {
			member.setMpw(oldMpw);
		}
		httpSession.setAttribute("member", member);
		return memberDao.memberModify(member);
	}

	@Override
	public int memberWithdrawal(String mid) {
		/* 회원 탈퇴 */
		return memberDao.memberWithdrawal(mid);
	}

}
