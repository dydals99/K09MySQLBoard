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

@WebServlet("/board/write.do")
public class WriteControl extends HttpServlet {
   
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      req.getRequestDispatcher("/00Projectboard/Write.jsp").forward(req, resp);
   }
   
   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      String saveDirectory = req.getServletContext().getRealPath("/Uploads");
      
      ServletContext application = getServletContext();
      int maxPostSize = Integer.parseInt(
            application.getInitParameter("maxPostSize"));
      MultipartRequest mr = FileUtil.uploadFile(req, saveDirectory, maxPostSize);
      if(mr==null) {
         JSFunction.alertLocation(resp, "첨부 파일이 제한 용량을 초과합니다.",
                  "../board/write.do");
         return;
      }
      boardDTO dto = new boardDTO();
      
      dto.setId(mr.getParameter("id"));
      dto.setPrice(mr.getParameter("price"));
      dto.setLocation(mr.getParameter("location"));
      dto.setCategory(mr.getParameter("category")); 
      dto.setTitle(mr.getParameter("title"));
      dto.setContent(mr.getParameter("content"));
      dto.setB_flag(mr.getParameter("b_flag"));
      
      String fileName = mr.getFilesystemName("ofile");
      if(fileName != null) {
         String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
         String ext = fileName.substring(fileName.lastIndexOf("."));
         String newFileName = now + ext;
         File oldFile = new File(saveDirectory + File.separator + fileName);
         File newFile = new File(saveDirectory + File.separator + newFileName);
         oldFile.renameTo(newFile);
         dto.setOfile(fileName);
         dto.setSfile(newFileName);
      }
      
      boardDAO dao = new boardDAO();
      int result = dao.insertWrite(dto);
      dao.close();
      
      if (result==1) {
         resp.sendRedirect("../board/list.do?b_flag="+dto.getB_flag());
      }
      else {
         resp.sendRedirect("../board/write.do");         
      }
   }
}