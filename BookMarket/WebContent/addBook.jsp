<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel ="stylesheet"
	href= "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel ="stylesheet" href= "./resources/css/bootstrap.min.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
  <div class="jumbotron">
    <div class="container">
      <h1 class="display-3">도서 등록</h1>      
    </div>
  </div>
  <div class="container">
    <form name="newProduct" action="./processAddBook.jsp" 
    class="form-horizontal" method="post" enctype="multipart/form-data">
      <div class="form-group row">
        <label class="col-sm-2">도서 코드</label>
        <div class="col-sm-3">
          <input type="text" class="form-control" name="bookId">
        </div>
      </div>
      <div class="form-group row">
        <label class="col-sm-2">도서명</label>
        <div class="col-sm-3">
          <input type="text" class="form-control" name="name">
        </div>
      </div>
      <div class="form-group row">
        <label class="col-sm-2">가격</label>
        <div class="col-sm-3">
          <input type="text" class="form-control" name="unitPrice">
        </div>
      </div>
      <div class="form-group row">
        <label class="col-sm-2">저자</label>
        <div class="col-sm-5">
          <input type="text" class="form-control" name="author">
        </div>
      </div>
      <div class="form-group row">
        <label class="col-sm-2">출판사</label>
        <div class="col-sm-3">
          <input type="text" class="form-control" name="publisher">
        </div>
      </div>
      <div class="form-group row">
        <label class="col-sm-2">출판일</label>
        <div class="col-sm-3">
          <input type="text" class="form-control" name="releaseDate">
        </div>
      </div>
      <div class="form-group row">
        <label class="col-sm-2">총페이지 수</label>
        <div class="col-sm-3">
          <input type="text" class="form-control" name="totalPages">
        </div>
      </div>
      <div class="form-group row">
        <label class="col-sm-2">상세 정보</label>
        <div class="col-sm-5">
          <input type="text" class="form-control" name="description">
        </div>
      </div>
      <div class="form-group row">
        <label class="col-sm-2">분류</label>
        <div class="col-sm-3">
          <input type="text" class="form-control" name="category">
        </div>
      </div>
      <div class="form-group row">
        <label class="col-sm-2">재고 수</label>
        <div class="col-sm-3">
          <input type="text" class="form-control" name="unitsInStock">
        </div>
      </div>
      <div class="form-group row">
        <label class="col-sm-2">상태</label>
        <div class="col-sm-5">
          <input type="radio" name="condition" value="New ">
          신규 도서
          <input type="radio" name="condition" value="Old ">
          중고 도서
          <input type="radio" name="condition" value="Refurbished ">
          E-book
        </div>
      </div>
      <div class="form-group row">
        <label class="col-sm-2">이미지</label>
        <div class="col-sm-5">
          <input type="file" name="bookImage" class="form-control">
        </div>
      </div>
      <div class="form-group row">
        <div class="col-sm-offset-2 col-sm-10">
          <input type="submit" class="btn btn-primary" value="등록">
        </div>
      </div>
    </form>
  </div>
</body>
</html>