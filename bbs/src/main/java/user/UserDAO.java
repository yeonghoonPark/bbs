package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	// �����ͺ��̽� ���ٰ�ü
	public UserDAO() {
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
	
	public int login(User user) {
		String SQL = "select userPassword from user where userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				// �ش� ���̵� �����ϴ� ����
				if(rs.getString(1).equals(user.getUserPassword())) {
					// �ش� ���̵�� �н����尡 ��ġ�ϴ� ��� / �α��� ����
					return 1;
				}else {
					// ���̵�� ������ �н����尡 ����ġ�ϴ� ���
					return -2;
				}
			}else {
				// �ش� ���̵� �������� �ʴ� ����
				return -1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		// �����ͺ��̽� ������ ��
		return -3;
	}
	
	public int join(User user) {
		String SQL = "insert into user values(?, ?, ?, ?, ?, ?, ?, ?);";
		try {
			
			pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserAddress());
			pstmt.setString(5, user.getUserBirthday());
			pstmt.setString(6, user.getUserGender());
			pstmt.setString(7, user.getUserEmail());
			pstmt.setString(8, user.getUserPhone());
			
			
			return pstmt.executeUpdate();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		// �����ͺ��̽� ������ ��
		return -3;
	}
}


