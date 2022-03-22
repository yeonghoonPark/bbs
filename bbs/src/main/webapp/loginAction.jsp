<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="user.UserDAO" %> 
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("utf-8");%>

<jsp:useBean id="user" class="user.User"/>
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
		UserDAO userDAO = new UserDAO();
		int rst = userDAO.login(user.getUserID(),user.getUserPassword());
		PrintWriter script = response.getWriter();		
		if(rst==100){
			//로그인 성공
			script.println("<script>");
			script.println("alert('로그인 성공')");	
			// script.println("location.href='login.jsp'");
			script.println("</script>");
		}else if( rst==-100){
			//패스워드 틀림
			script.println("<script>");
			script.println("alert('비밀번호가 다릅니다.')");	
			// script.println("location.href='login.jsp'");
			script.println("</script>");
		}else if(rst==-200){
			//아이디틀림
			script.println("<script>");
			script.println("alert('아이디가 다릅니다.')");	
			// script.println("location.href='login.jsp'");
			script.println("</script>");	
		}else if(rst==-300){
			//디비오류
			script.println("<script>");
			script.println("alert('데이터베이스 오류')");	
			// script.println("location.href='login.jsp'");
			script.println("</script>");
		}
	
	
	%>
</body>
</html>