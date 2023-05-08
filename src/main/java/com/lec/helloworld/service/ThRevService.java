package com.lec.helloworld.service;

import java.util.List;

import org.springframework.ui.Model;

import com.lec.helloworld.vo.ThRev;

public interface ThRevService {
	public int thRevWrite(ThRev threv);
	public int thRevWriteView(String thrcode);
	public ThRev thRevContent(ThRev threv);
	public List<ThRev> mthRevList(ThRev threv, String pageNum, Model model);
	public List<ThRev> thRevList(ThRev threv, String pageNum, Model model);
	public List<ThRev> thRevMainList();
}
