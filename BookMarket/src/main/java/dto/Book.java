package dto;

import java.io.Serializable;

public class Book {
private static final long serialVersionUID = -4274700572038677000L;
	
	private String bookId;
	private String name;
	private Integer unitPrice;
	private String author;
	private String description;
	private String publisher;
	private String category;
	private long unitsInStock;
	private long totalPages;
	private String releaseDate;
	private String condition;
	
	public Book() {
		super();
	}
	
	public Book(String bookId, String name, Integer unitPrice) {
		this.bookId = bookId;
		this.name = name;
		this.unitPrice = unitPrice;
		
	}
	
	public String getBookId() {
		return bookId;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	
	public void setBookId(String bookId) {
		this.bookId = bookId;
	}
	
	public Integer getUnitPrice() {
		return unitPrice;
	}
	
	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}
	
	public String getAuthor() {
		return author;
	}
	
	public void setAuthor(String author) {
		this.author = author;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getPublisher() {
	    return publisher;
	  }

	  public void setPublisher(String publisher) {
	    this.publisher = publisher;
	  }

	  public String getCategory() {
	    return category;
	  }

	  public void setCategory(String category) {
	    this.category = category;
	  }

	  public long getUnitsInStock() {
	    return unitsInStock;
	  }

	  public void setUnitsInStock(long unitsInStock) {
	    this.unitsInStock = unitsInStock;
	  }

	  public String getCondition() {
	    return condition;
	  }

	  public void setCondition(String condition) {
	    this.condition = condition;
	  }
	  
	  public long getTotalPages() {
		    return totalPages;
		  }

	  public void setTotalPages(long totalPages) {
		    this.totalPages= totalPages;
		  }
	  
	  public String getReleaseDate() {
		  return releaseDate;
	  }
	  
	  public void setReleaseDate(String releaseDate) {
		  this.releaseDate = releaseDate;
	  }
}
