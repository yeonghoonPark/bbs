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
		  String dbID="root";
		  String dbPassword = "root";
		  Class.forName("com.mysql.cj.jdbc.Driver");
		  conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
	  }catch (Exception e){
		  e.printStackTrace();
	  }
  }
  
  
  //�α��� ���� �޼���
  public int login(User user) {
	  String SQL="SELECT userPassword FROM user WHERE userID=?";
	  try {
		  pstmt=conn.prepareStatement(SQL);
		  pstmt.setString(1, user.getUserID());
		  rs=pstmt.executeQuery();
		  if(rs.next()) {
			  //�ش� ���̵� ���翵��
			  if(rs.getString(1).equals(user.getUserPassword())) {
				  //�α��� ����
				  return 1;
			  }else {
				  //�н����� ����ġ
				  return -2;
			  }
		  }else {
			  //���̵� �������� �ʴ� ����
			  return -1;
		  }
		  
	  }catch (Exception e){
		  e.printStackTrace();
	  }
	  return -3;	  
  }
  
  
  
  // ȸ������ ���� �޼���
  public int join(User user) {
	  String SQL="INSERT INTO user VALUES(?,?,?,?,?,?,?,?);";
	  try {
		  pstmt=conn.prepareStatement(SQL);
		  
		  pstmt.setString(1, user.getUserID());
		  pstmt.setString(2, user.getUserPassword());
		  pstmt.setString(3, user.getUserName());
		  pstmt.setString(4, user.getUserAddress());
		  pstmt.setString(5, user.getUserBirthday());
		  pstmt.setString(6, user.getUserGender());
		  pstmt.setString(7, user.getUserEmail());
		  pstmt.setString(8, user.getUserPhone());	
		 
		  
		  
		    
		  
		  return  pstmt.executeUpdate();
	  }catch (Exception e){
		  e.printStackTrace();
	  }
	  return -3;	  
  }
  
  
}






