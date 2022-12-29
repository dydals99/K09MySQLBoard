package project.board;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;

public class ucommentDAO extends DBConnPool{

	public List<ucommentDTO> selectListPage(Map<String, Object> map){
		
		List<ucommentDTO> comment = new Vector<ucommentDTO>();
		
		String query = " SELECT * FROM ucomment WHERE idx='" + map.get("idx")+ "'";
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				ucommentDTO dto = new ucommentDTO();
				
				dto.setIdx(rs.getString(1));
				dto.setId(rs.getString(2));
				dto.setContent(rs.getString(3));
				dto.setPostdate(rs.getDate(4));
				
				comment.add(dto);
			}
		}
		catch(Exception e) {
			
		}
		return comment;
		
	}
	public int insertWrite(ucommentDTO dto) {
		int result = 0;
		
		try {
			String query = "insert into ucomment(idx,id,content) VALUES(?,?,?)";
			
			psmt = con.prepareStatement(query);
			
			psmt.setString(1, dto.getIdx());
			System.out.println(dto.getIdx());
			psmt.setString(2, dto.getId());
			psmt.setString(3, dto.getContent());
			
			result = psmt.executeUpdate();
			
		}
		catch(Exception e) {
			System.out.println("댓글 입력 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
}
