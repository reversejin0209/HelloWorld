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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.helloworld.dao.NoticeDao;
import com.lec.helloworld.util.Paging;
import com.lec.helloworld.vo.Notice;
@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeDao noticeDao;
	String noticePath = "D:/JINYOONJIN/source/10_2ndTeamProject/helloworld/src/main/webapp/noticeImg";
	@Override
	public int totCntNotice() {
		return noticeDao.totCntNotice();
	}

	@Override
	public List<Notice> noticeList(Notice notice, String pageNum) {
		Paging paging = new Paging(noticeDao.totCntNotice(), pageNum, 10, 10);
		notice.setStartRow(paging.getStartRow());
		notice.setEndRow(paging.getEndRow());
		return noticeDao.noticeList(notice);
	}

	@Override
	public int noticeWriteView(Notice notice, MultipartHttpServletRequest mRequest) {
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
		return noticeDao.noticeWriteView(notice);
	}

	@Override
	public Notice noticeContent(int nno) {
		return noticeDao.noticeContent(nno);
	}
	
	@Override
	public int noticeModifyView(Notice notice, MultipartHttpServletRequest mRequest) {
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
		return noticeDao.noticeWriteView(notice);
	}


	@Override
	public int noticeDelete(int nno) {
		return noticeDao.noticeDelete(nno);
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
}
