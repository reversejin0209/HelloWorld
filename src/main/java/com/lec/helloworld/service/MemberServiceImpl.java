package com.lec.helloworld.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.lec.helloworld.dao.MemberDao;
import com.lec.helloworld.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private JavaMailSender mailSender;
	
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
	public int memberJoin(final Member member, HttpSession httpSession) {
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
