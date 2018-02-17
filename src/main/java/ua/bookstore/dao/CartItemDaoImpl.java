package ua.bookstore.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import ua.bookstore.entity.Book;
import ua.bookstore.entity.CartItem;
import ua.bookstore.entity.ShoppingCart;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.math.BigDecimal;
import java.util.List;

@Repository
public class CartItemDaoImpl implements CartItemDao {

    @PersistenceContext
    private EntityManager em;

    @Autowired
    private ShoppingCartDao shoppingCartDao;

    @Autowired
    private BookDao bookDao;

    @Override
    public CartItem save(CartItem cartItem) {
        if (cartItem.isNew()) {
            em.persist(cartItem);
            return cartItem;
        } else {
            return em.merge(cartItem);
        }
    }

    @Override
    public void remove(int id) {
        CartItem cartItem = em.getReference(CartItem.class, id);
        em.remove(cartItem);
    }

    @Override
    public CartItem get(int id) {
        return em.find(CartItem.class, id);
    }

    @Override
    public void addBookToShoppingCart(String userEmail, Integer bookId, Integer bookQty) {
        Book book = bookDao.get(bookId);
        ShoppingCart shoppingCart = shoppingCartDao.getByUserEmail(userEmail);
        CartItem cartItem = new CartItem();
        cartItem.setQty(bookQty);
        cartItem.setAmount(BigDecimal.valueOf(bookQty).multiply(book.getPrice()));
        shoppingCart.setTotalAmount(shoppingCart.getTotalAmount().add(cartItem.getAmount()));
        cartItem.setBook(book);
        cartItem.setShoppingCart(shoppingCart);
        save(cartItem);
    }

    @Override
    public List<CartItem> getCartItemsByUserEmail(String userEmail) {
        return em.createNamedQuery(CartItem.GET_CART_ITEMS_BY_USER, CartItem.class).setParameter("email", userEmail).getResultList();
    }
}
