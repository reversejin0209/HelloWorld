package com.lec.helloworld.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.helloworld.dao.NoticeDao;
import com.lec.helloworld.util.Paging;
import com.lec.helloworld.vo.Admin;
import com.lec.helloworld.vo.Notice;
@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDao noticeDao;
	
	String noticePath = "D:/JINYOONJIN/source/10_2ndTeamProject/helloworld/src/main/webapp/noticeImg";
	
	@Override
	public List<Notice> noticeMain(Notice notice, String pageNum, Model model) {
		Paging paging = new Paging(noticeDao.totCntNotice(notice), pageNum, 4, 1);
		notice.setStartRow(paging.getStartRow());
		notice.setEndRow(paging.getEndRow());
		model.addAttribute("paging", paging);
		return noticeDao.noticeMain(notice);
	}
	
	@Override
	public List<Notice> noticeList(Notice notice, String pageNum, Model model) {
		Paging paging = new Paging(noticeDao.totCntNotice(notice), pageNum, 10, 10);
		notice.setStartRow(paging.getStartRow());
		notice.setEndRow(paging.getEndRow());
		model.addAttribute("paging", paging);
		return noticeDao.noticeList(notice);
	}
	
	@Override
	public int totCntNotice(Notice notice) {
		return noticeDao.totCntNotice(notice);
	}

	@Override
	public Notice noticeContent(int nno) {
		return noticeDao.noticeContent(nno);
	}
	
	@Override
	public int noticeWrite(Notice notice, MultipartHttpServletRequest mRequest) {
		String noticeupPath = mRequest.getRealPath("noticeImg/");
		Iterator<String> params = mRequest.getFileNames();
		String[] nimg = new String[1];
		int idx = 0;
		while(params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param); 
			nimg[idx] = mFile.getOriginalFilename();
			if(nimg[idx]!=null && !nimg[idx].equals("")) { 
				if(new File(noticeupPath + nimg[idx]).exists()) {
					nimg[idx] = System.currentTimeMillis() + "_" + nimg[idx];
				}//if
				try {
					mFile.transferTo(new File(noticeupPath + nimg[idx])); 
					System.out.println("서버파일 : " + noticeupPath + nimg[idx]);
					System.out.println("백업파일 : " + noticePath + nimg[idx]);
					boolean result = fileCopy(noticeupPath + nimg[idx], noticePath + nimg[idx]);
					System.out.println(result ? idx+"번째 백업성공":idx+"번째 백업실패");
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			}else {
			} // if
			idx++;
		} 
		notice.setNcontent(nimg[0]);
		return noticeDao.noticeWrite(notice);
	}

	@Override
	public int noticeModify(Notice notice, MultipartHttpServletRequest mRequest) {
		String adid = null;
		Admin admin = (Admin) mRequest.getSession().getAttribute("admin");
		if(admin!=null) {
			adid = admin.getAdid();
		}
		notice.setAdid(adid);
		String noticeupPath = mRequest.getRealPath("noticeImg/");
		Iterator<String> params = mRequest.getFileNames();
		String[] nimg = new String[1];
		int idx = 0;
		while(params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param); 
			nimg[idx] = mFile.getOriginalFilename();
			if(nimg[idx]!=null && !nimg[idx].equals("")) { 
				if(new File(noticeupPath + nimg[idx]).exists()) {
					nimg[idx] = System.currentTimeMillis() + "_" + nimg[idx];
				}//if
				try {
					mFile.transferTo(new File(noticeupPath + nimg[idx])); 
					System.out.println("서버파일 : " + noticeupPath + nimg[idx]);
					System.out.println("백업파일 : " + noticePath + nimg[idx]);
					boolean result = fileCopy(noticeupPath + nimg[idx], noticePath + nimg[idx]);
					System.out.println(result ? idx+"번째 백업성공":idx+"번째 백업실패");
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			}else {
			} // if
			idx++;
		} 
		notice.setNcontent(nimg[0]);
		return noticeDao.noticeWrite(notice);
	}

	private boolean fileCopy(String serverFile, String backupFile) {
		boolean isCopy = false;
		InputStream is = null; 
		OutputStream os = null;
		try {
			File file = new File(serverFile);
			is = new FileInputStream(file);
			os = new FileOutputStream(backupFile);
			byte[] buff = new byte[(int) file.length()];
			while(true) {
				int nReadByte = is.read(buff);
				if(nReadByte == -1) break;
				os.write(buff, 0, nReadByte);
			}
			isCopy = true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(os!=null) os.close();
				if(is!=null) is.close();
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
		return isCopy;
	}


	@Override
	public int noticeDelete(int nno, Model model) {
		int result = 0;
		try {
			result = noticeDao.noticeDelete(nno);
			model.addAttribute("deleteNtc", "공지 삭제 완료했습니다");
		} catch (Exception e) {
			model.addAttribute("deleteNtc", "공지 삭제 실패했습니다");
		}
		return result;
	}
	
	@Override
	public int noticeNext(int nno) {
		return noticeDao.noticePre(nno);
	}

	@Override
	public int noticePre(int nno) {
		return noticeDao.noticeNext(nno);
	}

}
