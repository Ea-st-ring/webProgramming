<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Welcome</title>
<link rel ="stylesheet"
	href= "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
	<%@ include file="menu.jsp" %>
	<%! 
		String greeting = "���� �� ���θ�"; 
		String tagline = "Welcome to Book Market!";
	%>
	<div class = "jumbotron">
		<div class="container">
			<h1 class="display-3">
				<%= greeting %>
			</h1>
		</div>
	</div>
	<main role="main">
	<div class = "container">
		<div class="text-center">
			<h3>
				<%= tagline %>
			</h3>
		</div>
		<hr class="divider"/>
	</div>
	</main>
	<%@ include file="footer.jsp" %>
</body>
</html>