package project.board;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.oreilly.servlet.MultipartRequest;
import fileupload.FileUtil;
import utils.JSFunction;

@WebServlet("/board/edit.do")
 public class EditControl extends HttpServlet{
 	
 	@Override
 	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
 			throws ServletException, IOException {
 		String idx = req.getParameter("idx");
 		boardDAO dao = new boardDAO();
 		boardDTO dto =  dao.selectView(idx);
 		dao.close();
 		req.setAttribute("dto", dto);
 		req.getRequestDispatcher("/00Projectboard/Edit.jsp").forward(req, resp);
 	}
 	@Override
 	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
 			throws ServletException, IOException {
 		String saveDirectory = req.getServletContext().getRealPath("/Uploads");
 		
 		ServletContext application = this.getServletContext();
 		int maxPostSize = Integer.parseInt(application.getInitParameter("maxPostSize"));
 		
 		MultipartRequest mr = FileUtil.uploadFile(req, saveDirectory, maxPostSize);
 		
 		if(mr == null) {
 			JSFunction.alertBack(resp, "첨부 파일이 제한 용량을 초과합니다.");
 			return;
 		}
 		String idx = mr.getParameter("idx");
 		String prevOfile = mr.getParameter("prevOfile");
 		String prevSfile = mr.getParameter("prevSfile");
 		String title = mr.getParameter("title");
 		String content = mr.getParameter("content");
 		String b_flag = mr.getParameter("b_flag");
 		
 		boardDTO dto = new boardDTO();
 		dto.setIdx(idx);
 		dto.setTitle(title);
 		dto.setContent(content);
 		dto.setB_flag(b_flag);
 		
 		String fileName = mr.getFilesystemName("ofile");
 		if(fileName != null) {
 			String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
 			String ext = fileName.substring(fileName.lastIndexOf("."));
 			String newFileName = now + ext ;
 			
 			File oldFile = new File(saveDirectory + File.separator + fileName);
 			File newFile = new File(saveDirectory + File.separator + newFileName);
 			oldFile.renameTo(newFile);
 			
 			dto.setOfile(fileName);
 			dto.setSfile(newFileName);
 			
 			FileUtil.deleteFile(req, "/Uploads", prevSfile);
 		}
 		else {
 			dto.setOfile(prevOfile);
 			dto.setSfile(prevSfile);
 		}
 		boardDAO dao = new boardDAO();
 		int result = dao.updatePost(dto);
 		dao.close();
 		
 		if(result == 1) {
 			resp.sendRedirect("../board/view.do?b_flag="+b_flag+"&idx="+idx);
 		}
 		else {
 			JSFunction.alertBack(resp, "수정하기에 실패했습니다.");
 		}
 	}
 }