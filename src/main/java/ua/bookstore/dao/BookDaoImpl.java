package ua.bookstore.dao;

import org.springframework.stereotype.Repository;
import ua.bookstore.entity.Book;
import ua.bookstore.entity.User;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Repository
public class BookDaoImpl implements BookDao {

    @PersistenceContext
    private EntityManager em;

    @Override
    public List<Book> getAll() {
        return em.createNamedQuery(Book.GET_ALLSORTED, Book.class).getResultList();
    }

    @Override
    public Book save(Book book) {
        if (book.isNew()){
            em.persist(book);
            return book;
        } else {
            return em.merge(book);
        }
    }

    @Override
    public void remove(int id) {
        Book book = em.getReference(Book.class, id);
        em.remove(book);
    }

    @Override
    public Book get(int id) {
        return em.find(Book.class, id);
    }
}
