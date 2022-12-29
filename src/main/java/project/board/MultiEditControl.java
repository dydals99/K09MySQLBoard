package project.board;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.JSFunction;

@WebServlet("/board/multiedit.do")
 public class MultiEditControl extends HttpServlet{
 	
 	@Override
 	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
 			throws ServletException, IOException {
 		String idx = req.getParameter("idx");
 		boardDAO dao = new boardDAO();
 		boardDTO dto =  dao.MultiselectView(idx);
 		dao.close();
 		req.setAttribute("dto", dto);
 		req.getRequestDispatcher("/00Projectboard/MultiEdit.jsp").forward(req, resp);
 	}
 	@Override
 	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
 			throws ServletException, IOException {
 		
 		String idx = req.getParameter("idx");  
 		String title = req.getParameter("title");
 		String content = req.getParameter("content");
 		String b_flag = req.getParameter("b_flag");
 		
 		boardDTO dto = new boardDTO();
 		dto.setIdx(idx);
 		dto.setTitle(title);
 		dto.setContent(content); 
 		dto.setB_flag(b_flag);

 		boardDAO dao = new boardDAO();
 		
 		int result = dao.multiUpdatePost(dto);
 		
 		dao.close();
 		
 		if(result == 1) {
 			resp.sendRedirect("../board/multiview.do?b_flag="+b_flag+"&idx="+idx);
 		}
 		else {
 			JSFunction.alertBack(resp, "수정하기에 실패했습니다.");
 		}
 	}
 }