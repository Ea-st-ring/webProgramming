<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.NamingException" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.util.Locale, java.util.ResourceBundle" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="assets/css/styles.css" rel="stylesheet" type="text/css"/>
</head>
<script>
function validateForm() {
	var userId = document.getElementById("userIdInput").value;
    var password = document.getElementById("passwordInput").value;
    var age = document.getElementById("userAge").value;

    // 아이디 유효성 검사
    var userIdRegex = /^[a-zA-Z0-9]+$/;
    if (!userIdRegex.test(userId)) {
        alert("아이디는 알파벳과 숫자로만 이루어져야 합니다.");
        return false;
    }

    // 비밀번호 유효성 검사
    var passwordRegex = /^(?=.*[a-zA-Z])(?=.*\d).{8,}$/;
    if (!passwordRegex.test(password)) {
        alert("비밀번호는 알파벳과 숫자가 적어도 하나씩은 포함되어야 합니다.");
        return false;
    }

    // 나이 유효성 검사
    var ageRegex = /^\d+$/;
    if (!ageRegex.test(age)) {
        alert("나이는 숫자로만 이루어져야 합니다.");
        return false;
    }
	
    // 유효성 검사를 통과하면 로그인 폼을 제출
    document.forms[0].submit();
}
</script>
<body>
		<% ResourceBundle resourceBundle = ResourceBundle.getBundle("message", request.getLocale());%>
		<% String sign_up = resourceBundle.getString("sign_up");%>
		<% String back = resourceBundle.getString("back");%>
		<% String id = resourceBundle.getString("id");%>
		<% String name = resourceBundle.getString("name");%>
		<% String password = resourceBundle.getString("password");%>
		<% String age = resourceBundle.getString("age");%>
		<% String gender = resourceBundle.getString("gender");%>
		<% String male = resourceBundle.getString("male");%>
		<% String female = resourceBundle.getString("female");%>				
        <div class="container-fluid p-0">
        	<div class="masthead" style="background : url('assets/img/post-bg.jpg') no-repeat center center; background-size: cover; position: absolute; top: 0; left: 0; width: 100%; height: 100%; opacity:0.4; z-index:-1"></div>
            <!-- 유저 로그인 폼 컨테이너 만들기 -->
            <div style="width:100%; height:100%; justify-content: center; align-items: center; display: flex; flex-direction: column; margin-top:100px; z-index:999;">
            <%@ include file="navbar.jsp" %>
<div class="container my-2" style="margin-bottom:80px;">
    <div class="row justify-content-center">
        <div class="col-lg-6 col-xl-5">
            <div class="card bg-transparent border-0">
                <div class="card-body">
                    <form action="loginSignUpProcess.jsp">
                        <div class="form-group">
                            <label for="userIdInput"><%=id %></label>
                            <input type="text" class="form-control" name="userId" id="userIdInput">
                        </div>
                        <div class="form-group">
                            <label for="usernameInput"><%=name %></label>
                            <input type="text" class="form-control" name="userName" id="usernameInput">
                        </div>
                        <div class="form-group">
                            <label for="passwordInput"><%=password %></label>
                            <input type="password" class="form-control" name="password" id="passwordInput">
                        </div>
                        <div class="form-group">
                            <label for="userAge"><%=age %></label>
                            <input type="text" class="form-control" name="userAge" id="userAge">
                        </div>
                        <div class="form-group">
                            <label for="gender"><%=gender %></label>
                            <select class="form-control" name="gender">
                                <option value="0"><%=male %></option>
                                <option value="1"><%=female %></option>
                            </select>
                        </div>
                    </form>
                    <div class="row" style="margin-top:36px;">
                        <div class="col-6 px-1">
                            <button class="btn btn-sm btn-light" style="width:200px; height:30px; margin-left:8px" type="button" onclick="validateForm()"><%=sign_up %></button>
                        </div>
                        <div class="col-6 px-1">
                            <form action="login.jsp" method="post">
                                <button class="btn btn-sm btn-dark" style="width:200px; height:30px; margin-left:6px"><%=back %></button>    
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
</body>
</html>