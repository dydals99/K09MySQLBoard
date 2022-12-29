package membership;


import java.sql.SQLException;

import common.DBConnPool;
public class MemberDAO extends DBConnPool{
	public MemberDAO() {
		super();
	}
	public MemberDTO getMemberDTO(String uid, String upass) {
		
		MemberDTO dto = new MemberDTO();
		String query = "SELECT * FROM member WHERE id=? AND pass=?";
		
		try {
			//쿼리문 실행을 위한 prepared객체 생성 및 인파라미터 설정
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			//select 쿼리문을 실행한 후 ResultSet으로 반환받는다.
			rs = psmt.executeQuery();
			
			//반환된 ResultSet객체를 통해 히원정보가 있는지 확인한다.
			if(rs.next()) {
				//정보가 있다면 DTO객체에 회원정보를 저장한다.
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString(3));
				dto.setRegidate(rs.getString(4));
				dto.setTel(rs.getString(5));
				dto.setEmail(rs.getString(6));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	public int insertMember(MemberDTO mdto) {
		int result = 0;

		try {
			String query = "insert into member " 
					+ "(id, pass, name, tel, email) " + "values (?,?,?,?,?)";

			psmt = con.prepareStatement(query);
			psmt.setString(1, mdto.getId());
			psmt.setString(2, mdto.getPass());
			psmt.setString(3, mdto.getName());
			psmt.setString(4, mdto.getTel());
			psmt.setString(5, mdto.getEmail()); 

			result = psmt.executeUpdate();

			
		}
		catch (Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	public MemberDTO selectMember(String id) {

		MemberDTO mbto = new MemberDTO();
		String query = " SELECT id,pass,name,tel,email "
				+ "	FROM member "
				+ " WHERE id = ? ";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			if (rs.next()) { // DTO 객체에 레코드를 저장한다.
				mbto.setId(rs.getString("id"));
				mbto.setPass(rs.getString("pass"));
				mbto.setName(rs.getString("name"));
				mbto.setTel(rs.getString("tel"));
				mbto.setEmail(rs.getString("email"));
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
			System.out.println("회원정보 진입중 예외발생");
		}
		return mbto;
	}
	public int updateMember(MemberDTO mdto) {
		
		int result = 0;
		
		String query = " UPDATE member SET "
				+ " pass = ? ,name = ? , tel = ?"
				+ " WHERE id = ? ";
		try {
			psmt = con.prepareStatement(query);
			 
			psmt.setString(1, mdto.getPass());
			psmt.setString(2, mdto.getName());
			psmt.setString(3, mdto.getTel());
			psmt.setString(4, mdto.getId());
			psmt.executeQuery();
			
			result = psmt.executeUpdate();
		}
		catch(Exception e) {
			
			System.out.println("회원정보 수정중 예외발생");
			e.printStackTrace();
		}
		return result;
	}
	public MemberDTO selectId(String id) {
		
		MemberDTO mbto = new MemberDTO();
		String query = " SELECT id FROM member WHERE id = ? ";
		
		try {
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				
				mbto.setId(rs.getString("id"));
				System.out.println(query);
			}
		}
		catch(Exception e) {
			
			e.printStackTrace();
			System.out.println("아이디 중복검사중 예외발생");
			
		}
		
		return mbto;
	}
	public MemberDTO findId(String name, String tel) {
		MemberDTO dto = new MemberDTO();
		try {
			 String query = "SELECT count(*), id FROM member WHERE name=? AND tel=?";
			psmt = con.prepareStatement(query );
			psmt.setString(1, name);
			psmt.setString(2, tel);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				  dto.setName(rs.getString(1));
		          dto.setId(rs.getString(2));            

			}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	public MemberDTO findPw(String id, String tel) {
		 MemberDTO dto = new MemberDTO();
		 String query = "SELECT * FROM member WHERE id=? AND tel=?";

		 try {
	         psmt = con.prepareStatement(query);
	         psmt.setString(1, id);
	         psmt.setString(2, tel);
	         rs = psmt.executeQuery();
	         
	         if(rs.next()) {
	            dto.setPass(rs.getString(2));
	         }
	      }
	      catch(Exception e) {
	         e.printStackTrace();
	      }
	      return dto;
    }
	public boolean checkId(String id) {
	      
	      String query =" select id from member where id = ?";
	      
	      try {
	         psmt = con.prepareStatement(query);
	         psmt.setString(1, id);
	         rs= psmt.executeQuery();
	         
	         if (rs.next()) {
	            System.out.println("중복아이디 있음 : " +  rs.getString("id"));
	            return false;
	            
	         }
	         
	      }
	      catch (SQLException e) {
	         e.printStackTrace();
	      }
	      
	      System.out.println("중복아이디없음");
	      return true;
	   }
	
}
