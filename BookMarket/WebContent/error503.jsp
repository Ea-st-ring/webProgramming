<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page isErrorPage = "true" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Locale, java.util.ResourceBundle" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel ="stylesheet"
	href= "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link href="assets/css/styles.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<% ResourceBundle resourceBundle = ResourceBundle.getBundle("message", request.getLocale());%>
	<% String error_503 = resourceBundle.getString("error_503");%>
	<%@ include file="navbar.jsp" %>
        <!-- 헤더 -->
        <header class="masthead" style="background-image: url('assets/img/error.jpg')">
            <div class="container position-relative px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div class="site-heading">
                            <h2>👨‍🔧 <%= error_503 %> 👩‍🔧</h2>
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