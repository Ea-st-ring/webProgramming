<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Book" %>
<%@ page import="dao.BookRepository" %>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>

<%
    request.setCharacterEncoding("UTF-8");

    String filename = "";
    String realFolder = "D:\\바탕 화면";
    int maxSize = 1024*1024*5;
    String encType = "UTF-8";

    MultipartRequest multi = new MultipartRequest(request, realFolder,
    maxSize, encType, new DefaultFileRenamePolicy());

    String bookId = multi.getParameter("bookId");
    String name = multi.getParameter("name");
    String author = multi.getParameter("author");
    String totalPages = multi.getParameter("totalPages");
    String publisher = multi.getParameter("publisher");
    String unitPrice = multi.getParameter("unitPrice");
    String releaseDate = multi.getParameter("releaseDate");
    String description = multi.getParameter("description");
    String category = multi.getParameter("category");
    String unitsInStock = multi.getParameter("unitsInStock");
    String condition = multi.getParameter("condition");

    Integer price;
    Long pages;

    if (unitPrice.isEmpty())
        price = 0;
    else
        price = Integer.valueOf(unitPrice);

    long stock;

    if (unitsInStock.isEmpty())
        stock = 0;
    else
        stock = Long.valueOf(unitsInStock);
    
    if (totalPages.isEmpty())
    	pages = Long.parseLong(totalPages);
    else
    	pages = Long.valueOf(totalPages);

    Enumeration files = multi.getFileNames();
    String fname = (String)files.nextElement();
    String fileName = multi.getFilesystemName(fname);

    BookRepository dao = BookRepository.getInstance();

    Book newBook = new Book();
    newBook.setBookId(bookId);
    newBook.setName(name);
    newBook.setUnitPrice(price);
    newBook.setDescription(description);
    newBook.setPublisher(publisher);
    newBook.setAuthor(author);
    newBook.setTotalPages(pages);
    newBook.setCategory(category);
    newBook.setUnitsInStock(stock);
    newBook.setCondition(condition);
    newBook.setReleaseDate(releaseDate);
    /* newBook.setFilename(fileName); */

    dao.addBook(newBook);

    response.sendRedirect("books.jsp");
%>