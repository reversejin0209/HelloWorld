package com.lec.helloworld.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.helloworld.util.Paging;
import com.lec.helloworld.vo.Admin;
import com.lec.helloworld.vo.Member;

@Mapper
public interface AdminDao {
	public Admin getAdmin(String adid);
	public List<Member> memberList(Member member); 
	public int deletemember(String mid); 
}
