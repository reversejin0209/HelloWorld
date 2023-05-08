package com.lec.helloworld.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;
import com.lec.helloworld.dao.AttractionDao;
import com.lec.helloworld.util.Paging;
import com.lec.helloworld.vo.Admin;
import com.lec.helloworld.vo.Attraction;
import com.lec.helloworld.vo.QnaBoard;

@Service
public class AttractionServiceImpl implements AttractionService {

	@Autowired
	private AttractionDao attractionDao;

	/*
	 * @Override public List<Attraction> mainAtc(Attraction attraction, String
	 * pageNum) { Paging paging = new Paging(attractionDao.totCntAtc(attraction),
	 * pageNum, 4, 1); attraction.setStartRow(paging.getStartRow());
	 * attraction.setEndRow(paging.getEndRow()); return
	 * attractionDao.mainAtc(attraction); }
	 */
	@Override
	public List<Attraction> listAtc(Attraction attraction, String pageNum, Model model) {
		Paging paging = new Paging(attractionDao.totCntAtc(attraction), pageNum, 10, 10);
		attraction.setStartRow(paging.getStartRow());
		attraction.setEndRow(paging.getEndRow());
		model.addAttribute("paging", paging);
		return attractionDao.listAtc(attraction);
	}

	@Override
	public int totCntAtc(Attraction attraction) {
		return attractionDao.totCntAtc(attraction);
	}

	@Override
	public Attraction detailAtc(int atcode) {
		return attractionDao.detailAtc(atcode);
	}

	@Override
	public void insertAtc(Attraction attraction, MultipartHttpServletRequest mRequest, Model model) {
		String backupPath = "D:\\JINYOONJIN\\source\\10_2ndTeamProject\\helloworld\\src\\main\\webapp\\attractionImg\\";
		String uploadPath = mRequest.getRealPath("attractionImg/");
		Iterator<String> params = mRequest.getFileNames();
		String[] atimage = new String[1];
		int idx = 0;
		while (params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param); // 파라미터에 첨부된 파일 객체
			atimage[idx] = mFile.getOriginalFilename();
			if (atimage[idx] != null && !atimage[idx].equals("")) { // 첨부함
				if (new File(uploadPath + atimage[idx]).exists()) {
					// 서버에 같은 파일이름이 있을 경우(첨부파일과)
					atimage[idx] = System.currentTimeMillis() + "_" + atimage[idx];
				} // if
				try {
					mFile.transferTo(new File(uploadPath + atimage[idx])); // 서버에 저장
					System.out.println("서버파일 : " + uploadPath + atimage[idx]);
					System.out.println("백업파일 : " + backupPath + atimage[idx]);
					boolean result = fileCopy(uploadPath + atimage[idx], backupPath + atimage[idx]);
					System.out.println(result ? idx + "번째 백업성공" : idx + "번째 백업실패");
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			} else {
				// 파일 첨부 안 하면 bimg[idx] = ""이다
			} // if
			attraction.setAtimage(atimage[0]);
			idx++;
		}
		try {
			attractionDao.insertAtc(attraction);
			model.addAttribute("successMsg", "기구 등록 완료했습니다");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println(attraction);
			model.addAttribute("failMsg", "기구 등록 실패했습니다");
		}
	}

	@Override
	public void modifyAtc(Attraction attraction, MultipartHttpServletRequest mRequest, Model model) {
		String backupPath = "D:\\JINYOONJIN\\source\\10_2ndTeamProject\\helloworld\\src\\main\\webapp\\attractionImg\\";
		String uploadPath = mRequest.getRealPath("attractionImg/");
		Iterator<String> params = mRequest.getFileNames();
		String[] atimage = new String[1];
		int idx = 0;
		while (params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param); // 파라미터에 첨부된 파일 객체
			atimage[idx] = mFile.getOriginalFilename();
			if (atimage[idx] != null && !atimage[idx].equals("")) { // 첨부함
				if (new File(uploadPath + atimage[idx]).exists()) {
					// 서버에 같은 파일이름이 있을 경우(첨부파일과)
					atimage[idx] = System.currentTimeMillis() + "_" + atimage[idx];
				} // if
				try {
					mFile.transferTo(new File(uploadPath + atimage[idx])); // 서버에 저장
					System.out.println("서버파일 : " + uploadPath + atimage[idx]);
					System.out.println("백업파일 : " + backupPath + atimage[idx]);
					boolean result = fileCopy(uploadPath + atimage[idx], backupPath + atimage[idx]);
					System.out.println(result ? idx + "번째 백업성공" : idx + "번째 백업실패");
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			} else {
				// 파일 첨부 안 하면 bimg[idx] = ""이다
			} // if
			attraction.setAtimage(atimage[0]);
			idx++;
		}
		try {
			attractionDao.modifyAtc(attraction);
			model.addAttribute("successMsg", "기구 수정 완료했습니다");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println(attraction);
			model.addAttribute("failMsg", "기구 수정 실패했습니다");
		}
	}

	@Override
	public int deleteAtc(int atcode, Model model) {
		int result = 0;
		try {
			result = attractionDao.deleteAtc(atcode);
			model.addAttribute("successMsg", "기구 삭제 완료했습니다");
		} catch (Exception e) {
			model.addAttribute("failMsg", "기구 삭제 실패했습니다");
		}
		return result;
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
			while (true) {
				int nReadByte = is.read(buff);
				if (nReadByte == -1)
					break;
				os.write(buff, 0, nReadByte);
			}
			isCopy = true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (os != null)
					os.close();
				if (is != null)
					is.close();
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
		return isCopy;
	}

	@Override public void imageUpAtc(HttpServletRequest request,
	  HttpServletResponse response, MultipartHttpServletRequest multiFile) {
	  PrintWriter printwriter = null; OutputStream out = null; MultipartFile file =
	  multiFile.getFile("upload");
	  
	  if(file != null) { if(file.getSize() > 0 &&
	  StringUtils.isNotBlank(file.getName())) {
	  if(file.getContentType().toLowerCase().startsWith("image/")); try { String
	  fileName = file.getOriginalFilename(); byte[] bytes = file.getBytes();
	  
	  String uploadPath = request.getSession().getServletContext().getRealPath(
	  "/resources/attractionImg"); // 저장경로
	  System.out.println("uploadPath:"+uploadPath);
	  
	  File uploadFile = new File(uploadPath); if(!uploadFile.exists()) {
	  uploadFile.mkdir(); } String fileName2 = UUID.randomUUID().toString();
	  uploadPath = uploadPath + "/" + fileName2 + fileName;
	  
	  out = new FileOutputStream(new File(uploadPath)); out.write(bytes); 
	  boolean result = fileCopy(uploadPath,  "D:/JINYOONJIN/source/10_2ndTeamProject/helloworld/src/main/webapp/resources/attractionImg/"
	  ); if(result=true) { System.out.println("파일 백업 성공"); } printwriter =
	  response.getWriter(); String fileUrl = request.getContextPath() +
	  "/resources/atcUrl/" + fileName + fileName2; System.out.println("fileUrl :" +
	  fileUrl); JsonObject json = new JsonObject(); json.addProperty("upload", 1);
	  json.addProperty("fileName", fileName); json.addProperty("url", fileUrl);
	  printwriter.print(json); System.out.println(json);
	  
	  } catch (IOException e) { System.out.println(e.getMessage()); } finally { try
	  { if (out != null) {out.close();} if (printwriter != null)
	  {printwriter.close();} } catch (Exception e) {
	  System.out.println(e.getMessage()); } }// try }// if }// if }// if
	  }
	  }
	  
	}
}
