<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="user.UserDAO" %> <!-- 사용자 라이브러리 -->
<%@ page import="java.io.PrintWriter" %> <!-- 자바에서 자바스크립트 사용하기 위해서 -->
<% request.setCharacterEncoding("utf-8"); %> <!-- 넘어온 한글자료 깨지지 않도록 -->


<!-- class를 자바빈즈 사용함, 이름은 id에서 설정한 이름 -->
<jsp:useBean id="user" class="user.User" scope="page" />
<!-- join 페이지에서 받아온 userID를 User.userID에 저장 -->
<jsp:setProperty name="user" property="userID" />
<!-- join 페이지에서 받아온 userPassword를 User.userPassword에 저장 -->
<jsp:setProperty name="user" property="userPassword" />
<!-- join 페이지에서 받아온 userName을 User.userName에 저장 -->
<jsp:setProperty name="user" property="userName" />
<!-- join 페이지에서 받아온 userGender를 User.userGender에 저장 -->
<jsp:setProperty name="user" property="userGender" />
<!-- join 페이지에서 받아온 userEmail을 User.userEmail에 저장 -->
<jsp:setProperty name="user" property="userEmail" />

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>로그인</title>
</head>
<body>
	<%
		PrintWriter script = response.getWriter();
		
		// 로그인상태 확인
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
		
		// 로그인상태 일 때 재로그인 방지 
		if(userID != null){
			script.println("<script>");
			script.println("alert('현재 로그인 상태입니다.')");
			script.println("location.href='./main.jsp'");
			script.println("</script>");
		}else{
	
	
			// 입력자료 확인
			if(user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null || user.getUserGender() == null || user.getUserEmail() == null){
				script.println("<script>");
				script.println("alert('가입정보를 확인하세요')");
				script.println("history.back()");
				script.println("</script>");
			}else{ 
				
				UserDAO userDAO = new UserDAO();
				int result = userDAO.join(user.getUserID(), user.getUserPassword(), user.getUserName(), user.getUserGender(), user.getUserEmail());
				
				script.println("<script>");
				
				if(result == -1){
					script.println("alert('가입 실패')");
					script.println("history.back()");
				}else{
					session.setAttribute("userID",user.getUserID());
					script.println("alert('가입 성공')");
					script.println("location.href='./main.jsp'");
				}
				
				
				script.println("</script>");
			
			 } 
		}
	%>
</body>
</html>