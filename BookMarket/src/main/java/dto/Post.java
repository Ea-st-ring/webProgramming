package dto;

import java.io.Serializable;
import java.util.Date;

public class Post implements Serializable {

  private static final long serialVersionUID = -4274700572038677000L;

  private String postId;
  private String title;
  private String content;
  private String createdDate;
  private String author;
  private String fileName;

  public Post() {
    super();
  }

  public Post(String postId, String title, String content, String createdDate, String author) {
    this.postId = postId;
    this.title = title;
    this.content = content;
    this.createdDate = createdDate;
    this.author = author;
  }

  public String getPostId() {
    return postId;
  }

  public void setPostId(String postId) {
    this.postId = postId;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public String getCreatedDate() {
    return createdDate;
  }

  public void setCreatedDate(String createdDate) {
    this.createdDate = createdDate;
  }

  public String getAuthor() {
    return author;
  }

  public void setAuthor(String author) {
    this.author = author;
  }
  
  public String getFileName() {
	return fileName;
  }
  
  public void setFilename(String fileName) {
	  this.fileName = fileName;
  }
}
