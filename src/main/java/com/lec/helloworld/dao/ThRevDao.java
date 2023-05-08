package com.lec.helloworld.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.helloworld.vo.ThRev;

@Mapper
public interface ThRevDao {
	public int thRevWrite(ThRev threv);
	public int thRevWriteUpdate(ThRev threv);
	public ThRev mthRevContent(ThRev threv);
	public int mthRevListTotCnt(ThRev threv);
	public List<ThRev> mthRevList(ThRev threv);
	public int thRevListTotCnt(ThRev threv);
	public List<ThRev> thRevList(ThRev threv);
	public List<ThRev> thRevMainList();
}
