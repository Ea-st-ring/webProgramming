<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import = "com.oreilly.servlet.*" %>
<%@ page import = "com.oreilly.servlet.multipart.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "dto.Post" %>
<%@ page import = "dao.PostRepository" %>
<%@ page import = "java.sql.*" %>
<%@ include file = "dbconn.jsp"%>
<%
	request.setCharacterEncoding("utf-8");

	String filename = "";
	String realFolder = "C:\\upload";
	int maxSize = 5 * 1024 * 1024;
	String encType = "utf-8";
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	
	String title = multi.getParameter("title");
	String content = multi.getParameter("content");
	content = content.replace("\r\n", "<br>");
	String author = "Default";
		
	Enumeration files = multi.getFileNames();
	String file = (String)files.nextElement();
	String fileName = multi.getFilesystemName(file);
	
	java.util.Date day = new java.util.Date();
	int year = day.getYear() + 1900;
	int month = day.getMonth();
	int date = day.getDate();
	int hour = day.getHours();
	int minute = day.getMinutes();
	int second = day.getSeconds();
	String CT = hour + ":" + minute + ":" + second;
	if(hour == 0) CT = "0" + CT;
	CT = year + "-" + month + "-" + date + " " + CT; 
	
	String sql = "insert into post (title, content, created_date, author) values(?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, title);
	pstmt.setString(2, content);
	pstmt.setString(3, CT);
	pstmt.setString(4, author);
	pstmt.executeUpdate();
	
	PostRepository dao = PostRepository.getInstance();
	String id = Integer.toString(dao.getAllPosts().size());	
	response.sendRedirect("./post.jsp?id=" + id);

%>