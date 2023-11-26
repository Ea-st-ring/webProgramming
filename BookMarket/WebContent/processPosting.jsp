<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import = "com.oreilly.servlet.*" %>
<%@ page import = "com.oreilly.servlet.multipart.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "dummy.dom.Posting" %>
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
		
	Enumeration files = multi.getFileNames();
	String file = (String)files.nextElement();
	String fileName = multi.getFilesystemName(file);
	
	
	
	
	
	Date day = new java.util.Date();
	int year = day.getYear() + 1900;
	int month = day.getMonth();
	int date = day.getDate();
	int hour = day.getHours();
	int minute = day.getMinutes();
	int second = day.getSeconds();
	String CT = hour + ":" + minute + ":" + second;
	if(hour == 0) CT = "0" + CT;
	CT = year + "-" + month + "-" + date + " " + CT; 
	
	Posting newPosting = new Posting();
	newPosting.setTitle(title);
	newPosting.setContent(content);
	newPosting.setAuthor("Default");
	newPosting.setDate(CT);
	newPosting.setFilename(fileName);
%>
<html>
<head>
<title>Posted</title>
</head>
<body>
	제목 : <%= newPosting.getTitle() %><p>
	글쓴이 : <%= newPosting.getAuthor() %><p>
	작성 시각 : <%= newPosting.getDate() %><p>
	첨부파일 : <%= newPosting.getFilename() %><p>
	내용 : <%= newPosting.getContent() %><p>
	라는 글을 작성하셨습니다.
</body>
</html>