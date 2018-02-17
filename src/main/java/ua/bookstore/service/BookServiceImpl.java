package ua.bookstore.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.bookstore.dao.BookDao;
import ua.bookstore.entity.Book;
import ua.bookstore.entity.User;

import java.util.List;

@Service
@Transactional(readOnly = true)
public class BookServiceImpl implements BookService {

    @Autowired
    private BookDao bookDao;

    @Override
    public List<Book> getAll() {
        return bookDao.getAll();
    }

    @Override
    @Transactional
    public Book save(Book book) {
        return bookDao.save(book);
    }

    @Override
    @Transactional
    public void remove(int id) {
        bookDao.remove(id);
    }

    @Override
    public Book get(int id) {
        return bookDao.get(id);
    }
}
