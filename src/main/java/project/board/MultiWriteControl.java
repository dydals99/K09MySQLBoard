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
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import com.oreilly.servlet.MultipartRequest;

import fileupload.FileUtil;
import utils.JSFunction;

@WebServlet("/board/multiwrite.do")
public class MultiWriteControl extends HttpServlet {
   
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      req.getRequestDispatcher("/00Projectboard/MultiWrite.jsp").forward(req, resp);
   }
   
   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	  String id = req.getParameter("id");
	  String title = req.getParameter("title");
	  String content = req.getParameter("content");
	  String b_flag = req.getParameter("b_flag");
	  
      boardDTO dto = new boardDTO();
      HttpSession session = req.getSession();
      
      dto.setId(session.getAttribute("UserId").toString());
      dto.setTitle(title);
      dto.setContent(content);
      dto.setB_flag(b_flag);
      
      boardDAO dao = new boardDAO();
      
      int result = dao.insertMulti(dto);
      
      
      dao.close();
      
      if (result==1) {
         resp.sendRedirect("../00Projectboard/Multiboard.jsp?b_flag="+dto.getB_flag());
      }
      else {
         resp.sendRedirect("../board/multiwrite.do");         
      }
   }
}