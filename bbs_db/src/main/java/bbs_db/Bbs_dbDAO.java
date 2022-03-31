package bbs_db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Bbs_dbDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public Bbs_dbDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/bbs_db";
			String dbID = "root";
			String dbPassword = "root";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//글목록 불러오기
	public ArrayList<Bbs_db> getList(){
		String SQL = "SELECT * FROM border";                        
		ArrayList<Bbs_db> list = new ArrayList<Bbs_db>();
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Bbs_db bbs_db = new Bbs_db();
				bbs_db.setUserID(rs.getInt(1));
				bbs_db.setNoticeTit(rs.getString(2));
				bbs_db.setNoticeTxt(rs.getString(3));
				list.add(bbs_db);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	
	//글쓰고 저장하기
	public int write(int userID, String noticeTit, String noticeTxt) {
		String SQL = "INSERT INTO border VALUES(?,?,?)";
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, userID);
			pstmt.setString(2, noticeTit);
			pstmt.setString(3, noticeTxt);
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public Bbs_db getBorder(int userID) {
		String SQL = "SELECT * FROM border WHERE userID = ?";
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1,userID);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				Bbs_db bbs_db = new Bbs_db();
				bbs_db.setUserID(rs.getInt(1));
				bbs_db.setNoticeTit(rs.getString(2));
				bbs_db.setNoticeTxt(rs.getString(3));
				return bbs_db;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	
	
	

	


}
