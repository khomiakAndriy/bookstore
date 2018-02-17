package ua.bookstore.service;

import ua.bookstore.entity.Book;
import ua.bookstore.entity.User;

import java.util.List;

public interface BookService {
    public List<Book> getAll();

    public Book save(Book book);

    public void remove(int id);

    public Book get(int id);
}
