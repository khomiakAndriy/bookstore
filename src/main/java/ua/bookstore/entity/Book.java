package ua.bookstore.entity;

import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.math.BigDecimal;
import java.util.List;

@NamedQueries({
        @NamedQuery(name = Book.GET_ALLSORTED, query = "select b from Book b order by b.id desc ")
})

@Entity
@Table(name = "books")
public class Book extends AbstractEntity {

    public static final String GET_ALLSORTED = "Book.getAll";


    @NotBlank(message = "Must not be null")
    @Size(min = 5, message = "Must be longer than or equal 5")
    @Column(name = "title", nullable = false)
    private String title;

    @NotBlank(message = "Must not be null")
    @Column(name = "author", nullable = false)
    private String author;

    @NotNull(message = "Must not be null")
    @Min(value = 0)
    @Column(name = "price", nullable = false)
    private BigDecimal price;

    @NotBlank(message = "Must not be null")
    @Column(name = "isbn", nullable = false, unique = true)
    private String isbn;

    @NotBlank(message = "Must not be null")
    @Column(name = "description", nullable = false)
    private String description;

    @Transient
    private MultipartFile bookImage;

    public MultipartFile getBookImage() {
        return bookImage;
    }

    public void setBookImage(MultipartFile bookImage) {
        this.bookImage = bookImage;
    }

    public Book() {
    }

    public Book(String title, String author, BigDecimal price, String isbn, String description) {
        this.title = title;
        this.author = author;
        this.price = price;
        this.isbn = isbn;
        this.description = description;
    }


    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Book{" +
                "title='" + title + '\'' +
                ", author='" + author + '\'' +
                ", price=" + price +
                ", isbn='" + isbn + '\'' +
                ", description='" + description + '\'' +
                ", id=" + id +
                '}';
    }
}
