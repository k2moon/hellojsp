package model1.member.dao;

import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import common.JDBConnect;
import model1.member.dto.MemberDTO;

public class MemberDAO extends JDBConnect{
	
	public MemberDAO(ServletContext application) {
		super(application);
	}
	
	public List<MemberDTO> selectList() { // 게시물 목록
		List<MemberDTO> members = new ArrayList<>();	
		String sql = "SELECT id, pass, name, regidate FROM member";
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {				
				String id = rs.getString("id");
			    String pw = rs.getString("pass");
			    String name = rs.getString("name");
			    String regidate = rs.getString("regidate");
			    
			    MemberDTO member = new MemberDTO(id,pw,name,regidate);
			    members.add(member);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return members;		
	}
	
	// 데이터를 받아 DB에 추가합니다. 
    public int insertWrite(MemberDTO dto) {
        int result = 0;
        
        try {
            // INSERT 쿼리문 작성 
        	String sql = "insert into member(id, pass, name) values(?, ?, ?)";  
        	psmt = con.prepareStatement(sql);
        	psmt.setString(1, dto.getId());
        	psmt.setString(2, dto.getPass());
        	psmt.setString(3, dto.getName());

            
            result = psmt.executeUpdate(); 
        }
        catch (Exception e) {
            System.out.println("입력 중 예외 발생");
            e.printStackTrace();
        }
        
        return result;
    }
    
    // 지정한 내용을 반환합니다.
    public MemberDTO selectView(String id) { 
    	MemberDTO member = null;
        // 쿼리문 준비
        String sql = "SELECT id, pass, name, regidate FROM member where id = ?";

        try {
            psmt = con.prepareStatement(sql);
            psmt.setString(1, id);    // 인파라미터를 일련번호로 설정 
            rs = psmt.executeQuery();  // 쿼리 실행 

            // 결과 처리            
            if (rs.next()) { 
             String pw = rs.getString("pass");
             String name = rs.getString("name");
             String regidate = rs.getString("regidate");
             
             //out.println(String.format("%s %s %s %s", id, pw, name, regidate) + "<br/>");
             member = new MemberDTO(id,pw,name,regidate);     
            }
        } 
        catch (Exception e) {
            System.out.println("상세보기 중 예외 발생");
            e.printStackTrace();
        }
        
        return member; 
    }
    
    // 데이터를 받아 DB에 수정합니다. 
    public int updateEdit(MemberDTO dto) {
        int result = 0;
        
        try {
            // 쿼리문 작성 
        	String sql = "update member set pass = ?, name = ? where id = ?";  
        	psmt = con.prepareStatement(sql);  
        	psmt.setString(1, dto.getPass());
        	psmt.setString(2, dto.getName());
        	psmt.setString(3, dto.getId());

            
            result = psmt.executeUpdate(); 
        }
        catch (Exception e) {
            System.out.println("수정 중 예외 발생");
            e.printStackTrace();
        }
        
        return result;
    }
    
    public int delete(String id) {
        int result = 0;
        
        try {
            
        	String sql = "delete from member where id = ?";  
        	psmt = con.prepareStatement(sql);  
        	psmt.setString(1, id);
            
            result = psmt.executeUpdate(); 
        }
        catch (Exception e) {
            System.out.println("삭제 중 예외 발생");
            e.printStackTrace();
        }
        
        return result;
    }
    
}
