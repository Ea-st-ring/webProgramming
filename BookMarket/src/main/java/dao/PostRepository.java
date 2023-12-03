package dao;

import java.sql.*;

import java.util.ArrayList;

import dto.Post;

import java.io.InputStream;
import java.io.File;
import java.io.IOException;
import java.awt.image.BufferedImage;
import javax.imageio.ImageIO;
import org.apache.commons.io.*;
import org.apache.commons.io.output.ByteArrayOutputStream;
import java.util.Base64;
import java.util.Enumeration;

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
	String url = "jdbc:mysql://localhost:3306/WebProjectDB";
	String user = "root";
	String password = "mDonghyun24!";
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
      
      String fileBase64 = null;
      InputStream in = rs.getBinaryStream("fileBlob");
      if(in != null) {
	      BufferedImage bimg = ImageIO.read(in);
	      ByteArrayOutputStream baos = new ByteArrayOutputStream();
	      if(bimg != null) {
			  ImageIO.write( bimg, "jpg", baos );
			  baos.flush();
			  byte[] imageInByteArray = baos.toByteArray();
			  fileBase64 = Base64.getEncoder().encodeToString(imageInByteArray);
	      }
		  baos.close();
		  in.close();
      }


      // Post 객체 생성 및 리스트에 추가
      Post post = new Post(id, title, content, createdDate, author, fileBase64);
      listOfPosts.add(post);
      
    }

    // 자원 해제
    rs.close();
    stmt.close();
    conn.close();
  } catch (SQLException e) {
    e.printStackTrace();
  } catch (IOException e) {
	e.printStackTrace();
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
			String url = "jdbc:mysql://localhost:3306/WebProjectDB";
			String user = "root";
			String password = "mDonghyun24!";
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
		      
		      String fileBase64 = null;
		      InputStream in = rs.getBinaryStream("fileBlob");
		      if(in != null) {
			      BufferedImage bimg = ImageIO.read(in);
			      ByteArrayOutputStream baos = new ByteArrayOutputStream();
				  ImageIO.write( bimg, "jpg", baos );
				  baos.flush();
				  byte[] imageInByteArray = baos.toByteArray();
				  fileBase64 = Base64.getEncoder().encodeToString(imageInByteArray);
				  baos.close();
				  in.close();
		      }
		      
		      postById = new Post(id, title, content, createdDate, author, fileBase64);
		    }

		    

		    // 자원 해제

		    rs.close();
		    stmt.close();
		    conn.close();
		  } catch (SQLException e) {
		    e.printStackTrace();
		  }	catch (IOException e) {
			e.printStackTrace();
		  }
	
	return postById;
	}

}
