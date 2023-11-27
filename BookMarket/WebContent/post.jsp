<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Post" %>
<%@ page import="dao.PostRepository" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mylog</title>
</head>
<link rel ="stylesheet"
	href= "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link href="assets/css/styles.css" rel="stylesheet" type="text/css"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<body>
	<%	
		String id = request.getParameter("id");
		PostRepository dao = PostRepository.getInstance();
		Post post = dao.getPostById(id);
	%>
	<!-- Navigation-->
		<%@ include file="navbar.jsp" %>
        <!-- Page Header-->
        <header class="masthead" style="background-image: url('assets/img/post-bg.jpg')">
        </header>
        <!-- Post Content-->
        
        <div class="container position-relative px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div class="post-heading">
                            <h1 class="mb-1"><%=post.getTitle() %></h1>
                            <div class="meta justify-content-start d-flex mb-5 ml-1 mt-2">
	    						<h6 style="color:gray; font-size:16px;">
	    							Posted by
	    							<a href="#!"><%=post.getAuthor() %></a>
							     	on <%=post.getCreatedDate()%>
							    </h6>
							</div>

                        </div>
                    </div>
                </div>
            </div>
        
        
        
        <article class="mb-4">
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <p><%=post.getContent() %>
                    </div>
                </div>
            </div>
        </article>
        <%@ include file="footer.jsp" %>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>

</body>
</html>