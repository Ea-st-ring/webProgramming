package dao;

import java.util.ArrayList;

import dto.Book;

public class BookRepository {
	private ArrayList<Book> listOfBooks = new ArrayList<Book>();
	  private static BookRepository instance = new BookRepository();

	  public static BookRepository getInstance(){
	    return instance;
	  }
		
		public BookRepository(){
		    Book book1 = new Book("P1234", "HTML+ CSS", 800000);
		    book1.setDescription("4.7-inch, 1334X750 Renina HD display, 8-megapixel iSight Camera");
		    book1.setBookId("P1234");
		    book1.setPublisher("한빛미디어");
		    book1.setAuthor("황동현");
		    book1.setCategory("Smart Phone");
		    book1.setUnitsInStock(1000);
		    book1.setCondition("New");
		    book1.setCondition("New");
		    book1.setTotalPages(123);
		    book1.setReleaseDate("2023.10.08");

		    Book book2 = new Book("P1234", "자바의 정석", 800000);
		    book2.setDescription("4.7-inch, 1334X750 Renina HD display, 8-megapixel iSight Camera");
		    book2.setPublisher("Apple");
		    book2.setBookId("P1235");
		    book2.setAuthor("손재민");
		    book2.setCategory("Smart Phone");
		    book2.setUnitsInStock(1000);
		    book2.setCondition("New");
		    book2.setCondition("New");
		    book2.setTotalPages(123);
		    book2.setReleaseDate("2023.10.08");

		    listOfBooks.add(book1);
		    listOfBooks.add(book2);
		}

		public ArrayList<Book> getAllBooks() {
			return listOfBooks;
		}

		public Book getBookById(String bookId) {
			Book bookById = null;
		
		for(int i = 0; i < listOfBooks.size(); i++) {
			Book book = listOfBooks.get(i);
			if (book != null && book.getBookId() != null && book.
					getBookId().equals(bookId)) {
						bookById = book;
						break;
			}
		}
		return bookById;
		}

	  public void addBook(Book book) {
	    listOfBooks.add(book);
	  }
}
