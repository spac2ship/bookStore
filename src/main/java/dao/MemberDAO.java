package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


import db.DBConnection;
import dto.MemberDTO;

public class MemberDAO {
	MemberDTO dto = new MemberDTO();
	MemberDAO mDAO;
	
	public ArrayList<MemberDTO> memList = new ArrayList<MemberDTO>();
	private static MemberDAO dao;
	
	private MemberDAO(){}
	
	public static MemberDAO getInstance() {
		if(dao == null) {
			dao = new MemberDAO();
		}
		return dao;
	}
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	int su;
	
	// 회원가입
	public int memIns(MemberDTO dto) {
			
		String vId = dto.getMem_id();
        String vPwd = dto.getMem_pwd();
        String vName = dto.getMem_name();
        String vEmail = dto.getMem_email();
        String vPhone = dto.getMem_phone();
        String vAdd1 = dto.getMem_add1();
        String vAdd2 = dto.getMem_add2();
        
			
        String sql = "INSERT INTO memberT02 VALUES (?, ?, ?, ?, ?, ?, ?, SYSDATE)";
		
		try {
			conn = DBConnection.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vId);
			pstmt.setString(2, vPwd);
			pstmt.setString(3, vName);
			pstmt.setString(4, vEmail);
			pstmt.setString(5, vPhone);
			pstmt.setString(6, vAdd1);
			pstmt.setString(7, vAdd2);
			su = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			su = 0; // id 중복일 시 실패 (constraint로 걸어놔서 가능)
		} finally {
			DBConnection.close(pstmt,conn);
		}
		return su;
	}
	
	// Login
	public int memLog(MemberDTO dto) {
		// TODO Auto-generated method stub
		String vId = dto.getMem_id();
		String vPwd = dto.getMem_pwd();
	    
		String sql = "SELECT mem_id, mem_pwd FROM memberT02 WHERE mem_id = ? AND mem_pwd = ?";
			
		try {
			conn = DBConnection.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vId);
			pstmt.setString(2, vPwd);
			su = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(pstmt,conn);
		}
		return su;
	}
	
	// update
	public int memUpd(MemberDTO dto) {
	    String vId = dto.getMem_id();
	    String vPwd = dto.getMem_pwd();
	    String vName = dto.getMem_name();
	    String vEmail = dto.getMem_email();
	    String vPhone = dto.getMem_phone();
	    String vAdd1 = dto.getMem_add1();
	    String vAdd2 = dto.getMem_add2();

	    String sql = "UPDATE memberT02 SET "
	               + "mem_pwd = ?, mem_name = ?, mem_email = ?, mem_phone = ?, mem_add1 = ?, mem_add2 = ? "
	               + "WHERE mem_id = ?";

	    try {
	        conn = DBConnection.getConnection();
	        pstmt = conn.prepareStatement(sql);

	        pstmt.setString(1, vPwd);
	        pstmt.setString(2, vName);
	        pstmt.setString(3, vEmail);
	        pstmt.setString(4, vPhone);
	        pstmt.setString(5, vAdd1);
	        pstmt.setString(6, vAdd2);
	        pstmt.setString(7, vId); 

	        su = pstmt.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	        su = 0;
	    } finally {
	    	DBConnection.close(pstmt, conn);
	    }
	    return su;
	}

	
	// delete
	public int memDel(MemberDTO dto) {
		// TODO Auto-generated method stub
		String vId = dto.getMem_id();
	    String vPwd = dto.getMem_pwd();
	    
		String sql = "DELETE FROM memberT02 WHERE mem_id = ? AND mem_pwd = ?";
		
		try {
			conn = DBConnection.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vId);
			pstmt.setString(2, vPwd);
			su = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(pstmt,conn);
		}
		return su;
	}
	
	// 비밀번호 찾기
	public String memFind(MemberDTO dto) {
		// TODO Auto-generated method stub
		String vId = dto.getMem_id();
		String vEmail = dto.getMem_email();
		String vPwd = null;
	    
		String sql = "SELECT mem_pwd FROM memberT02 WHERE mem_id = ? AND mem_email = ?";
			
		try {
			conn = DBConnection.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vId);
			pstmt.setString(2, vEmail);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vPwd = rs.getString("mem_pwd");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(rs, pstmt,conn);
		}
		return vPwd;
	}
	
	// 회원 이름 가져오기
	public String memName(MemberDTO dto) {
		String vId = dto.getMem_id();
	    String name = null;
	    String sql = "SELECT mem_name FROM memberT02 WHERE mem_id = ?";
	    
	    try {
	        conn = DBConnection.getConnection();
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, vId);
	        rs = pstmt.executeQuery();
	        if (rs.next()) {
	            name = rs.getString("mem_name");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	    	DBConnection.close(rs, pstmt, conn);
	    }
	    return name;
	}
	
	// 회원 이메일 가져오기
	public String memEmail(MemberDTO dto) {
		String vId = dto.getMem_id();
	    String email = null;
	    String sql = "SELECT mem_email FROM memberT02 WHERE mem_id = ?";
	    
	    try {
	        conn = DBConnection.getConnection();
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, vId);
	        rs = pstmt.executeQuery();
	        if (rs.next()) {
	            email = rs.getString("mem_email");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	    	DBConnection.close(rs, pstmt, conn);
	    }
	    return email;
	}
	
	// ID로 회원 정보 조회 (비밀번호 제외)
	public MemberDTO getMemById(String mem_id) {
	    MemberDTO dto = null;
	    String sql = "SELECT mem_id, mem_name, mem_email, mem_phone, mem_add1, mem_add2 FROM memberT02 WHERE mem_id = ?";

	    try {
	        conn = DBConnection.getConnection();
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, mem_id);
	        rs = pstmt.executeQuery();

	        if (rs.next()) {
	            dto = new MemberDTO();
	            dto.setMem_id(rs.getString("mem_id"));
	            dto.setMem_name(rs.getString("mem_name"));
	            dto.setMem_email(rs.getString("mem_email"));
	            dto.setMem_phone(rs.getString("mem_phone"));
	            dto.setMem_add1(rs.getString("mem_add1"));
	            dto.setMem_add2(rs.getString("mem_add2"));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        DBConnection.close(rs, pstmt, conn);
	    }

	    return dto;
	}
	
	// select문 전체
	public String memSelJSON02() {
		// TODO Auto-generated method stub
		conn = DBConnection.getConnection();
		pstmt = null;
		ArrayList<MemberDTO> dtoList = new ArrayList<MemberDTO>();
		String memItem[] = {"mem_id", "mem_pwd", "mem_name", "mem_email", "mem_phone", "mem_add1", "mem_add2"};
		String text = "";
		try {
			String sql = "SELECT * FROM MEMBERT02";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);
			text = "{\"member\":[";
			
			while(rs.next()) {
				text += String.format("{\"%s\":\"%s\",\"%s\":\"%s\",\"%s\":\"%s\",\"%s\":\"%s\",\"%s\":\"%s\",\"%s\":\"%s\",\"%s\":\"%s\"},",
					memItem[0], rs.getString(memItem[0]),
					memItem[1], rs.getString(memItem[1]),
					memItem[2], rs.getString(memItem[2]),
					memItem[3], rs.getString(memItem[3]),
					memItem[4], rs.getString(memItem[4]),
					memItem[5], rs.getString(memItem[5]),
					memItem[6], rs.getString(memItem[6])
					);
			}
			text += "]}";
			String temp[] = text.split(",]}");
			text = temp[0] + "]}";
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// pstmt는 stmt(Statement) 상속관계라 DbClose 안고쳐도 사용 가능
			DBConnection.close(pstmt, conn);
		}
		return text;
	}

}
