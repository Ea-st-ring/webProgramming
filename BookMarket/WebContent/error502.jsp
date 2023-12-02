<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page isErrorPage = "true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel ="stylesheet"
	href= "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link href="assets/css/styles.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<%@ include file="navbar.jsp" %>
        <!-- 헤더 -->
        <header class="masthead" style="background-image: url('assets/img/error.jpg')">
            <div class="container position-relative px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div class="site-heading">
                            <h2>👨‍🔧 서버의 응답이 잘못된 불량 게이트웨이입니다 👩‍🔧</h2>
                        </div>
                    </div>
                </div>
			</div>
		</header>
	<%@ include file="footer.jsp" %>
        <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
</body>
</html>