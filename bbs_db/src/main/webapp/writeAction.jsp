<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs_db.Bbs_dbDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("utf-8"); %>


<jsp:useBean id="bbs_db" class="bbs_db.Bbs_db" scope="page" />
<jsp:setProperty name="bbs_db" property="noticeTit" />
<jsp:setProperty name="bbs_db" property="noticeTxt" />

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>report11</title>
</head>
<body>
	<%
		PrintWriter script = response.getWriter();
		
		if(bbs_db.getNoticeTit() == null || bbs_db.getNoticeTxt() == null){
			script.println("<script>");
			script.println("alert('내용을 입력해주세요')");
			script.println("history.back()");
			script.println("</script>");
		}else{
	
			Bbs_dbDAO bbs_dbDAO = new Bbs_dbDAO();
			
			int result = bbs_dbDAO.write(bbs_db.getUserID(),bbs_db.getNoticeTit(),bbs_db.getNoticeTxt());
			script.println("<script>");
			
			if(result == -1){
				script.println("alert('데이터베이스 오류')");
				script.println("history.back()");
			}else{				
				script.println("alert('글저장이 완료되었습니다.')");
				script.println("location.href='./border.jsp'");
			}
			
			script.println("</script>");
		}
	
	%>
</body>
</html>