<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage = "errorpage.jsp" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Locale, java.util.ResourceBundle" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="assets/css/styles.css" rel="stylesheet" type="text/css"/>
</head>
<body>
		<%
		    // 세션에서 사용자 정보 확인
		    HttpSession login_userSession = request.getSession();
		    String login_username = (String) session.getAttribute("username");

		    // 사용자가 로그인하지 않은 경우 로그인 페이지로 리디렉션
		    if (login_username != null) {
		        response.sendRedirect("home.jsp"); // 로그인 페이지의 경로로 변경
		    }
		%>
		<% ResourceBundle resourceBundle = ResourceBundle.getBundle("message", request.getLocale());%>
		<% String sign_in = resourceBundle.getString("sign_in");%>
		<% String sign_up = resourceBundle.getString("sign_up");%>
		<% String id = resourceBundle.getString("id");%>
		<% String password = resourceBundle.getString("password");%>
        <div class="container-fluid p-0">
        	<div class="masthead" style="background : url('assets/img/login.jpg') no-repeat center center; background-size: cover; position: absolute; top: 0; left: 0; width: 100%; height: 100%; opacity:0.5; z-index:-1"></div>
            <!-- 유저 로그인 폼 컨테이너 만들기 -->
            <div style="width:100%; height:120%; justify-content: center; align-items: center; display: flex; flex-direction: column; margin-top:300px; z-index:999;">
            <%@ include file="navbar.jsp" %>
<div class="container my-2" style="margin-bottom:280px;">
    <div class="row justify-content-center">
        <div class="col-lg-6 col-xl-5">
            <div class="card bg-transparent border-0">
                <div class="card-body">
                    <form class="form-signin" action="loginLoginProcess.jsp" method="post">
                        <div class="form-group">
                            <label for="inputUserName"><%=id %></label>
                            <input type="text" class="form-control" placeholder="ID" name="userId" required autofocus>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword"><%=password %></label>
                            <input type="password" class="form-control" placeholder="Password" name="password" required>
                        </div>
                        <div class="col-6 px-1">
                            <button class="btn btn-sm btn-light" style="width:200px; height:30px; margin-top:16px" type="submit"><%=sign_in %></button>
                        </div>
                    </form>
                    <div class="row" style="margin-top:36px;">
                        
                        <div class="col-6 px-1">
                            <form class="form-signin" action="loginSignUp.jsp" method="post">
                                <button class="btn btn-sm btn-dark" style="width:200px; height:30px; margin-left:6px; position:absolute; top:167px; left:230px;"><%=sign_up %></button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
</body>
</html>