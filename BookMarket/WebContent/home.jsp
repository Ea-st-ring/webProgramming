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
        <%@ include file="dbconn.jsp" %>
        <!-- 글 목록 -->
        <div class="container px-4 px-lg-5">
        		<!-- 작성하기 -->

            <div class="row gx-4 gx-lg-5 justify-content-center">

                <div class="col-md-10 col-lg-8 col-xl-7">
                <div class="d-flex justify-content-end ml-5">
                    <a class="btn btn-primary text-uppercase" href="./posting.jsp"><%= writing %></a>
                </div>
                    <!-- DB 연결 -->
			        <%
			        	Statement stmt = null;
			        	ResultSet rset = null;
			        	try{
			        		stmt = conn.createStatement();
			        		String query = "SELECT * FROM post ORDER BY created_date DESC";
			        		rset = stmt.executeQuery(query);	
			        		// 결과 처리
			        		while(rset.next()) {
			        	  		int id = rset.getInt("id");
			        		  	String title = rset.getString("title");
			        		  	String content = rset.getString("content");
			    	    	  	String createdDate = rset.getString("created_date");
			        	  		String author = rset.getString("author");	
			        	  		int lineBreakIndex = content.indexOf("<br>");
			                    if(lineBreakIndex != -1) {
			                        content = content.substring(0, lineBreakIndex);
			                    }
			        %>
			        <!-- 글 목록 -->
                    <div class="post-preview">
                        <a href='./post.jsp?id=<%=id%>'>
                            <h3 class="post-title" style="margin-bottom:16px;"><%=title %></h3>
                            <h5 class="post-subtitle" style="width:330px; margin-bottom:16px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"><%=content %></h5>
                        </a>
                        <p class="post-meta">
                            Posted by
                            <a href="#!"><%=author %></a>
                            on <%=createdDate %>
                        </p>
                    </div>
                    <!-- Divider-->
                    <hr class="my-4" />
                    <%
                    }
			        		} 
                   	catch (SQLException ex){
			        		out.println("글 불러오기 실패 ㅠㅠ");
			        	}
                    %>
                </div>
            </div>
        </div>
		<%@ include file="footer.jsp" %>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
</body>
</html>