<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="./write.css">
<title>report11</title>

</head>
<body>
	<section class="wrap">
		<header>
			<div class="container">
				<h1>게시판 글쓰기</h1>
			</div>
		</header>
        
        <section class="sec write">
			<div class="container">
                <div>
                    <form method="post" action="./writeAction.jsp">
                        <div class="w-box">
                            <input type="text" placeholder="제목" class="notice-tit" name="noticeTit">
                        </div>
                        <div class="w-box">
                            <input type="text" placeholder="글내용" class="notice-txt" name="noticeTxt">
                        </div>
                        <div class="w-box">
                            <input type="submit" value="글저장" class="w-save">
                        </div>    
                    </form>
                </div>
            </div>
        </section>
        
        <footer>
			<div class="container">
				<address>Copyright Park</address>
			</div>
		</footer>
	</section>
</body>
</html>