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
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="assets/css/styles.css" rel="stylesheet" type="text/css"/>
</head>
<body>
		<%
		    // 세션에서 사용자 정보 확인
		    HttpSession posts_userSession = request.getSession();
		    String posts_username = (String) session.getAttribute("username");

		    // 사용자가 로그인하지 않은 경우 로그인 페이지로 리디렉션
		    if (posts_username == null) {
		        response.sendRedirect("login.jsp"); // 로그인 페이지의 경로로 변경
		    }
		%>
		<% ResourceBundle resourceBundle = ResourceBundle.getBundle("message", request.getLocale());%>
		<% String writing = resourceBundle.getString("writing");%>
		<% String saying = resourceBundle.getString("saying");%>
<!-- Navigation-->
		<%@ include file="navbar.jsp" %>
		<%@ include file="dbconn.jsp" %>
        <!-- Page Header-->
        <header class="masthead" style="background-image: url('assets/img/post.jpg')">
            <div class="container position-relative px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div class="post-heading">
                            
                            <h2 class="subheading" style="line-height:42px;"><%=saying %></h2>
                            <span class="meta">
                                By - Toni Morrison
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- Post Content-->
        <div class="container px-4 px-lg-5">
        		<!-- 작성하기 -->

            <div class="row gx-4 gx-lg-5 justify-content-center">

                <div class="col-md-10 col-lg-8 col-xl-7">
                	<div class="d-flex justify-content-end ml-5">
                    	<a class="btn btn-primary text-uppercase" href="posting.jsp"><%= writing %></a>
                	</div>
                	<!-- DB 연결 -->
			        <%
			        	Statement stmt = null;
			        	ResultSet rset = null;
			        	try{
			        		stmt = conn.createStatement();
			        		String username = posts_username;
			        		String query = "SELECT id,title,content,created_date,author FROM post where author='" + username +"' ORDER BY created_date DESC";
			        		rset = stmt.executeQuery(query);
			        		// 결과 처리
			        		while(rset.next()) {
			        	  		int id = rset.getInt("id");
			        		  	String title = rset.getString("title");
			        		  	String content = rset.getString("content");
			    	    	  	String createdDate = rset.getString("created_date");
			        	  		String author = rset.getString("author");		
			        	  		// content에서 첫 번째 줄만 가져오기
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
			        		ex.printStackTrace();
			        	}
                    %>                    
                </div>
            </div>
        </div>
        <%@ include file="footer.jsp" %>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
</body>
</html>