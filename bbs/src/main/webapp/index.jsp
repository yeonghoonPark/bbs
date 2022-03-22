<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
	<style>
        *{box-sizing:border-box;margin:0;padding:0;}
        a{text-decoration:none;color:black;}
        
        .nav {
            margin-bottom:30px;
        }
        .nav .container{
            display:flex;
            flex-flow:row nowrap;
            justify-content:space-between;
            padding:20px;
            background-color:#999;
        }
        .nav .container a{
            color:#fff;
        }
        .nav .container a.active{font-weight:900;color:#000;}
        
    </style>
</head>
<body>
	<nav class="nav">
        <div class="container">
            <div class="notice">
                <a href="./notice.jsp">게시판</a>
            </div>
            <div class="login-join">            	
            	<a href="./login.jsp">로그인</a>
                <a href="./join.jsp">회원가입</a>
            </div>
        </div>
    </nav>
</body>
</html>