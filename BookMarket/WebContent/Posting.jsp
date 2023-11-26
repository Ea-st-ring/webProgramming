<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<link rel ="stylesheet" href= "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/styles.css" type="text/css"/>
<title>Post it</title>
</head>
<body>
	<%@ include file="navbar.jsp" %>
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
	<div class="post-preview">
		<a href='./post.jsp?id=1'>
			<h2 class="post-title">Random</h2>
				<h3 class="post-subtitle">Default</h3>
		</a>
		<p class="post-meta">
			Posted by<a href="#!">By me</a> on Sunday
		</p>
	</div>
	<div class="row gx-4 gx-lg-5 justify-content-center">
	<p>--------------------</p>
	<h4>글쓰기</h4>
	<p>--------------------</p>
	</div>
	<form name = "newPost" action = "./processPosting.jsp" class = "form-horizontal" method = "post" enctype = "multipart/form-data">

		
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="basic-addon1">제목</span>
			</div>
			<div class = "col-sm-5">
				<input type="text" name = "title" class="form-control" placeholder="여기에 제목 입력...">
			</div>
		</div>
		
		<div class = "col-md-5">
		
			<textarea id = "content" name = "content" cols = "50" rows = "10" class = "form-control" placeholder = "여기에 내용 입력..."></textarea>
		</div>
		
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text">파일 업로드</span>
			</div>
			<input type="file" name="inputGroupFile">
		</div>
		<br><br>
			<div class = "col-sm-5">
				<div class = "col-sm-4"></div>
				<input type = "submit" class = "btn btn-secondary" value = "글 올리기">
			</div>
	</form>
	<%@ include file="footer.jsp" %>
</body>
</html>
