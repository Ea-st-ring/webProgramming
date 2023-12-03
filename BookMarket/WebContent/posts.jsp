<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage = "errorpage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mylog</title>
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="assets/css/styles.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<!-- Navigation-->
		<%@ include file="navbar.jsp" %>
		<%@ include file="dbconn.jsp" %>		
        <!-- Page Header-->
        <header class="masthead" style="background-image: url('assets/img/post-bg.jpg')">
            <div class="container position-relative px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div class="post-heading">
                            <h1>Man must explore, and this is exploration at its greatest</h1>
                            <h2 class="subheading">Problems look mighty small from 150 miles up</h2>
                            <span class="meta">
                                Posted by
                                <a href="#!">Start MyLog</a>
                                on August 24, 2023
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
                    	<a class="btn btn-primary text-uppercase" href="posting.jsp">글 작성하기</a>
                	</div>
                	<!-- DB 연결 -->
			        <%
			        	Statement stmt = null;
			        	ResultSet rset = null;
			        	try{
			        		stmt = conn.createStatement();
			        		String username = "황동현";
			        		String query = "SELECT * FROM post where author='" + username +"' ORDER BY created_date DESC";
			        		//String query = "select * from post";
			        		rset = stmt.executeQuery(query);	
			        		// 결과 처리
			        		while(rset.next()) {
			        	  		int id = rset.getInt("id");
			        		  	String title = rset.getString("title");
			        		  	String content = rset.getString("content");
			    	    	  	String createdDate = rset.getString("created_date");
			        	  		String author = rset.getString("author");			        	
			        %>
			        <!-- 글 목록 -->
                    <div class="post-preview">
                        <a href='./post.jsp?id=<%=id%>'>
                            <h2 class="post-title"><%=title %></h2>
                            <h3 class="post-subtitle"><%=content %></h3>
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
        <script src="js/scripts.js"></script>
</body>
</html>