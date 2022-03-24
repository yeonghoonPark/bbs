package notice;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class NoticeDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 데이터베이스 접근개체
	public NoticeDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/bbs";
			String dbID = "root";
			String dbPassword = "root";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	// 일련번호 작성
	public int docNum() {
		String SQL = "select noticeID from notice";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1;
			}else {
				return 1;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -3;
	}
	
	// 작성일 자동 입력
	public String docDate() {
		String SQL = "select date(now())";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			return rs.getString(1);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	
	
	// 게시글 작성
	public int write(String noticeTit, String userID, String noticeContent) {
		String SQL = "insert into notice values(?, ?, ?, ?, ?);";
		try {
			
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, docNum());
			pstmt.setString(2, noticeTit);
			pstmt.setString(3, userID);
			pstmt.setString(4, noticeContent);
			pstmt.setString(5, docDate());
			
			
			return pstmt.executeUpdate();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		// 데이터베이스 오류일 시
		return -3;
	}
	
	
}


