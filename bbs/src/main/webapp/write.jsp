<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>웹 게시판</title>
    <style>
        *{box-sizing:border-box;margin:0;padding:0;}
        ul,ol,li{list-style:none;}
        a{color:inherit;text-decoration:none;}
        img{width:100%;vertical-align:top;}
        .clearfix::after{content:'';display:block;clear:both;}

        /* header */
        .header{
            background-color:#ccc;
        }
        .header .container{
            width:100%;
            max-width:1200px;
            margin:0 auto;
            padding:16px;
        }
        .glb-nav,.glb-nav ul{
            display:flex;
            flex-flow:row nowrap;
            justify-content:space-between;
            align-items:flex-end;
        }
        .nav-left li{
            margin-right:32px;
        }
        .nav-left li.logo{
            font-size:32px;
            font-weight:700;
            color:#fff;
        }
        .nav-right li{
            margin-right:32px;
        }
        .glb-nav ul li{
            font-size:24px;
            font-weight:500;
            color:#333;
        }
        .glb-nav ul a:hover{
            color:#fff;
        }
        .active{
            background-color:lightgreen !important;
            color:#fff !important;
        }

        /* main-sec */
        .main-sec .container{
            max-width:1200px;
            margin:0 auto;
            padding:36px 16px;
        }
        .sec-tit{
            margin-bottom:32px;
            font-weight:700;
            font-size:32px;
            color:#333;
            text-align:center;
        }
        .table{
            margin-bottom:24px;
            border-top:2px solid #333;
            border-bottom:2px solid #333;
        }
        .n-tit{
            margin-bottom:24px;
            border-bottom:1px solid #333;
        }
        #noticeTit,#noticeContent{
            width:100%;
            padding:16px;
            font-size:20px;
        }
        #noticeTit{
            font-weight:700;
        }
        #noticeContent{
            height:300px;
        }
        .g-btn{
            display:flex;
            flex-flow:row nowrap;
            justify-content:flex-end;
        }
        input[type="submit"]{
            margin-left:16px;
            border-radius:8px;
            padding:8px;
            background-color:darkgreen;
            font-weight:500;
            font-size:20px;
            color:#fff
        }
        
        /* footer */
        .footer{
            background-color:#ccc;
        }
        address{
            padding:20px;
            font-weight:700;
            font-size:24px;
            color:#fff;
            text-align:center;
        }
    </style>
</head>
<body>
    <!-- wrap -->
    <div class="wrap">
        <!-- header -->
        <header class="header">
            <div class="container">
                <nav class="nav">
                    <ul class="glb-nav">
                        <li class="nav-left">
                            <ul>
                                <li class="logo"><a href="./main.jsp">게시판 만들기</a></li>
                                <li><a href="./main.jsp">메인</a></li>
                                <li><a href="./notice.jsp" class="active">게시판</a></li>
                            </ul>
                        </li>
                        <li class="nav-right">
                            <ul>
                                <li><a href="./login.jsp">로그인</a></li>
                                <li><a href="#" style="display:none;">로그아웃</a></li>
                                <li><a href="./join.jsp">회원가입</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
        </header>
        <!-- main_sec -->
        <section class="sec main-sec">
            <div class="container">
                <div class="contents clearfix">
                    <div class="sec-tit">글작성</div>
                    <form action="#" method="post">
                        <div class="table">
                            <div class="n-tit">
                                제목
                                <br>
                                <input type="text" name="noticeTit" id="noticeTit">
                            </div>
                            <div class="n-content">
                                내용
                                <br>
                                <textarea name="noticeContent" id="noticeContent">
                                   
                                </textarea>
                            </div>
                        </div>
                        <div class="g-btn">
                            <input type="submit" value="작성 완료">
                        </div>
                    </form>
                </div>
            </div>
        </section>
        <!-- footer -->
        <footer class="footer">
            <address>
                Copyright YH
            </address>
        </footer>
    </div>
</body>
</html>