package ua.bookstore.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import ua.bookstore.entity.Book;
import ua.bookstore.entity.ShoppingCart;
import ua.bookstore.entity.User;
import ua.bookstore.service.UserService;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import java.util.List;

@Repository
public class ShoppingCartDaoImpl implements ShoppingCartDao {

    @Autowired
    private UserDao userDao;

    @PersistenceContext
    private EntityManager em;

    @Override
    public ShoppingCart save(ShoppingCart shoppingCart) {
        if (shoppingCart.isNew()) {
            em.persist(shoppingCart);
            return shoppingCart;
        } else {
            return em.merge(shoppingCart);
        }
    }

    @Override
    public void remove(int id) {
        ShoppingCart shoppingCart = em.getReference(ShoppingCart.class, id);
        em.remove(shoppingCart);
    }

    @Override
    public ShoppingCart get(int id) {
        return em.find(ShoppingCart.class, id);
    }

    @Override
    public ShoppingCart getByUserEmail(String email) {
        ShoppingCart shoppingCart;
        try {
            shoppingCart = em.createNamedQuery(ShoppingCart.GET_BY_USER_EMAIL, ShoppingCart.class).setParameter("email", email).getSingleResult();
        } catch (NoResultException ex) {
            ShoppingCart newShoppingCart = new ShoppingCart();
            User user = userDao.getByEmail(email);
            newShoppingCart.setUser(user);
            shoppingCart = save(newShoppingCart);
        }
        return shoppingCart;
    }

}
