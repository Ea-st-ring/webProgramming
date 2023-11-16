<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Book" %>
<%@ page import="dao.BookRepository" %>
<jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel ="stylesheet"
	href= "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel ="stylesheet" href= "./resources/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">도서 정보</h1>
		</div>
	</div>
	<%
		String id = request.getParameter("id");
		BookRepository dao = BookRepository.getInstance();
		Book book = bookDAO.getBookById(id);
	%>
	<div class="container">
		<div class="row">
			<%-- <div class="col-md-5">
				<img src="./resources/images/<%=Book.getFilename()%>"
				style="width:100%" >
				<img src="./resources/images/<%=book.getFilename()%>"
      			style="width: 100%">
			</div> --%>
			<div class="col-md-6">
				<h3><%=book.getName() %></h3>
				<p><%=book.getDescription()%>
				<p> <b>도서 코드 : </b><span class="badge badge-danger">
					<%=book.getBookId() %></span>
				<p> <b>출판사</b> : <%=book.getPublisher()%>
				<p> <b>저자</b> : <%=book.getAuthor()%>
				<p> <b>분류</b> : <%=book.getCategory()%>
				<p> <b>재고 수</b> : <%=book.getUnitsInStock()%>
				<h4><%=book.getUnitPrice() %>원</h4>
				<p> <a href="#" class="btn btn-info"> 도서 주문 &raquo;</a>
				<a href="./books.jsp" class="btn btn-secondary">도서 목록 &raquo;</a>
			</div>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>