package ua.bookstore.dao;

import org.springframework.stereotype.Repository;
import ua.bookstore.entity.Book;
import ua.bookstore.entity.Order;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Repository
public class OrderDaoImpl implements OrderDao {

    @PersistenceContext
    private EntityManager em;

    @Override
    public List<Order> getAll() {
        return em.createNamedQuery(Order.GET_ALLSORTED, Order.class).getResultList();
    }

    @Override
    public Order save(Order order) {
        if (order.isNew()) {
            em.persist(order);
            return order;
        } else {
            return em.merge(order);
        }
    }

    @Override
    public void remove(int id) {
        Order order = em.getReference(Order.class, id);
        em.remove(order);
    }

    @Override
    public Order get(int id) {
        return em.find(Order.class, id);
    }

    @Override
    public List<Order> getByUserEmail(String email) {
        return em.createNamedQuery(Order.GET_BY_EMAIL, Order.class).setParameter("email", email).getResultList();
    }
}
