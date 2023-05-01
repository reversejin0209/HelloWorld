package com.lec.helloworld.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.helloworld.vo.Member;

@Mapper
public interface MemberDao {
	public Member memberGetDetail(String mid);
	public int memberJoin(Member member);
	public int memberIdConfirm(String mid);
	public int memberTelConfirm(String mtel);
	public int memberEmConfirm(String mmail);
	public int memberModify(Member member);
	public int memberWithdrawal(String mid);
	public int memberTotCnt(Member member);
	public List<Member> memberList(Member member);
}
