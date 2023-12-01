<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.NamingException" %>
<%@ page import="javax.sql.DataSource" %>
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

<body>
        <div class="container-fluid p-0">
        	<div class="masthead" style="background : url('assets/img/post-bg.jpg') no-repeat center center; background-size: cover; position: absolute; top: 0; left: 0; width: 100%; height: 100%; opacity:0.5; z-index:-1"></div>
            <!-- 유저 로그인 폼 컨테이너 만들기 -->
            <div style="width:100%; height:100%; justify-content: center; align-items: center; display: flex; flex-direction: column; margin-top:300px; z-index:999;">
            <%@ include file="navbar.jsp" %>
            	<div class="row justify-content-center">
            		<div class="col-lg-8 col-xl-7">
       					
							<%
							    Connection conn = null;
							    Statement stmt = null, stmt2 = null;
							    ResultSet rs = null;
							    String userId = request.getParameter("userId"); //loginSignUp.jsp에서 전송한 유저정보들을 가져옴. 
							    String userName = request.getParameter("userName");
							    String password = request.getParameter("password");
							    String userAge = request.getParameter("userAge");
							    String gender = request.getParameter("gender");
							    //out.println(userId);
							    //out.println(userName);
							    //out.println(password);
							    //out.println(userAge);
							    //out.println(gender);
							    String sql = "";
							    try {
							        // 데이터베이스 연결 설정
							        Class.forName("com.mysql.jdbc.Driver");
							        String url = "jdbc:mysql://localhost:3306/USERINFO";
							        String username = "root";
							        String sqlpassword = "1234";
							        conn = DriverManager.getConnection(url, username, sqlpassword);
							        stmt = conn.createStatement();
							        out.println("잘됨?");
							     	// "SHOW TABLES" 쿼리 실행
							        sql = "SELECT * FROM userinfo WHERE id = '" + userId + "'"; //loginSignUp.jsp에서 전송한 유저아이디를 기반으로 쿼리를 돌림. 
							        rs = stmt.executeQuery(sql);
							        
							        out.println("잘됨?2");
						        	
							        if(rs.next()){ //위에서 전송한 쿼리문으로 나오는 결과값이 있을겨우. 
							        	out.println("해당 아이디의 사용자가 이미 존재합니다.");
							        	
							        }
							        else{ //위에서 전송한 쿼리문으로 나오는 결과값이 없을경우. 
							            //여기
							            stmt2 = conn.createStatement();
							        	sql = "INSERT INTO userinfo(id, name, password, age, gender) VALUES ('" + userId + "', '" + userName + "', '" + password  + "', '" + userAge  + "', '" + gender + "')";
							        	stmt2.executeUpdate(sql);
							        	
							        	out.println("회원가입 성공! 로그인을 해주세요!");
							        }
							        stmt.close();
							        stmt2.close();
							    } catch (Exception e) {
							        e.printStackTrace();
							    }
							%>
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