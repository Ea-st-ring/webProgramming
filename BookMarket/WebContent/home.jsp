<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<%@ include file="navbar.jsp" %>
        <!-- 헤더 -->
        <header class="masthead" style="background-image: url('assets/img/home-bg.jpg')">
            <div class="container position-relative px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div class="site-heading">
                            <h1>📚My Log</h1>
                            <span class="subheading">머라넣징</span>
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
                    <a class="btn btn-primary text-uppercase" href="#!">글 작성하기</a>
                </div>
                    <!-- DB 연결 -->
			        <%
			        	Statement stmt = null;
			        	ResultSet rset = null;
			        	try{
			        		stmt = conn.createStatement();
			        		String query = "SELECT * FROM post";
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
</body>
</html>