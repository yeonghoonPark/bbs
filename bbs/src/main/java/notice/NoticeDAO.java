package notice;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class NoticeDAO {

	private Connection conn;  
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// �����ͺ��̽� ���ٰ�ü
	public NoticeDAO() {
		  try {
			  String dbURL = "jdbc:mysql://localhost:3306/bbs";
			  String dbID="root";
			  String dbPassword = "root";
			  Class.forName("com.mysql.cj.jdbc.Driver");
			  conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		  }catch (Exception e){
			  e.printStackTrace();
		  }
	}
	
	//�Ϸù�ȣ �ۼ�
	public int docNum() {
		String SQL = "SELECT noticeID FROM notice ORDER BY noticeID DESC";
		try {
			 PreparedStatement pstmt = conn.prepareStatement(SQL);
			 rs = pstmt.executeQuery();
			 if(rs.next()) {
				 return rs.getInt(1)+1;
			 }
			 return 1;			 			
		}catch (Exception e){
			  e.printStackTrace();
	    }
		return -3;
	}
	
	//�ۼ��� �ڵ� �Է�
	public String docDate() {
		String SQL ="select date(now())";
		try {
			 PreparedStatement pstmt = conn.prepareStatement(SQL);
			 rs = pstmt.executeQuery();
			 if(rs.next()) {
			 	return rs.getString(1);
			 }
		}catch (Exception e){
			  e.printStackTrace();
	    }
		return "";	
	}
	
	// �Խñ� �ۼ� 
    public int write(String noticeTit, String userID, String noticeContent) {
		  String SQL="INSERT INTO notice VALUES(?,?,?,?,?);";
		  try {
			  pstmt=conn.prepareStatement(SQL);			  
			  pstmt.setInt(1, docNum());//noticeID
			  pstmt.setString(2, noticeTit);//noticeTit			  
			  pstmt.setString(3, noticeContent);//noticeContent
			  pstmt.setString(4, userID);//noticeName
			  pstmt.setString(5, docDate()); //noticeDate
			  return  pstmt.executeUpdate();
		  }catch (Exception e) {
			  e.printStackTrace();
		  }
		  return -3;	  
	  }
	
	// �Խñ� ����Ʈ �ۼ�
    public ArrayList<Notice> noticeList(int pageNumber) {
    	String SQL = "SELECT * FROM notice WHERE noticeID < ? ORDER BY noticeID DESC LIMIT 10";
    	ArrayList<Notice> list = new ArrayList<Notice>();
    	try {
    		PreparedStatement pstmt = conn.prepareStatement(SQL);
    		pstmt.setInt(1, docNum() - (pageNumber - 1) * 10);
    		rs=pstmt.executeQuery();
    		while(rs.next()) {
    			Notice notice = new Notice();
    			notice.setNoticeID(rs.getInt(1));
    			notice.setNoticeTit(rs.getString(2));
    			notice.setNoticeContent(rs.getString(3));
    			notice.setNoticeName(rs.getString(4));
    			notice.setNoticeDate(rs.getString(5));
    			list.add(notice);
    		}
    	}catch (Exception e) {
    		e.printStackTrace();
    	}
    	return list;
    }

    // ���� ���� ������ �̵� �޼���
    public boolean nextPage(int pageNumber) {
    	String SQL = "SELECT * FROM notice WHERE noticeID < ?";
    	try {
    		PreparedStatement pstmt = conn.prepareStatement(SQL);
    		pstmt.setInt(1, docNum() - (pageNumber - 1) * 10);
    		rs=pstmt.executeQuery();
    		return true;
    	} catch(Exception e) {
    		e.printStackTrace();
    	}
    	return false;
    }
    
    // ������ �Խù� ����
    public Notice readCon(int viewID) {
    	String SQL = "SELECT * FROM notice WHERE noticeID = ?";
    	try {
    		PreparedStatement pstmt = conn.prepareStatement(SQL);
    		pstmt.setInt(1, viewID);
    		rs=pstmt.executeQuery();
    		if(rs.next()) {
    			Notice notice = new Notice();
    			notice.setNoticeID(rs.getInt(1));
    			notice.setNoticeTit(rs.getString(2));
    			notice.setNoticeContent(rs.getString(3));
    			notice.setNoticeName(rs.getString(4));
    			notice.setNoticeDate(rs.getString(5));
    			return notice;
    		}
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	return null;
    }
    
    
    
    
    
    
    
    
    
    
    
	  
}
