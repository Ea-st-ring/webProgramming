<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<link rel ="stylesheet" href= "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/styles.css" type="text/css"/>
<link rel = "stylesheet" href = "assets/css/formAlign.css"/>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Locale, java.util.ResourceBundle" %>
<%@ page errorPage = "errorpage.jsp" %>
<title>Post it</title>
</head>
<body>

<%
    // 세션에서 사용자 정보 확인
    HttpSession userSession = request.getSession();
    String username = (String) session.getAttribute("username");

    // 사용자가 로그인하지 않은 경우 로그인 페이지로 리디렉션
    if (username == null) {
        response.sendRedirect("login.jsp"); // 로그인 페이지의 경로로 변경
    }
%>

	<% ResourceBundle resourceBundle = ResourceBundle.getBundle("message", request.getLocale());%>
	<% String sub_title = resourceBundle.getString("sub_title");%>
	<% String writing = resourceBundle.getString("writing");%>
	<% String title1 = resourceBundle.getString("title1");%>
	<% String file_upload = resourceBundle.getString("file_upload");%>
	<% String enter_title = resourceBundle.getString("enter_title");%>
	<% String enter_content = resourceBundle.getString("enter_content");%>
	<% String posting = resourceBundle.getString("posting");%>

	<%@ include file="navbar.jsp" %>
	<header class="masthead" style="background-image: url('assets/img/posting.jpg')">
		<div class="container position-relative px-4 px-lg-5">
			<div class="row gx-4 gx-lg-5 justify-content-center">
				<div class="col-md-10 col-lg-8 col-xl-7">
					<div class="site-heading">
						<h1>📚My Log</h1>
						<span class="subheading"><%= sub_title %></span>
					</div>
				</div>
			</div>
		</div>
	</header>

	<div class="row gx-4 gx-lg-5">
		<div class = "d-flex justify-content-center">
			<h4><%= writing %></h4>
		</div>

		<div class = "form-container2">
			<div class>
			<form name = "newPost" action = "./processPosting.jsp" class = "form-horizontal" method = "post" enctype = "multipart/form-data">
				<div class="input-group mb-3 col-sm-5">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1"><%= title1 %></span>
					</div>
					<input type="text" name = "title" class="form-control" placeholder="<%= enter_title%>">
				</div>

				<div class = "col-md-5">
					<textarea id = "content" name = "content" cols = "100" rows = "15" class = "form-control" placeholder = "<%= enter_content%>"></textarea>
				</div>

				<div class="input-group mb-3 padding-left-15">
					<div class="input-group-prepend">

						<span class="input-group-text">사진 업로드[최대 16MB]</span>

					</div>
					<input type="file" name="file">
				</div>

				<br><br>

				<div class = "col-sm-5">
					<div class = "col-sm-4"></div>
					<input type = "submit" class = "btn btn-secondary" value = "<%= posting%>">
				</div>
			</form>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp" %>
</body>

</html>


