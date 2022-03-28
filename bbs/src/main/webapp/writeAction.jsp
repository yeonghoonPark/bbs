<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="bbs.BbsDAO" %> <!-- 사용자 라이브러리 -->
<%@ page import="java.io.PrintWriter" %> <!-- 자바에서 자바스크립트 사용하기 위해서 -->
<% request.setCharacterEncoding("utf-8"); %> <!-- 넘어온 한글자료 깨지지 않도록 -->


<!-- class를 자바빈즈 사용함, 이름은 id에서 설정한 이름 -->
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" />
<!-- write 페이지에서 받아온 bbsTitle을 Bbs.bbsTitle에 저장 -->
<jsp:setProperty name="bbs" property="bbsTitle" />
<!-- write 페이지에서 받아온 bbsContent를 Bbs.bbsContent에 저장 -->
<jsp:setProperty name="bbs" property="bbsContent" />


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
			script.println("alert('로그인 후 작성 가능합니다. 로그인 페이지로 이동합니다')");
			script.println("location.href='./login.jsp'");
			script.println("</script>");
		}else{
	
	
			// 입력자료 확인
			if(bbs.getBbsTitle() == null || bbs.getBbsContent() == null){
				script.println("<script>");
				script.println("alert('문서 내용을 확인하세요')");
				script.println("history.back()");
				script.println("</script>");
			}else{ 
				
				BbsDAO BbsDAO = new BbsDAO();
				
				int result = BbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());
				script.println("<script>");
				
				if(result == -1){
					script.println("alert('기록 실패')");
					script.println("location.href='./main.jsp'");
				}else{
					script.println("alert('기록 성공')");
					script.println("location.href='./bbs.jsp'");
				}
				
				script.println("</script>");
			
			 } 
		}
	%>
</body>
</html>