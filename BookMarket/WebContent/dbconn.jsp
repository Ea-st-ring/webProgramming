<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page errorPage = "errorpage.jsp" %>
<%
    Connection conn = null;    
    PreparedStatement pstmt = null;

    try {
        InitialContext initialContext = new InitialContext();
        String url = (String)initialContext.lookup("java:comp/env/DB_URL");
        String user = (String)initialContext.lookup("java:comp/env/DB_USER");
        String password = (String)initialContext.lookup("java:comp/env/DB_PASSWORD");

        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);
    } catch (SQLException ex) {
        out.println("SQLException: " + ex.getMessage());
    } catch (NamingException ex) {
        out.println("JNDI Lookup failed for DB_URL / DB_USER / DB_PASSWORD. " + ex.getMessage());
    } 
%>
