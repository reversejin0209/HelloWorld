package com.lec.helloworld.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;
import com.lec.helloworld.dao.QnaBoardDao;
import com.lec.helloworld.util.Paging;
import com.lec.helloworld.vo.Admin;
import com.lec.helloworld.vo.Member;
import com.lec.helloworld.vo.QnaBoard;

@Service
public class QnaBoardServiceImpl implements QnaBoardService {

	@Autowired
	private QnaBoardDao qnaBoardDao;
	

	@Override
	public List<QnaBoard> qnaBoardMainList() {
		return qnaBoardDao.qnaBoardMainList();
	}

	@Override
	public List<QnaBoard> qnaBoardList(QnaBoard qnaBoard, String pageNum, Model model) {
		Paging paging = new Paging(qnaBoardDao.totCntQna(qnaBoard), pageNum, 10, 10);
		qnaBoard.setStartRow(paging.getStartRow());
		qnaBoard.setEndRow(paging.getEndRow());
		model.addAttribute("paging", paging);
		return qnaBoardDao.qnaBoardList(qnaBoard);
	}

	@Override
	public QnaBoard contentQna(int qanum) {
		qnaBoardDao.hitUpQna(qanum);
		return qnaBoardDao.contentQna(qanum);
	}

	@Override
	public void writeQna(QnaBoard qnaBoard, HttpServletRequest request, Model model) {
		qnaBoard.setQaip(request.getLocalAddr());
		
		String mid = null;
		Member member = (Member)request.getSession().getAttribute("member");
		if(member!=null) {
			mid = member.getMid();
		}
		qnaBoard.setMid(mid);
		qnaBoard.setQaip(request.getLocalAddr());
		
		try {
			qnaBoardDao.writeQna(qnaBoard);
			model.addAttribute("successMsg", "1:1 문의 작성이 완료되었습니다");
		} catch (Exception e) {
			model.addAttribute("failMsg", "1:1 문의 작성이 실패했습니다");
		}
	}

	@Override
	public void modifyQna(QnaBoard qnaBoard, HttpServletRequest request, Model model) {
		qnaBoard.setQaip(request.getLocalAddr());
		try {
			qnaBoardDao.modifyQna(qnaBoard);
			model.addAttribute("successMsg", "1:1 문의 수정이 완료되었습니다");
		} catch (Exception e) {
			model.addAttribute("failMsg", "1:1 문의 수정이 실패했습니다");
		}
	}

	@Override
	public void replyQna(QnaBoard qnaBoard, HttpServletRequest request, Model model) {
		String adid = null;
		Admin admin = (Admin)request.getSession().getAttribute("admin");
		if(admin!=null) {
			adid = admin.getAdid();
		}
		qnaBoard.setAdid(adid);
		
		qnaBoard.setQaip(request.getLocalAddr());
		
		try {
			qnaBoardDao.replyStepQna(qnaBoard);
			qnaBoardDao.replyQna(qnaBoard);
			model.addAttribute("successMsg", "1:1 답변 작성이 완료되었습니다");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println(qnaBoard);
			model.addAttribute("failMsg", "1:1 답변 작성이 실패했습니다");
		}
	}

	@Override
	public int deleteQna(int qagroup, Model model) {
		int result = 0;
		try {
			result = qnaBoardDao.deleteQna(qagroup);
			model.addAttribute("successMsg", "1:1 문의 삭제가 완료되었습니다");
		} catch (Exception e) {
			model.addAttribute("failMsg", "1:1 문의 삭제가 실패했습니다");
		}
		return result;
	}


	@Override
	public List<QnaBoard> myQnaBoardList(HttpSession session, QnaBoard qnaBoard, String pageNum, Model model) {
		Member member = (Member)session.getAttribute("member");
		if(member!=null) {
			qnaBoard.setMid(member.getMid());
		}
		Paging paging = new Paging(qnaBoardDao.totCntMyQna(qnaBoard), pageNum, 10, 10);
		qnaBoard.setStartRow(paging.getStartRow());
		qnaBoard.setEndRow(paging.getEndRow());
		model.addAttribute("paging", paging);
		return qnaBoardDao.myQnaBoardList(qnaBoard);
	}
	
	private int filecopy(String serverFile, String backupFile) {
		int isCopy = 0;
		FileInputStream is = null;
		FileOutputStream os = null;
		try {
			is = new FileInputStream(serverFile);
			os = new FileOutputStream(backupFile);
			File sFile = new File(serverFile);
			byte[] buff = new byte[(int) sFile.length()];
			while (true) {
				int nRead = is.read(buff);
				if (nRead == -1) {
					break;
				}
				os.write(buff, 0, nRead);
			}
			isCopy = 1;
		} catch (FileNotFoundException e) {
			System.out.println("복사 예외0 : " + e.getMessage());
		} catch (IOException e) {
			System.out.println("복사 예외1 : " + e.getMessage());
		} finally {
			try {
				if (os != null) {
					os.close();
				}
				if (is != null) {
					is.close();
				}
			} catch (Exception e) {
			}
		}
		return isCopy;
	}

	@Override
	public void imageUpload(HttpServletRequest req, HttpServletResponse resp, MultipartHttpServletRequest multiFile) {
		PrintWriter printWriter = null;
		OutputStream out = null;
		MultipartFile file = multiFile.getFile("upload");

		if (file != null) {
			if (file.getSize() > 0 && StringUtils.isNotBlank(file.getName())) {
				if (file.getContentType().toLowerCase().startsWith("image/")) {
					try {

						String fileName = file.getOriginalFilename();
						byte[] bytes = file.getBytes();

						String uploadPath = req.getSession().getServletContext().getRealPath("/resources/qnaBoardImg");
						System.out.println("uploadPath:" + uploadPath);

						File uploadFile = new File(uploadPath);
						if (!uploadFile.exists()) {
							uploadFile.mkdir();
						}
						String fileName2 = UUID.randomUUID().toString();
						uploadPath = uploadPath + "/" + fileName2 + fileName;

						out = new FileOutputStream(new File(uploadPath));
						out.write(bytes);
						int result = filecopy(uploadPath,
								"D:/webPro/project/helloWorld/helloworld/src/main/webapp/resources/qnaBoardImg/"
										+ fileName2 + fileName);
						if (result == 1) {
							System.out.println("파일 백업 성공");
						}
						printWriter = resp.getWriter();
						String fileUrl = req.getContextPath() + "/resources/qnaBoardImg/" + fileName2 + fileName; // url경로
						System.out.println("fileUrl :" + fileUrl);
						JsonObject json = new JsonObject();
						json.addProperty("uploaded", 1);
						json.addProperty("fileName", fileName);
						json.addProperty("url", fileUrl);
						printWriter.print(json);
						System.out.println(json);

					} catch (IOException e) {
						System.out.println(e.getMessage());
					} finally {
						try {
							if (out != null) {
								out.close();
							}
							if (printWriter != null) {
								printWriter.close();
							}
						} catch (Exception e) {
							// TODO: handle exception
						}
					} // try
				} // if
			} // if
		} // if
	}

}
