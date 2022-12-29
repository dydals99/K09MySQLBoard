package project.board;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/board/multiview.do")
public class MultiViewControl extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		boardDAO dao = new boardDAO();
		
		String idx = req.getParameter("idx");
		
		dao.updateVisitCount2(idx);
		
		boardDTO dto = dao.MultiselectView(idx);
		
		dao.close();
		
		dto.setContent(dto.getContent().replaceAll("\r\n", "<br>"));
		
		
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/00Projectboard/MultiView.jsp").forward(req, resp);
	}
}
