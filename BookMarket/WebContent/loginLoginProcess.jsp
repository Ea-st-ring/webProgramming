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
<title>로그인</title>
<link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="assets/css/styles.css" rel="stylesheet" type="text/css"/>
</head>

<body>
		<% ResourceBundle resourceBundle = ResourceBundle.getBundle("message", request.getLocale());%>
		<% String back = resourceBundle.getString("back");%>
        <div class="container-fluid p-0">
        	<div class="masthead" style="background : url('assets/img/post-bg.jpg') no-repeat center center; background-size: cover; position: absolute; top: 0; left: 0; width: 100%; height: 100%; opacity:0.4; z-index:-1"></div>
            <!-- 유저 로그인 폼 컨테이너 만들기 -->
            <div style="width:100%; height:100%; justify-content: center; align-items: center; display: flex; flex-direction: column; margin-top:300px; z-index:999;">
            <%@ include file="navbar.jsp" %>
            	<div class="row justify-content-center" style="width:500px;"> 
            		<div class="col-lg-8 col-xl-7 justify-content-center align-items-center" style="width:500px;"> 
							<%
							    Connection conn = null;
							    Statement stmt = null;
							    ResultSet rs = null;
							    String userId = request.getParameter("userId"); //loginSignUp.jsp에서 전송한 유저정보들을 가져옴. 
							    String password = request.getParameter("password");
							    //out.println(userId);
							    //out.println(password);
							    String sql = "";
							    String notice = "";
							    try {
							        // 데이터베이스 연결 설정
							        Class.forName("com.mysql.jdbc.Driver");
							        InitialContext initialContext = new InitialContext();
							        String url = (String)initialContext.lookup("java:comp/env/DB_URL");
							        String username = (String)initialContext.lookup("java:comp/env/DB_USER");
							        String sqlpassword = (String)initialContext.lookup("java:comp/env/DB_PASSWORD");
							        conn = DriverManager.getConnection(url, username, sqlpassword);
							        stmt = conn.createStatement();

							     	// "SHOW TABLES" 쿼리 실행
							        sql = "SELECT * FROM userinfo WHERE id = '" + userId + "'"; //loginSignUp.jsp에서 전송한 유저아이디를 기반으로 쿼리를 돌림. 
							        rs = stmt.executeQuery(sql);
						        	
							        if(rs.next()){ //위에서 전송한 쿼리문으로 나오는 결과값이 있을겨우. 
							        	//out.println("해당 아이디의 사용자가 존재합니다.");
							        	if (rs.getString("id").equals(userId) && rs.getString("password").equals(password)){	
							        		session.setAttribute("username", userId);
							        		response.sendRedirect("home.jsp");
							        	}else{
							        		notice = "아이디 혹은 비밀번호를 확인해 주세요";
							        	}
							        	
							        }
							        else{ //위에서 전송한 쿼리문으로 나오는 결과값이 없을경우. 
							        	notice = "아이디 혹은 비밀번호를 확인해 주세요";
							        }
							        stmt.close();
							    
							    } catch (Exception e) {
							        e.printStackTrace();
							    }
							%>
						<form action="login.jsp" method="post" style="margin-bottom:80px; width:500px; display:flex; align-items:center; justify-content:center; flex-direction:column;">
							<h4><%=notice %></h4>
							<p> 
							<button class="btn btn-sm btn-light" type="submit"><%=back %></button>	
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