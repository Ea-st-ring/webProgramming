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
<link rel ="stylesheet"
	href= "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link href="assets/css/styles.css" rel="stylesheet" type="text/css"/>
</head>
<body>

		<% ResourceBundle resourceBundle = ResourceBundle.getBundle("message", request.getLocale());%>
		<% String sub_title = resourceBundle.getString("sub_title");%>
		<% String writing = resourceBundle.getString("writing");%>

		<%@ include file="navbar.jsp" %>
        <!-- 헤더 -->
        <header class="masthead" style="background-image: url('assets/img/home.jpg')">
            <div class="container position-relative px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div class="site-heading">
                            <h1>📚My Log</h1>
                            <span class="subheading"> <%= sub_title %> </span>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- 글 목록 -->
        <div class="container px-4 px-lg-5">
        		<!-- 작성하기 -->

            <div class="row gx-4 gx-lg-5 justify-content-center">

                <div class="col-md-10 col-lg-8 col-xl-7">
                <div class="d-flex justify-content-end ml-5">

                    <a class="btn btn-primary text-uppercase" href="#!"><%= writing %></a>
                </div>
                    <!-- Post preview-->
                    <div class="post-preview">
                        <a href="post.jsp">
                            <h2 class="post-title">여기에 글 제목이 나올 예정이에요</h2>
                            <h3 class="post-subtitle">여긴 내용?</h3>
                        </a>
                        <p class="post-meta">
                            Posted by
                            <a href="#!">작성자</a>
                            on September 24, 2023
                        </p>
                    </div>
                    
                    <!-- Divider-->
                    <hr class="my-4" />

                    <!-- Post preview-->
                    <div class="post-preview">
                        <a href="post.jsp"><h2 class="post-title">I believe every human has a finite number of heartbeats. I don't intend to waste any of mine.</h2></a>
                        <p class="post-meta">
                            Posted by
                            <a href="#!">Start Bootstrap</a>
                            on September 18, 2023
                        </p>
                    </div>
                    
                    <!-- Divider-->
                    <hr class="my-4" />
                    
                    <!-- Post preview-->
                    <div class="post-preview">
                        <a href="post.html">
                            <h2 class="post-title">Science has not yet mastered prophecy</h2>
                            <h3 class="post-subtitle">We predict too much for the next year and yet far too little for the next ten.</h3>
                        </a>
                        <p class="post-meta">
                            Posted by
                            <a href="#!">Start Bootstrap</a>
                            on August 24, 2023
                        </p>
                    </div>
                    
                    <!-- Divider-->
                    <hr class="my-4" />
                    
                    <!-- Post preview-->
                    <div class="post-preview">
                        <a href="post.html">
                            <h2 class="post-title">Failure is not an option</h2>
                            <h3 class="post-subtitle">Many say exploration is part of our destiny, but it’s actually our duty to future generations.</h3>
                        </a>
                        <p class="post-meta">
                            Posted by
                            <a href="#!">Start Bootstrap</a>
                            on July 8, 2023
                        </p>
                    </div>
                    <!-- Divider-->
                    <hr class="my-4" />
                </div>
            </div>
        </div>
		<%@ include file="footer.jsp" %>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
</body>
</html>