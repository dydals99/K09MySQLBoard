package project.board;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/board/view.do")
public class ViewControl extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		boardDAO dao = new boardDAO();
		String idx = req.getParameter("idx");
		dao.updateVisitCount(idx);
		boardDTO dto = dao.selectView(idx);
		dao.close();
		dto.setContent(dto.getContent().replaceAll("\r\n", "<br>"));
		
		String ext=null, fileName=dto.getSfile();
		if(fileName != null) {
			ext = fileName.substring(fileName.lastIndexOf(".")+1);
		}
		String[] mineStr = {"png", "jpg", "gif"};
		List<String> mimeList = Arrays.asList(mineStr);
		boolean isImage = false;
		if(mimeList.contains(ext)) {
			isImage = true;
		}
		ucommentDAO cdao = new ucommentDAO(); 
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("idx", idx);
		
		List<ucommentDTO> comment = cdao.selectListPage(map);
		
		cdao.close();
		
		
		req.setAttribute("isImage", isImage);
		req.setAttribute("comment", comment);
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/00Projectboard/View.jsp").forward(req, resp);
	}
	
}
