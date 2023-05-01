package com.lec.helloworld.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.helloworld.dao.AttractionDao;
import com.lec.helloworld.util.Paging;
import com.lec.helloworld.vo.Attraction;
@Service
public class AttractionServiceImpl implements AttractionService {
	@Autowired
	private AttractionDao attractionDao;
	String bakupAtcPath = "D:/JINYOONJIN/source/10_2ndTeamProject/helloworld/src/main/webapp/noticeImg";
	
	@Override
	public List<Attraction> mainAtc(Attraction attraction, String pageNum) {
		Paging paging = new Paging(attractionDao.totCntAtc(attraction), pageNum, 10, 10);
		attraction.setStartRow(paging.getStartRow());
		attraction.setEndRow(paging.getEndRow());
		return attractionDao.mainAtc(attraction);
	}
	@Override
	public List<Attraction> ListAtc(Attraction attraction, String pageNum) {
		Paging paging = new Paging(attractionDao.totCntAtc(attraction), pageNum, 10, 10);
		attraction.setStartRow(paging.getStartRow());
		attraction.setEndRow(paging.getEndRow());
		return attractionDao.ListAtc(attraction);
	}

	@Override
	public int totCntAtc(Attraction attraction) {
		return attractionDao.totCntAtc(attraction);
	}

	@Override
	public Attraction DetailAtc(int atcode) {
		return attractionDao.DetailAtc(atcode);
	}

	@Override
	public int InsertAtc(Attraction attraction, MultipartHttpServletRequest mRequest) {
		String uploadAtcPath = mRequest.getRealPath("attractionImg/");
		Iterator<String> params = mRequest.getFileNames(); 
		String[] atcimg = new String[0];
		int idx = 0;
		while(params.hasNext()) {
			String param = params.next();
			MultipartFile atcFile = mRequest.getFile(param); 
			atcimg[idx] = atcFile.getOriginalFilename();
			if(atcimg[idx]!=null && !atcimg[idx].equals("")) { 
				if(new File(uploadAtcPath + atcimg[idx]).exists())
				{
					atcimg[idx] = System.currentTimeMillis() + "_" + atcimg[idx];
				}//if
				try {
					atcFile.transferTo(new File(uploadAtcPath + atcimg[idx])); 
					System.out.println("서버파일 : " + uploadAtcPath + atcimg[idx]);
					System.out.println("백업파일 : " + bakupAtcPath + atcimg[idx]);
					boolean result = fileCopy(uploadAtcPath + atcimg[idx], bakupAtcPath + atcimg[idx]);
					System.out.println(result ? idx+"번째 백업성공":idx+"번째 백업실패");
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			}else {
			} // if
			idx++;
		} 
		attraction.setAtimage(atcimg[0]);
		return attractionDao.InsertAtc(attraction);
	}
	@Override
	public int ModifyAtc(Attraction attraction, MultipartHttpServletRequest mRequest) {
		String uploadAtcPath = mRequest.getRealPath("attractionImg/");
		Iterator<String> params = mRequest.getFileNames(); 
		String[] atcimg = new String[0];
		int idx = 0;
		while(params.hasNext()) {
			String param = params.next();
			MultipartFile atcFile = mRequest.getFile(param); 
			atcimg[idx] = atcFile.getOriginalFilename();
			if(atcimg[idx]!=null && !atcimg[idx].equals("")) { 
				if(new File(uploadAtcPath + atcimg[idx]).exists())
				{
					atcimg[idx] = System.currentTimeMillis() + "_" + atcimg[idx];
				}//if
				try {
					atcFile.transferTo(new File(uploadAtcPath + atcimg[idx])); 
					System.out.println("서버파일 : " + uploadAtcPath + atcimg[idx]);
					System.out.println("백업파일 : " + bakupAtcPath + atcimg[idx]);
					boolean result = fileCopy(uploadAtcPath + atcimg[idx], bakupAtcPath + atcimg[idx]);
					System.out.println(result ? idx+"번째 백업성공":idx+"번째 백업실패");
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			}else {
			} 
			idx++;
		} 
		attraction.setAtimage(atcimg[0]);
		return attractionDao.InsertAtc(attraction);
	}

	@Override
	public int DeleteAtc(int atcode) {
		return attractionDao.DeleteAtc(atcode);
	}
	private boolean fileCopy(String serverFile, String bakupAtcPath) {
		boolean isCopy = false;
		InputStream is = null; 
		OutputStream os = null;
		try {
			File file = new File(serverFile);
			is = new FileInputStream(file);
			os = new FileOutputStream(bakupAtcPath);
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
