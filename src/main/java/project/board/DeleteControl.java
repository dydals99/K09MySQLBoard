package project.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fileupload.FileUtil;
import utils.JSFunction;

@WebServlet("/board/delete.do")
public class DeleteControl extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		String idx = req.getParameter("idx");
		String b_flag = req.getParameter("b_flag");   
		boardDAO dao = new boardDAO();
		
		boardDTO dto = dao.selectView(idx);
		
		int result = dao.deletePost(idx);
		dao.close();
		if (result == 1) {
			String saveFileName = dto.getSfile();
			FileUtil.deleteFile(req, "/Uploads", saveFileName);
		}
		JSFunction.alertLocation(resp, "삭제되었습니다.", "../board/list.do?b_flag="+b_flag);
			
		
	}
}
