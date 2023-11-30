<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage = "errorpage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mylog</title>
<link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="assets/css/styles.css" rel="stylesheet" type="text/css"/>
</head>
<body>
        <div class="container-fluid p-0">
        	<div class="masthead" style="background : url('assets/img/post-bg.jpg') no-repeat center center; background-size: cover; position: absolute; top: 0; left: 0; width: 100%; height: 100%; opacity:0.5; z-index:-1"></div>
            <!-- 유저 로그인 폼 컨테이너 만들기 -->
            <div style="width:100%; height:100%; justify-content: center; align-items: center; display: flex; flex-direction: column; margin-top:300px; z-index:999;">
            <%@ include file="navbar.jsp" %>
            	<div class="row justify-content-center">
            		<div class="col-lg-8 col-xl-7">  
            			<form class="form-signin" action="j_security_check" method="post">
          					<div class="form-group">
            					<label for="inputUserName" class="sr-only">User Name</label>
            					<input type="text" class="form-control" placeholder="ID" name="j_username" required autofocus>
          					</div>
          					<div class="form-group">
            					<label for="inputPassword" class="sr-only">Password</label>
            					<input type="password" class="form-control" placeholder="Password" name="j_password" required style="margin-bottom:20px">
          					</div>
          					<div class="row" style="width:500px; flex-direction:row; margin-bottom:200px;">
          						<button class="btn btn-sm btn-light" style="width:130px; height:30px; margin-left:12px;" type="submit">로그인</button>
          						<button class="btn btn-sm btn-dark" style="width:130px; height:30px; margin-left:12px" type="button">회원가입</button>
          					</div>
        				</form>       			
            		</div>
            </div>
            <%@ include file="footer.jsp"%>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
</body>
</html>