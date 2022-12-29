package project.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import fileupload.FileUtil;
import utils.JSFunction;

@WebServlet("/board/multidelete.do")
public class MultiDeleteControl extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		String idx = req.getParameter("idx");
		String b_flag = req.getParameter("b_flag");   
		boardDAO dao = new boardDAO();
		
		boardDTO dto = dao.MultiselectView(idx);
		
		dto.setB_flag(b_flag);
		dto.setIdx(idx);
		int result = dao.multiDeletePost(idx);
		dao.close();
		if (result == 1) {
			JSFunction.alertLocation(resp, "삭제되었씸", "Multiboard.jsp?b_flag="+b_flag);
		}
	}
}
