<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Book" %>
<%@ page import="dao.BookRepository" %>
<%-- <jsp:useBean id="BookDAO" class="dao.BookRepository" scope="session" /> --%>
<!DOCTYPE html>
<html>
<head>
<link rel ="stylesheet"
	href= "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
<title>도서 목록</title>
</head>
<body>
  <jsp:include page="menu.jsp" />
  <div class="jumbotron">
    <div class="container">
      <h1 class="display-3">도서 목록</h1>
    </div>
  </div>
  <%
  	BookRepository dao = BookRepository.getInstance();
    ArrayList<Book> listofBooks = dao.getAllBooks();
  %>
  <div class="container">
    <div class="col" align="start">
      <%
        for (int i = 0; i < listofBooks.size(); i++) {
          Book Book = listofBooks.get(i);
      %>
      <div class="col">
      	<%-- <img src="./resources/images/<%=Book.getFilename()%>" --%>
      	<div class="row">
      	<h3>
      	 [
      	<%-- <img src="./resources/images/<%=Book.getCategory()%>"
      	style="width: 100%"> --%>
      	<%=Book.getCategory() %>
      	]
        <%=Book.getName()%>
        </h3>
        </div>
        <div class="w-100">
        <%=Book.getDescription() %>
        <p>
        </div>
        <p><%=Book.getAuthor()%> |
        <%=Book.getPublisher()%> |
        <%=Book.getUnitPrice()%>원
        <p> <a href="./book.jsp?id=<%=Book.getBookId()%>"
			class="btn btn-secondary" role="button"> 상세 정보 &raquo;></a>
      </div>
      <hr>
      <%
        }
      %>
    </div>
    <hr>
  </div>
  <jsp:include page="footer.jsp" />
</body>
</html>