package project.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/board/comment.do")
public class CommentControl extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		String idx = req.getParameter("idx");
		String id = req.getParameter("id");
		String content = req.getParameter("content");
		String b_flag = req.getParameter("b_flag");

		ucommentDTO dto = new ucommentDTO();
		
		
		System.out.println(id);
		System.out.println(idx);
		System.out.println(content);
		
		dto.setId(id);
		dto.setIdx(idx);
		dto.setContent(content);
		
		ucommentDAO dao = new ucommentDAO();

		int iResult = dao.insertWrite(dto);
		dao.close();

		if(iResult == 1){   
		   resp.sendRedirect("../board/view.do?b_flag="+b_flag+"&idx="+idx);
		   
		} else {
			/* JSFunction.alertBack("댓글작성에 실패하였습니다.", out); */
		}
	}
}
