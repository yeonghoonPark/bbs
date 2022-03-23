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
        .theader{
            border-bottom:1px solid #333;
        }
        .theader,.tbody{
            display:flex;
            flex-flow:row nowrap;
            padding:16px 0;
        }
        .theader>div,.tbody>div{
            text-align:center;
        }
        .col-2{
            flex:2;
        }
        .col-6{
            flex:6;
        }
        .notice-tit{
            text-align:left !important;
        }
        button{
            float:right;
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
                    <div class="sec-tit">게시판</div>
                    <div class="table">
                        <div class="theader">
                            <div class="col-tit col-2">번호</div>
                            <div class="col-tit col-6">제목</div>
                            <div class="col-tit col-2">작성일</div>
                            <div class="col-tit col-2">작성자</div>
                        </div>
                        <div class="tbody">
                            <div class="notice-num col-2">1</div>
                            <div class="notice-tit col-6">
                                <a href="./read.jsp">문의 드립니다.</a>
                            </div>
                            <div class="notice-date col-2">2022-03-23</div>
                            <div class="notice-name col-2">111111</div>
                        </div>
                    </div>
                    <button type="button"><a href="./write.jsp">글쓰기</a></button>
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