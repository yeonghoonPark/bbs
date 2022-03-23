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
        .main-sec .contents{
            max-width:320px;
            max-width:1200px;
            margin:0 auto;
            border-radius:10px;
            padding:36px;
            background-color:#c0c0c0;
        }
        
        @media (min-width:640px) {
            .main-sec .contents{
                width:560px;
            }
        }
        @media (min-width:768px) {
            .main-sec .contents{
                width:640px;
            }
        }
        @media (min-width:960px) {
            .main-sec .contents{
                width:840px;
            }
        }
        @media (min-width:1200px) {
            .main-sec .contents{
                width:1180px;
            }
        }
        @media (min-width:1680px) {
            .main-sec .contents{
                width:100%;
            }
        }

        .sec-tit{
            margin-bottom:32px;
            font-weight:700;
            font-size:32px;
            color:#333;
            text-align:center;
        }
        .sec form>div{
            margin-bottom:16px;
        }
        .sec form>div.g-btn{
            margin-bottom:0;
        }
        .sec input{
            display:inline-block;
            width:100%;
            padding:6px 10px;
            font-weight:500;
            font-size:20px;
            color:#333;
        }
        .sec input::placeholder{
            color:#333;
        }
        .u-gender{
            display:flex;
            flex-flow:row nowrap;
            justify-content:center;
        }
        .u-gender label:first-child{
            margin-right:50px;
        }
        .u-gender input{
            width:auto;
        }
        .g-btn{
            display:flex;
            flex-flow:row nowrap;
            justify-content:space-between;
        }
        .g-btn input{
            width:calc(50% - 8px);
            border:none;
            color:#fff;
        }
        input[type="submit"]{
            background-color:darkred;
        }
        input[type="reset"]{
            background-color:darkgreen;
        }
        .not-null{
            position:relative;
        }
        .not-null::after{
            content:'*';
            display:block;
            color:#f00;
            position:absolute;
            left:5px;
            top:5px;
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
                                <li><a href="./notice.jsp">게시판</a></li>
                            </ul>
                        </li>
                        <li class="nav-right">
                            <ul>
                                <li><a href="./login.jsp">로그인</a></li>
                                <li><a href="#" style="display:none;">로그아웃</a></li>
                                <li><a href="./join.jsp" class="active">회원가입</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
        </header>
        <!-- main_sec -->
        <section class="sec main-sec">
            <div class="container">
                <div class="contents">
                    <div class="sec-tit">회원가입</div>
                    <form action="#" method="post">
                        <div class="u-id not-null">
                            <input type="text" name="userID" id="userID" placeholder="아이디">
                        </div>
                        <div class="u-pass not-null">
                            <input type="password" name="userPassword" id="userPassword" placeholder="비밀번호">
                        </div>
                        <div class="u-name not-null">
                            <input type="text" name="userName" id="userName" placeholder="성명">
                        </div>
                        <div class="u-address">
                            <input type="text" name="userAddress" id="userAddress" placeholder="주소">
                        </div>
                        <div class="u-birthday">
                            <input type="text" name="userBirthday" id="userBirthday" placeholder="생년월일">
                        </div>
                        <div class="u-gender">
                            <label>
                                <input type="radio" name="userGender" id="userGender1" value="남" checked>
                                남자
                            </label>
                            <label>
                                <input type="radio" name="userGender" id="userGender2" value="여">
                                여자
                            </label>
                        </div>
                        <div class="u-email">
                            <input type="email" name="userEmail" id="userEmail" placeholder="이메일">
                        </div>
                        <div class="u-phone">
                            <input type="text" name="userPhone" id="userPhone" placeholder="전화번호">
                        </div>
                        <div class="g-btn">
                            <input type="submit" value="회원가입">
                            <input type="reset" value="취소">
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