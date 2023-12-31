<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Locale, java.util.ResourceBundle" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% ResourceBundle nav_resourceBundle = ResourceBundle.getBundle("message", request.getLocale());%>
	<% String login = nav_resourceBundle.getString("login");%>
	<% String logout = nav_resourceBundle.getString("logout");%>
	<% String home = nav_resourceBundle.getString("home");%>
	<% String posts= nav_resourceBundle.getString("posts");%>
	<%
		    // 세션에서 사용자 정보 확인
		    HttpSession nav_userSession = request.getSession();
		    String nav_username = (String) session.getAttribute("username");
			String loginMenu = logout;
			String loginLink = "logoutProcess.jsp";
		    // 사용자가 로그인하지 않은 경우 로그인 페이지로 리디렉션
		    if (nav_username == null) {
		    	loginMenu = login;
		    	loginLink = "login.jsp";
		    }
	%>
	<nav class="navbar navbar-expand-lg navbar-light" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="home.jsp">MyLog</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto py-4 py-lg-0">
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="home.jsp"><%=home %></a></li>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="posts.jsp"><%=posts%></a></li>
                        <li class="nav-item">
                            <a class="nav-link px-lg-3 py-3 py-lg-4" href="<%=loginLink %>"><%=loginMenu %></a>
                        </li>
                    </ul>
                </div>
            </div>
    </nav>
</body>
</html>
