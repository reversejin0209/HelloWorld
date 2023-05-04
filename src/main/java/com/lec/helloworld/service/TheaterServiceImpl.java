package com.lec.helloworld.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.helloworld.dao.ThResDao;
import com.lec.helloworld.dao.TheaterDao;
import com.lec.helloworld.vo.ThRes;
import com.lec.helloworld.vo.Theater;

@Service
public class TheaterServiceImpl implements TheaterService {
	
	@Autowired
	TheaterDao theaterDao;
	
	@Autowired
	ThResDao thResDao;
	
	@Override
	public List<Theater> theaterList(int thschedule, String schDate) {
		if(schDate!="" && thschedule == 2) {
			thschedule = Integer.parseInt(schDate.substring(8))%2;
		}
		return theaterDao.theaterList(thschedule);
	}

	@Override
	public Theater theaterContent(String thname, String schDate, String thcode, int thseat) {
		return theaterDao.theaterContent(thname);
	}

	@Override
	public void theaterInsert(Theater theater, MultipartHttpServletRequest mRequest, Model model) {
		String backupPath = "D:\\Dsilv\\source\\10_2ndTeamProject\\helloworld\\src\\main\\webapp\\theaterFileUp\\";
		String uploadPath = mRequest.getRealPath("theaterFileUp/");
		Iterator<String> params = mRequest.getFileNames(); 
		String[] thimg1 = new String[1];
		int idx = 0;
		while(params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param); // 파라미터에 첨부된 파일 객체
			thimg1[idx] = mFile.getOriginalFilename();
			if(thimg1[idx]!=null && !thimg1[idx].equals("")) { // 첨부함
				if(new File(uploadPath + thimg1[idx]).exists()) {
					// 서버에 같은 파일이름이 있을 경우(첨부파일과)
					thimg1[idx] = System.currentTimeMillis() + "_" + thimg1[idx];
				}//if
				try {
					mFile.transferTo(new File(uploadPath + thimg1[idx])); // 서버에 저장
					System.out.println("서버파일 : " + uploadPath + thimg1[idx]);
					System.out.println("백업파일 : " + backupPath + thimg1[idx]);
					boolean result = fileCopy(uploadPath + thimg1[idx], backupPath + thimg1[idx]);
					System.out.println(result ? idx+"번째 백업성공":idx+"번째 백업실패");
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			}else {
				// 파일 첨부 안 하면 bimg[idx] = ""이다
			} // if
			theater.setThimg1(thimg1[0]);
			idx++;
		}
		try {
			theaterDao.theaterInsert(theater);
			model.addAttribute("successMsg", "1:1 문의 작성이 완료되었습니다");
		} catch (Exception e) {
			System.out.println(theater);
			model.addAttribute("failMsg", "1:1 문의 작성이 실패했습니다");
		}
	}
	
	@Override
	public int theaterCntChk(int thschedule) {
		return theaterDao.theaterCntChk(thschedule);
	}
		
	@Override
	public int theaterDelete(String thcode) {
		return theaterDao.theaterDelete(thcode);
	}
	
	@Override
	public int seatChk(ThRes thres, String schDate) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		try {
			thres.setThrdate(formatter.parse(schDate));
		} catch (ParseException e) {
			System.out.println(e.getMessage());
		}
		return thResDao.seatChk(thres);
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
