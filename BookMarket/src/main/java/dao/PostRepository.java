package dao;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.naming.NamingException;

import dto.Post;

public class PostRepository {
	
	private ArrayList<Post> listOfPosts = new ArrayList<Post>();
  private static PostRepository instance = new PostRepository();

  public static PostRepository getInstance(){
    return instance;
 }

public ArrayList<Post> getAllPosts() {
  ArrayList<Post> listOfPosts = new ArrayList<Post>();

  try {
    // 데이터베이스 연결
    InitialContext initialContext = new InitialContext();
    String url = (String)initialContext.lookup("java:comp/env/DB_URL");
    String user = (String)initialContext.lookup("java:comp/env/DB_USER");
    String password = (String)initialContext.lookup("java:comp/env/DB_PASSWORD");
    Connection conn = DriverManager.getConnection(url, user, password);

    // 게시물 조회 쿼리 실행
    Statement stmt = conn.createStatement();
    String query = "SELECT * FROM post";
    ResultSet rs = stmt.executeQuery(query);

    // 결과 처리
    while (rs.next()) {
      String id = rs.getString("id");
      String title = rs.getString("title");
      String content = rs.getString("content");
      String createdDate = rs.getString("created_date");
      String author = rs.getString("author");

      // Post 객체 생성 및 리스트에 추가
      Post post = new Post(id, title, content, createdDate, author);
      listOfPosts.add(post);
    }

    // 자원 해제
    rs.close();
    stmt.close();
    conn.close();
  } catch (SQLException e) {
    e.printStackTrace();
  }  catch (NamingException ex) {
      ex.printStackTrace();
  } 

  return listOfPosts;
}
	public Post getPostById(String postId) {
		Post postById = null;
	
//	for(int i = 0; i < listOfPosts.size(); i++) {
//		Post post = listOfPosts.get(i);
//		if (post!= null && post.getPostId() != null && post.
//				getPostId().equals(postId)) {
//					postById = post;
//					break;
//		}
//	}

		  try {
		    // 데이터베이스 연결
			InitialContext initialContext = new InitialContext();
			String url = (String)initialContext.lookup("java:comp/env/DB_URL");
			String user = (String)initialContext.lookup("java:comp/env/DB_USER");
			String password = (String)initialContext.lookup("java:comp/env/DB_PASSWORD");
		    Connection conn = DriverManager.getConnection(url, user, password);

		    // 게시물 조회 쿼리 실행
		    Statement stmt = conn.createStatement();
		    String query = "SELECT * FROM post where id =" + postId;
		    ResultSet rs = stmt.executeQuery(query);

		    // 결과 처리
		    while (rs.next()) {
		      String id = rs.getString("id");
		      String title = rs.getString("title");
		      String content = rs.getString("content");
		      String createdDate = rs.getString("created_date");
		      String author = rs.getString("author");

		      postById = new Post(id, title, content, createdDate, author);
		    }

		    // 자원 해제
		    rs.close();
		    stmt.close();
		    conn.close();
		  } catch (SQLException e) {
		    e.printStackTrace();
		  }	 catch (NamingException ex) {
			  ex.printStackTrace();
		  } 
	
	return postById;
	}

}
