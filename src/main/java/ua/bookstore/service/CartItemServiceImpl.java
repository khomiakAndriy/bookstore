package ua.bookstore.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.bookstore.dao.CartItemDao;
import ua.bookstore.entity.CartItem;
import ua.bookstore.entity.ShoppingCart;

import java.util.List;

@Service
@Transactional(readOnly = true)
public class CartItemServiceImpl implements CartItemService {

    @Autowired
    private CartItemDao cartItemDao;

    @Override
    @Transactional
    public CartItem save(CartItem cartItem) {
        return cartItemDao.save(cartItem);
    }

    @Override
    @Transactional
    public void remove(int id) {
        cartItemDao.remove(id);
    }

    @Override
    public CartItem get(int id) {
        return cartItemDao.get(id);
    }

    @Override
    @Transactional
    public void addBookToShoppingCart(String userEmail, Integer bookId, Integer bookQty) {
        cartItemDao.addBookToShoppingCart(userEmail, bookId, bookQty);
    }

    @Override
    public List<CartItem> getCartItemsByUserEmail(String userEmail) {
        return cartItemDao.getCartItemsByUserEmail(userEmail);
    }
}
