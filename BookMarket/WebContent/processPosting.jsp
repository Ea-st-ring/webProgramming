<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import = "com.oreilly.servlet.*" %>
<%@ page import = "com.oreilly.servlet.multipart.*" %>
<%@ page import = "java.io.File" %>
<%@ page import = "java.util.*" %>
<%@ page import = "dto.Post" %>
<%@ page import = "dao.PostRepository" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "org.apache.commons.io.*"%>
<%@ include file = "dbconn.jsp"%>
<%
	request.setCharacterEncoding("utf-8");

	HttpSession posting_userSession = request.getSession();
	String author = (String) session.getAttribute("username");
	
	// 사용자가 로그인하지 않은 경우 로그인 페이지로 리디렉션
	if (author == null) {
	    response.sendRedirect("login.jsp"); // 로그인 페이지의 경로로 변경
	}
	//if there's no C:\\upload directory, error occurs - No directory
	String realFolder = "C:\\upload";
	int maxSize = 16 * 1024 * 1024;
	String encType = "utf-8";
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	
	String title = multi.getParameter("title");
	String content = multi.getParameter("content");
	content = content.replace("\r\n", "<br>");
	
	long fileSize = 0;
	String fileType = "";
	Enumeration files = multi.getFileNames();
	byte[] buf = null;
	//Get File from form
	if(files.hasMoreElements()){	
		
		String fileName = (String)files.nextElement();
		String realFileName = multi.getFilesystemName(fileName);
		
		//File to byte array
		File file = multi.getFile(fileName);
		if(file != null){
			fileSize = file.length();
			buf = FileUtils.readFileToByteArray(file);
		}
	}
	
	//Java date to JSP date
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
	
	String sql = "insert into post (title, content, created_date, author, fileBlob) values(?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, title);
	pstmt.setString(2, content);
	pstmt.setString(3, CT);
	pstmt.setString(4, author);
	pstmt.setBytes(5, buf);
	pstmt.executeUpdate();
	
	PostRepository dao = PostRepository.getInstance();
	String id = Integer.toString(dao.getAllPosts().size());	
	response.sendRedirect("./post.jsp?id=" + id);

%>
