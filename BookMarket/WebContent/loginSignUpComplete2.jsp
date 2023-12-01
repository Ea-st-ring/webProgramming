<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="assets/css/styles.css" rel="stylesheet" type="text/css"/>
</head>
<script>
function validateForm() {
	var username = document.getElementById("usernameInput").value;
    var password = document.getElementById("passwordInput").value;
    var age = document.getElementById("userAge").value;

    // 아이디 유효성 검사
    var usernameRegex = /^[a-zA-Z0-9]+$/;
    if (!usernameRegex.test(username)) {
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
        <div class="container-fluid p-0">
        	<div class="masthead" style="background : url('assets/img/post-bg.jpg') no-repeat center center; background-size: cover; position: absolute; top: 0; left: 0; width: 100%; height: 100%; opacity:0.5; z-index:-1"></div>
            <!-- 유저 로그인 폼 컨테이너 만들기 -->
            <div style="width:100%; height:100%; justify-content: center; align-items: center; display: flex; flex-direction: column; margin-top:300px; z-index:999;">
            <%@ include file="navbar.jsp" %>
            	<div class="row justify-content-center">
            		<div class="col-lg-8 col-xl-7">
           			  	<p> 회원가입이 완료되었습니다. 
						<form action="login.jsp" method="post">
							<button class="btn btn btn-lg btn-success btn-block" type="submit">로그인 화면으로 돌아가기</button>	
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