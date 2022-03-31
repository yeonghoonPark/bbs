<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs_db.Bbs_dbDAO" %>
<%@ page import="bbs_db.Bbs_db" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="./view.css">
<title>report11</title>

</head>
<body>
		<%
			PrintWriter script=response.getWriter();
		
			/* int userID = request.getParameter("userID"); */
			Bbs_db bbs_db = new Bbs_dbDAO().getBorder(userID);
			
			
		%>
	
	<section class="wrap">
		<header>
			<div class="container">
				<h1>게시판 글보기</h1>
			</div>
		</header>
        
        <section class="sec view">
			<div class="container">
                <div class="v-box">
                    <span class="view-t">번호 : </span>
                    <span class="view-c"><%= bbs_db.getUserID() %></span>
                    <br>
                    <span class="view-t">제목 : </span>
                    <span class="view-c"><%= bbs_db.getNoticeTit() %></span>
                    <br>
                    <span class="view-t">내용 : </span>
                    <span class="view-c"><%= bbs_db.getNoticeTxt() %></span>
                    <br>
                </div>
            </div>
		</section>
        <div class="b-box">
            <a href="./border.jsp">목록</a>
        </div>

        <footer>
			<div class="container">
				<address>Copyright Park</address>
			</div>
		</footer>
	</section>
</body>
</html>