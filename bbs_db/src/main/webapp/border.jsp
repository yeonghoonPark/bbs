<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="bbs_db.Bbs_dbDAO" %>
<%@ page import="bbs_db.Bbs_db" %>
<%@ page import="java.io.PrintWriter" %> 
<%@ page import="java.util.ArrayList" %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="./border.css">
<title>report11</title>

</head>
<body>
	<section class="wrap">
		<header>
			<div class="container">
				<h1>게시판</h1>
			</div>
		</header>
		<section class="sec notice">
			<div class="container">
				<div class="notice-h">
                    <ul>
                        <li>회원번호</li>
                        <li>제목</li>
                        <li>내용</li>
                    </ul>
                </div>
                <div class="notice-b">
                   	<%
					Bbs_dbDAO bbs_dbDAO = new Bbs_dbDAO();
                   	ArrayList<Bbs_db> list = bbs_dbDAO.getList();
					for(int idx=0;idx<list.size();idx++){
					%>
                    <ul>
                    	
                        <li><%= list.get(idx).getUserID() %></li>
                        <li><%= list.get(idx).getNoticeTit() %></li>
                        <li><a href="view.jsp?userID=<%= list.get(idx).getUserID() %>"><%= list.get(idx).getNoticeTxt() %></a></li>
                        
                    </ul>
                    <% } %>
                </div>
			</div>
		</section>
        <div class="w-box">
            <a href="./write.jsp">글쓰기</a>
        </div>
        <footer>
			<div class="container">
				<address>Copyright Park</address>
			</div>
		</footer>
	</section>
</body>
</html>