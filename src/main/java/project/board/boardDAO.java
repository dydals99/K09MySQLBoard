package project.board;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;

public class boardDAO extends DBConnPool {

	public boardDAO() {
		super();
	}
	public int selectCount(Map<String, Object> map) {
		  int totalCount = 0;
			String query = "SELECT COUNT(*) FROM board WHERE b_flag='" + map.get("b_flag") + "'";
			
			if (map.get("searchWord") != null) {
				
				query += " AND " + map.get("searchField") + " " + " LIKE '%" + map.get("searchWord") + "%'";
			}
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("게시물 수를 구하는 중 예외 발생");
			e.printStackTrace();
		}

		return totalCount;
	}
	public int selectCount1(Map<String, Object> map) {
		  int totalCount = 0;
			String query = "SELECT COUNT(*) FROM multiboard WHERE b_flag='" + map.get("b_flag") + "'";
			
			if (map.get("searchWord") != null) {
				
				query += " AND " + map.get("searchField") + " " + " LIKE '%" + map.get("searchWord") + "%'";
			}
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("게시물 수를 구하는 중 예외 발생");
			e.printStackTrace();
		}

		return totalCount;
	}
	public int selectCount2(Map<String, Object> map) {
		  int totalCount = 0;
			String query = "SELECT COUNT(*) FROM board WHERE b_flag='" + map.get("b_flag") + "'and id='"+map.get("id")+"'";
			
			if (map.get("searchWord") != null) {
				
				query += " AND " + map.get("searchField") + " " + " LIKE '%" + map.get("searchWord") + "%'";
			}
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("게시물 수를 구하는 중 예외 발생");
			e.printStackTrace();
		}

		return totalCount;
	}
	public List<boardDTO> selectListPage(Map<String, Object> map) {
		List<boardDTO> board = new Vector<boardDTO>();

		String query = " SELECT * FROM board WHERE b_flag='" + map.get("b_flag")+ "'";

		if (map.get("searchWord") != null) {
			query += " and " + map.get("searchField") 
				  + " LIKE '%" + map.get("searchWord") + "%' ";
		}
		query += "ORDER BY idx DESC LIMIT ?, ?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
			psmt.setInt(2, Integer.parseInt(map.get("end").toString()));
			rs = psmt.executeQuery();

			while (rs.next()) {
				boardDTO dto = new boardDTO();

				dto.setIdx(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setPrice(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setImage(rs.getString(5));
				dto.setId(rs.getString(6));
				dto.setPostdate(rs.getDate(7));
				dto.setCategory(rs.getString(8));
				dto.setLocation(rs.getString(9));
				dto.setVisitcount(rs.getInt(10));
				dto.setLikecount(rs.getInt(11));
				dto.setDowncount(rs.getInt(12));
				dto.setOfile(rs.getString(13));
				dto.setSfile(rs.getString(14));
				dto.setB_flag(rs.getString(15));

				board.add(dto);
			}

		} catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}

		return board;
	}
	public List<boardDTO> selectListMyPage(Map<String, Object> map) {
		List<boardDTO> board = new Vector<boardDTO>();

		String query = "SELECT * FROM board WHERE b_flag='"+map.get("b_flag")+"' and id='"+map.get("id")+"'";
	      
	      if(map.get("searchWord") != null) {
	         query += " AND "+ map.get("searchField") + " "
	               + "LIKE '%"+ map.get("searchWord")+ "%'";
	      }
	      query += " ORDER BY idx DESC LIMIT ?, ?";


		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
			psmt.setInt(2, Integer.parseInt(map.get("end").toString()));
			
			rs = psmt.executeQuery();

			while (rs.next()) {
				boardDTO dto = new boardDTO();

				dto.setIdx(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setPrice(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setImage(rs.getString(5));
				dto.setId(rs.getString(6));
				dto.setPostdate(rs.getDate(7));
				dto.setCategory(rs.getString(8));
				dto.setLocation(rs.getString(9));
				dto.setVisitcount(rs.getInt(10));
				dto.setLikecount(rs.getInt(11));
				dto.setDowncount(rs.getInt(12));
				dto.setOfile(rs.getString(13));
				dto.setSfile(rs.getString(14));
				dto.setB_flag(rs.getString(15));

				board.add(dto);
			}

		} catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}

		return board;
	}
	
	public boardDTO selectView(String idx) {

		boardDTO dto = new boardDTO();

		String query = "select * from board "
				+ " where idx = ?";

		try {

			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			rs = psmt.executeQuery();

			if (rs.next()) {
				
				dto.setIdx(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setPrice(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setImage(rs.getString(5));
				dto.setId(rs.getString(6));
				dto.setPostdate(rs.getDate(7));
				dto.setCategory(rs.getString(8));
				dto.setLocation(rs.getString(9));
				dto.setVisitcount(rs.getInt(10));
				dto.setLikecount(rs.getInt(11));
				dto.setDowncount(rs.getInt(12));
				dto.setOfile(rs.getString(13));
				dto.setSfile(rs.getString(14));
				dto.setB_flag(rs.getString(15));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	public boardDTO MultiselectView(String idx) {

		boardDTO dto = new boardDTO();

		String query = "select * from multiboard "
				+ " where idx = ?";

		try {

			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			rs = psmt.executeQuery();

			if (rs.next()) {
				
				dto.setIdx(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString(3));
				dto.setId(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setVisitcount(rs.getInt(6));
				dto.setLikecount(rs.getInt(7));
				dto.setDowncount(rs.getInt(8));
				dto.setB_flag(rs.getString(9));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	public void updateVisitCount(String idx) {

		String query = " UPDATE board SET " + " visitcount=visitcount+1 " + " WHERE idx=? ";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			psmt.executeQuery();
		} catch (Exception e) {
			System.out.println("게시물 조회수 증가 중 예외발생");
			e.printStackTrace();
		}
	}
	public void updateVisitCount2(String idx) {

		String query = " UPDATE multiboard SET " + " visitcount=visitcount+1 " + " WHERE idx=? ";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			psmt.executeQuery();
		} catch (Exception e) {
			System.out.println("게시물 조회수 증가 중 예외발생");
			e.printStackTrace();
		}
	}

	public int insertWrite(boardDTO dto) {
		int result = 0;

		try {
			String query = "INSERT INTO board " + " (id, price, location, category, title, content, ofile, sfile, b_flag ) "
					+ " VALUES(?,?,?,?,?,?,?,?,?)";

			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPrice());
			psmt.setString(3, dto.getLocation());
			psmt.setString(4, dto.getCategory());
			psmt.setString(5, dto.getTitle());
			psmt.setString(6, dto.getContent());
			psmt.setString(7, dto.getOfile());
			psmt.setString(8, dto.getSfile());
			psmt.setString(9, dto.getB_flag());
			
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	public int insertMulti(boardDTO dto) {
		int result = 0;

		try {
			String query = "INSERT INTO multiboard " + " (title, content, id, b_flag ) "
					+ " VALUES(?,?,?,?)";

			psmt = con.prepareStatement(query);
			
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getId());
			psmt.setString(4, dto.getB_flag());
			
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	public int deletePost(String idx) {
		int result = 0;
		
		try {
			String query = "DELETE FROM board WHERE idx = ? ";
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			
			result = psmt.executeUpdate();
			
		}
		catch(Exception e) {
			System.out.println("게시물 삭제 중 예외발생");
			e.printStackTrace();
		}
		return result;
	}
	public int multiDeletePost(String idx) {
		int result = 0;
		
		try {
			String query = "DELETE FROM multiboard WHERE idx = ? ";
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			
			result = psmt.executeUpdate();
			
		}
		catch(Exception e) {
			System.out.println("게시물 삭제 중 예외발생");
			e.printStackTrace();
		}
		return result;
	}
	public int updatePost(boardDTO dto) {
		int result = 0;
		
		try {
			//쿼리문 템플릿 준비
			//일련번호와 패스워드까지 where절에 추가하여 둘다 일치할 때만
			//수정 처리 된다.
			String query = "UPDATE board "
						+ " SET title=?, content=?, ofile=?, sfile=? "
						+ " WHERE idx=?";
			
			//쿼리문 준비
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getOfile());
			psmt.setString(4, dto.getSfile());
			psmt.setString(5, dto.getIdx());
			
			result = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("게시물 수정 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	public int multiUpdatePost(boardDTO dto) {
		int result = 0;
		
		try {
			String query = "UPDATE multiboard "
						+ " SET title=?, content=? "
						+ " WHERE idx=?";
			
			//쿼리문 준비
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getIdx());
			
			result = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("게시물 수정 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	public void downCountPlus(String idx) {
		String sql = " UPDATE board SET " + " downcount=downcount+1 " + " WHERE idx=? ";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, idx);
			psmt.executeUpdate();
		} 
		catch (Exception e) {
		}
	}
	public List<boardDTO> selectListMulti(Map<String, Object> map) {
		List<boardDTO> board = new Vector<boardDTO>();

		String query = " SELECT * FROM multiboard WHERE b_flag='" + map.get("b_flag")+ "'";

		if (map.get("searchWord") != null) {
			query += " and " + map.get("searchField") 
				  + " LIKE '% " + map.get("searchWord") + "%' ";
		}
		query += "ORDER BY idx DESC LIMIT ?, ?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
			psmt.setInt(2, Integer.parseInt(map.get("end").toString()));
			rs = psmt.executeQuery();

			while (rs.next()) {
				boardDTO dto = new boardDTO();

				dto.setIdx(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString(3));
				dto.setId(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setVisitcount(rs.getInt(6));
				dto.setLikecount(rs.getInt(7));
				dto.setDowncount(rs.getInt(8));
				dto.setB_flag(rs.getString(9));
				
				board.add(dto);
			}

		} catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}

		return board;
	}
}
